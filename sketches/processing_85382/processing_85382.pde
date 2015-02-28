
import generativedesign.*;
import java.util.List;
import java.util.Collections;
import java.util.Iterator;

import processing.pdf.*;

import controlP5.*;

XMLElement projects_reformXML;

//variable to write text file
PrintWriter writeToFile;

//class variable to store the entire XML file in the right variable formats
ArrayList projectlist;

ArrayList keysText;

//variables for finding links
student_project compareBuffer; 
student_project linkFinder;
student_project cpBuffer; 

/*>>>>>>>>>>>>>>>>>>menu variables<<<<<<<<<<<<<<<<<<<<<<<<<*/
int buttonWidth = 141;
int buttonSpace = 5;
int buttonHeight = 201;
ControlP5 cp5,cp6;

Textarea disclaim;

color buttonColor = #3BBBB2; //default
int myColor = color(255);

int c1,c2;

float n,n1;
boolean wordWeight=false;
boolean showVisualization=false;
//start with the main screen
boolean showOpeningScreen=true;
boolean showInputScreen=false;
boolean loadButtons=true;
boolean loadTextFields=true;
boolean showDisclaimer=false;
boolean loadTextField=true;
boolean showConnectScreen=false;
controlP5.Button a,b,c;
controlP5.Textfield d,e,f,g;
controlP5.Button h,i;

/*>>>>>>>>>>>>>>>>>>end menu variables<<<<<<<<<<<<<<<<<<<<<*/


/*>>>>>>>>>>>>>>>>>>VARIABLES FOR DATA VISUALIZATION INTERFACE<<<<<<<<<<<<<<<<<<<<<<<<<<<*/
ControlP5 cp7,cp8;
controlP5.Textfield search;
Textarea helpText;
Textarea nodeMoreInfoDisplay;
Textlabel nodeInfoDisplay;
controlP5.Button leave,go;

HashMap graph;
PFont font,fontA,fontB,fontC;

/*ENTER SCREEN HEIGHT HERE*/
int screenHt = 600;
int screenWd = 800;

int stageHeight = 350;  //size of the visualization stage
int stageWidth = 450;
//int minX = 1366/2-stageWidth/2;
int minX=20;
int maxX = screenWd/2+stageWidth/2;
//int minY=0;
int minY = screenHt/2-stageHeight/2-100;
int maxY = screenHt/2+stageHeight/2-100;


int boxHeight = 10;    //height of box in pixels
int border = 5;        //border around box in pixels
float speed = 2;       //speed to move nodes together, 1 = slow, 100 = fast.
float bubble = 80;    //distance nodes will try to stay apart
float curveSize = 50; //size of the curve coming out of node, 0 = no curve.
float nodeRadius = 10;

color backgroundColor = color(255);
color lineColor = color(83, 100, 105,180); //the default colour
color boxColor = #E1F5C4;//color(185, 200, 201); spring green
color hoverColor = color(255,128,0);//color(214, 150, 255);
color textColor = color(83, 100, 105);


String highlightCat =" ";
String fileName = "ccc.txt"; //name of file with connection data, expecting it in this format:
//a, b, b, b
//a, b, b, b
//a
//where each row represents one node in the graph
//a is the name of the node
//b is the name of the nodes that are outputs for the node
//there can be any number of outputs as long as they are seperated by commas.
//if there are no b's, then the node only has inputs
//inputs do not need to be stated, they are implied from the outputs.

color customColour[]={
    #FF4E50,    // Arts & Entertainment.Pink Cocktail
    #FC913A,    // Business. Orange Peach
    #F9D423,    // Computers & Internet. Above Yellow
    #EDE574,    // Culture & Politics. Very light mustard
    #E3241E,    // Gaming. Red
    #6F5846,           // Health. You&Brown
    #4E4F4B,    // Law&Crime. Basic Eggplant#822339.Nervous grey black
    #A1C5AB,     // Religion. Dirty Blue 
    #489C79,            // Recreation. Mostly green
    #05676E,            // Science&Technology. Mostly Blue
    #215096,            // Sports. away dark blue
    #0C1C36,     // Weather.Deepblackblue    
    #07060A      //unknown. Ournight black
};

String categories[]={
    "arts_entertainment",
    "business",
    "computers_internet",
    "culture_politics",
    "gaming",
    "health",
    "law_crime",
    "religion",
    "recreation",
    "science_technology",
    "sports",
    "weather",
    "unknown"
};



int numCategories = categories.length;
int[] nodeCount;

int totalNodes;
boolean drawGraphButtons=true;
boolean updateBarGraph=true;
controlP5.Button[] barGraphButton;

/*>>>>>>>>>>>>>>>>>>END VARIABLES FOR DATA VISUALIZATION INTERFACE<<<<<<<<<<<<<<<<<<<<<<<<*/

boolean allProjectsLoaded=false;
boolean allDataReady=false;
student_project linkInfoFinder;
boolean mouseReleaseOk=false;

PGraphics pg;


void setup()
{
    size(800, 600);
    background(backgroundColor);
    cp5 = new ControlP5(this);
    cp6 = new ControlP5(this);
    cp7 = new ControlP5(this);
    cp8 = new ControlP5(this);
  
    pg = createGraphics(screenWd,screenHt,JAVA2D);
  
    fontA = createFont("FreeSans.ttf", 12, true);
    font = createFont("TwentytwelveSlab-Bold.ttf",12);
    fontB = createFont("FreeSansBold.ttf",14);
    smooth();
   

    //RUN XML PARSER
    loadProjectsFromFile();
    
}

void draw()
  {
    background(backgroundColor);
  if(showOpeningScreen) {openingScreen();}
  if(showInputScreen) {inputScreen();}
  if(showDisclaimer) {communityEngage();}
  if(showVisualization)
  {
    //double-check if data is ready
    if(allDataReady==false)
      {
        textAlign(LEFT, CENTER);
        textFont(font,80);
        //fill(color(255,128,0));
        text("LOADING DATA...",width/2-400,height/2+buttonHeight);
        if(allProjectsLoaded)
            {
            loadNodes();
            allDataReady=true;
            }
      }
      //now creating visualization
      else if(allDataReady)
        {
        
        Iterator j = graph.entrySet().iterator();  // Get an iterator

        while (j.hasNext()) {
        Map.Entry me = (Map.Entry)j.next();
        ((node)me.getValue()).update();
        ((node)me.getValue()).draw();
        }
        fill(lineColor,200);
      
        if(updateBarGraph){println("beginning visualization");barGraphFreq();}
        fill(lineColor,120); 
        textAlign(LEFT, CENTER);
        textFont(font, 80);
        text("Concept",40,50);
        textFont(font,120);
        text("Connect",20,90);
        fill(lineColor,255); 
        textFont(font,14);
        text("category              ",maxX,maxY+10);
        text("|  # of projects",screenWd-textWidth("|  # of projects")-5,maxY+10);
        drawKeyBelow();
        }
    }
    
  }


void loadNodes()
{
  //create blank graph
  graph = new HashMap();
  String[] lines = loadStrings(fileName);
  //remember this if recoding
  totalNodes = lines.length;
  //add the nodes into the graph
  //for(int count=0;count<projectlist.size();count++)
  //{
   //println(projectlist.size());
  // println("FILE LENGTH");
  // println(lines.length);
  for(int i =0; i <lines.length; i++)
  {
    linkFinder = (student_project)projectlist.get(i); 
    String[] pieces = split(lines[i], ',');
    //println(pieces);
    //randomSeed(maxX);
    float startX = random(minX,maxX);
    float startY = random(minY,maxY);
    String name = trim(pieces[0]);
    
    //String classification = categories[int(random(0,numCategories))];
    String classification = linkFinder.categoryTyp;
    //println(classification);
    if(classification==null)
        graph.put(name, new node(startX, startY, nodeRadius, name, "unknown")); //array indexed by strings
    else
        graph.put(name, new node(startX, startY, nodeRadius, name, classification)); //array indexed by strings
  }
  
  //add the connections
  for(int i =0; i <lines.length; i++)
  {
    String[] pieces = split(lines[i], ',');
    
    String name = trim(pieces[0]);
    for(int j=1; j<pieces.length; j++)
    {
      String output = trim(pieces[j]);
      
      if(output != "" && output != null) 
      {
        if(graph.containsKey(name) && graph.containsKey(output))
        {
          ((node)graph.get(name)).addOutput(output);
          ((node)graph.get(output)).addInput(name);
        } else {
          println("Output/name does not match");
        }
      }
    }
  }
}
  

void mousePressed() 
{
  if(showVisualization){
    println("mouse pressed fn");
  Iterator i = graph.entrySet().iterator();

  boolean found = false;
  while (i.hasNext() && !found) {
    Map.Entry me = (Map.Entry)i.next();
    found = ((node)me.getValue()).pressed(); 
    mouseReleaseOk=true;
  }}
}

void mouseReleased() 
{
   if(showVisualization){
     if(mouseReleaseOk){
         println("mouse released fn");
  Iterator i = graph.entrySet().iterator();

  while (i.hasNext()) {
    Map.Entry me = (Map.Entry)i.next();
    ((node)me.getValue()).released(); 
  }}}
}


//To find the number of nodes in each category and display an infographic
 /*CALL THIS FUNCTION WHENEVER A NEW NODE IS ADDED TO REFRESH THE INFO*/
 void barGraphFreq()
 {
   float equalWidth = (screenWd/categories.length);
   float equalHeight = ((maxY)/categories.length);
   
   updateBarGraph=false;
   
   nodeCount = new int[numCategories];

   //take each category and count the number of nodes per category
   for(int n=0;n<numCategories;n++)
     {
        int count=0;
        Iterator o = graph.entrySet().iterator();  // Get an iterator
        while (o.hasNext()) 
        {
        Map.Entry me = (Map.Entry)o.next();
        node thisNode = (node)me.getValue();
        if((thisNode.nodeCategory).equals(categories[n])==true)
          {
            count++;
          }
        }
        nodeCount[n]=count;        
     }
     
    if(drawGraphButtons)
    {
      barGraphButton = new controlP5.Button[numCategories];
      drawGraphButtons=false;
      for(int n=0;n<numCategories;n++)
       {
       if((14*(equalWidth*nodeCount[n]/totalNodes))<(screenWd-maxX))
       //name button after node category and size it according to percentage weightage + a minimum of 5 so at least some representation is seen
       {barGraphButton[n]=cp7.addButton(categories[n]).setPosition((screenWd-(14*(equalWidth*nodeCount[n]/totalNodes))-10),(n*equalHeight))
                            .setSize(int((14*(equalWidth*nodeCount[n]/totalNodes))+11),int(equalHeight))
                            .setColorCaptionLabel(lineColor).setCaptionLabel(categories[n])
                            ;
       barGraphButton[n].getCaptionLabel().setFont(fontA).setSize(10).toUpperCase(false);
       barGraphButton[n].setColorForeground(color(lineColor));// hovercustomColour[]
       barGraphButton[n].setColorBackground(color(customColour[n]));//grey default
       barGraphButton[n].setColorActive(color(customColour[n]));//color(255,128,0));
       barGraphButton[n].captionLabel().getStyle().marginLeft = -(screenWd-maxX)+int((14*(equalWidth*nodeCount[n]/totalNodes)))+10;
       }
       else
       {barGraphButton[n]=cp7.addButton(categories[n]).setPosition((maxX),(n*equalHeight))
                            .setSize(screenWd-maxX,int(equalHeight))
                            .setColorCaptionLabel(color(255,255,255)).setCaptionLabel("damn, there seem to be a lot of these"+ "\n" +categories[n]+ "s presently")
                            ;
       barGraphButton[n].getCaptionLabel().setFont(fontA).setSize(10).toUpperCase(false);
       barGraphButton[n].setColorForeground(color(lineColor));// hovercustomColour[]
       barGraphButton[n].setColorBackground(color(customColour[n]));//grey default
       barGraphButton[n].setColorActive(color(customColour[n]));//color(255,128,0));
       barGraphButton[n].captionLabel().getStyle().marginLeft = 5;
       barGraphButton[n].captionLabel().getStyle().marginTop = -8;
       }
       //barGraphButton[n].captionLabel().setFont(fontA).setSize(12).toUpperCase(false);
       //toUpperCase(false);
       }
      helpText=cp8.addTextarea("help")
                  .setPosition(maxX-330,maxY-17)
                  .setSize(430,maxY-20)
                  .setFont(createFont("TwentytwelveSlab-Bold.ttf",14))
                  .setLineHeight(20)
                  .setColor(color(hoverColor,255))
                  .setColorBackground(color(255,0))
                  .setColorForeground(hoverColor);
                  ;
     /*helpText.setText("AN INTERACTIVE DATA VISUALIZATION" + "\n" + "\n" + "Each floating ring represents one different student project at NID GN"+ "\n" + "\n" + "Hover over projects to read." 
                        + "\n"+"\n"+"Drag to see possible conceptual links." + "\n" + "\n" +"Or click a block on the bar graph to get some perspective." + "\n"+"\n"
                        + "Find a project interesting? Think you can contribute or learn something? Why don't you have a chat with the student who's working on it and find out :) ...................................................."+"\n" + "\n"  
                        + "INSPIRED BY DISCUSSIONS WITH Dr. Jignesh Khakhar & Girish Krishnan, NID. PROTOTYPE CODED BY Shiraz Iqbal Januray 2013. VISUALIZATION BUILT ON Daniel Davis's 2010 sketch 'Directed Graph', Dynamic Relaxation. INTERFACE DEVELOPED USING" 
                        + " the ControlP5 library by Andreas Schlegel, 2012.");*/
      helpText.setText("CLICK ON A PROJECT (left) TO FIND LINKS" + "\n" + "OR A CATEGORY (right) TO SEE PROJECTS");    
      helpText.captionLabel().getStyle().marginLeft = 50; 
      //helpText.getCaptionLabel().align(ControlP5.RIGHT, ControlP5.TOP);     
      helpText.captionLabel().getStyle().marginTop = 50;      
      //helpText.setText(" ");                  
      nodeInfoDisplay = cp7.addTextlabel("info")
                    .setText("A single ControlP5 textlabel, in yellow.")
                    .setPosition(minX,maxY+70)
                    .setColorValue(lineColor)
                    .setFont(createFont("TwentytwelveSlab-Bold.ttf",16))
                    .setColor(hoverColor)
                    ;
     nodeMoreInfoDisplay = cp7.addTextarea("killme")
                  .setPosition(minX,maxY+90)
                  .setSize(width-10,120)
                  .setFont(createFont("FreeSans.ttf",14))
                  .setLineHeight(18)
                  .setColor(color(lineColor))
                  .setColorBackground(color(255,200))
                  .setColorForeground(hoverColor);
                  ;
     nodeMoreInfoDisplay.setText("dummy text");
     
    leave=cp7.addButton("leaveVisualization").setPosition(5,screenHt-45).setSize(180,40);
    leave.getCaptionLabel().setFont(font).setSize(16);
    leave.setCaptionLabel("MY ACCOUNT");
    leave.setColorForeground(color(26,81,151));//greycolor(3,187,187));//color(3,187,187));
    leave.setColorBackground(color(78,79,75));//(color(26,81,151));
    leave.setColorActive(color(255,128,0));
    leave.captionLabel().getStyle().marginTop = 1;
    leave.captionLabel().getStyle().marginLeft = 25;
    
    search= cp8.addTextfield("searcher").setPosition(maxX-5,screenHt-45).setSize(100,40).setFont(fontA).setColor(color(26,81,151)).setAutoClear(false).setColorBackground(color(lineColor,150)).setColorForeground(color(lineColor,150)).setColorCaptionLabel(255).setCaptionLabel("SEARCH");
    go=cp5.addButton("searchBut").setPosition(maxX-5+100,screenHt-45).setSize(screenWd-5-(maxX-5+100),40);
    go.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setFont(font).setSize(16);
    go.setCaptionLabel("FIND");
    go.captionLabel().getStyle().marginTop = 1;
    go.setColorForeground(color(26,81,151));
    go.setColorBackground(color(78,79,75));
    go.setColorActive(color(255,128,0));//);//color(255,128,0));
    }
    else
      {
       for(int n=0;n<numCategories;n++)
       {
       if((14*(equalWidth*nodeCount[n]/totalNodes))<(screenWd-maxX))
       {
       //check the button size stays the same
       barGraphButton[n].setPosition((screenWd-(14*(equalWidth*nodeCount[n]/totalNodes))),(n*equalHeight))
                        .setSize(int(14*(equalWidth*nodeCount[n]/totalNodes)),int(equalHeight))
                        .setColorCaptionLabel(lineColor).setCaptionLabel(categories[n])
                        ;
       barGraphButton[n].captionLabel().getStyle().marginLeft = -(screenWd-maxX)+int((14*(equalWidth*nodeCount[n]/totalNodes)));
       }
       else
       {
       barGraphButton[n]=cp7.addButton(categories[n]).setPosition((maxX),(n*equalHeight))
                            .setSize(screenWd-maxX,int(equalHeight))
                            .setColorCaptionLabel(color(255,255,255)).setCaptionLabel("damn, there seem to be a lot of these"+ "\n" +categories[n]+ "s in this data set. apologies...")
                            ;
       barGraphButton[n].getCaptionLabel().setFont(fontA).setSize(12).toUpperCase(false);                            
       barGraphButton[n].captionLabel().getStyle().marginTop = -8;                     
       }
       barGraphButton[n].setVisible(true);
       }
       helpText.setVisible(true);
       leave.setVisible(true);
              search.setVisible(true);
               go.setVisible(true);
      //helpText.setVisible(true);
      }
      nodeInfoDisplay.setVisible(false);
      nodeMoreInfoDisplay.setVisible(false);
 }
 
//graph button functions
public void arts_entertainment(int theValue) 
{
  if(mousePressed)
  {highlightCat = categories[0];}    
}

public void business(int theValue) 
{
  if(mousePressed)
  {highlightCat = categories[1];}    
}

public void computers_internet(int theValue) 
{
  if(mousePressed)
  {highlightCat = categories[2];}    
}

public void culture_politics(int theValue) 
{
  if(mousePressed)
  {highlightCat = categories[3];}    
}

public void gaming(int theValue) 
{
  if(mousePressed)
  {highlightCat = categories[4];}    
}

public void health(int theValue) 
{
  if(mousePressed)
  {highlightCat = categories[5];}    
}

public void law_crime(int theValue) 
{
  if(mousePressed)
  {highlightCat = categories[6];}    
}

public void religion(int theValue) 
{
  if(mousePressed)
  {highlightCat = categories[7];}    
}

public void recreation(int theValue) 
{
  if(mousePressed)
  {highlightCat = categories[8];}    
}

public void science_technology(int theValue) 
{
  if(mousePressed)
  {highlightCat = categories[9];}    
}

public void sports(int theValue) 
{
  if(mousePressed)
  {highlightCat = categories[10];}    
}

public void weather(int theValue) 
{
  if(mousePressed)
  {highlightCat = categories[11];}    
}

public void unknown(int theValue) 
{
  if(mousePressed)
  {highlightCat = categories[12];}    
}

public void controlEvent(ControlEvent theEvent) {}

// MAIN MENU BUTTON PRESS EVENTS

public void concept(int theValue) {
  println("a button event from concept "+theValue);
  if(mousePressed)
  {
  showOpeningScreen=false;
  //loadTextFields=true;
  showInputScreen=true;
  a.setVisible(false);
  b.setVisible(false);
  c.setVisible(false);
  if(loadTextField==false)
    {
    showDisclaimer=false;
    disclaim.setVisible(false);
    }
  }
}

public void connect(int theValue) {
  println("a button event from connect "+theValue);
  if(mousePressed)
  {
  showOpeningScreen=false;
  showInputScreen=false;
  a.setVisible(false);
  b.setVisible(false);
  c.setVisible(false);
  showVisualization=true;
  if(loadTextField==false)
    {
    showDisclaimer=false;
    disclaim.setVisible(false);
    }
  if(updateBarGraph==false)
    {
      updateBarGraph=true;
    }
  }  
}

public void community(int aValue) {
   println("a button event from commun "+aValue);
 if(mousePressed)
  {
  
  if(showDisclaimer==true) 
   { 
    showDisclaimer=false;
    disclaim.setVisible(false);
    }
  else 
    {
    showDisclaimer=true;
    //disclaim.setVisible(false);
    }
  } 
}

public void input(String theText) {}

public void submit(int theValue) 
{
  if(mousePressed)
  {
  showOpeningScreen=true;
  
  showInputScreen=false;
    d.setVisible(false);
    e.setVisible(false);
    f.setVisible(false);
    g.setVisible(false);
    h.setVisible(false);
    i.setVisible(false);
    //show opening screen buttons
    a.setVisible(true);
    b.setVisible(true);
    c.setVisible(true);
  }    
}

public void leaveVisualization(int theValue) 
{
  if(mousePressed)
  {
    showOpeningScreen=true;
    showVisualization=false;
    a.setVisible(true);
    b.setVisible(true);
    c.setVisible(true);
    for(int n=0;n<numCategories;n++)
      {
      barGraphButton[n].setVisible(false);
      }
    leave.setVisible(false);
    go.setVisible(false);
    search.setVisible(false);
    helpText.setVisible(false);
    nodeInfoDisplay.setVisible(false);
    nodeMoreInfoDisplay.setVisible(false);
  }
}

public void searchBut(int theValue) 
{
  if(mousePressed)
  {
    println("searching");
  }
}


public void back(int theValue) 
{
  if(mousePressed)
  {
  showOpeningScreen=true;
  
  showInputScreen=false;
    d.setVisible(false);
    e.setVisible(false);
    f.setVisible(false);
    g.setVisible(false);
    h.setVisible(false);
    i.setVisible(false);
    //show opening screen buttons
    a.setVisible(true);
    b.setVisible(true);
    c.setVisible(true);
  }    
}

//the opening screen
public void openingScreen(){
  if(loadButtons)
  {
  PImage[] imgCC = {loadImage("conceptN.png"),loadImage("conceptH.png"),loadImage("conceptP.png")};
  PImage[] imgCN = {loadImage("connectN.png"),loadImage("connectH.png"),loadImage("connectP.png")};
  PImage[] imgCM = {loadImage("communN.png"),loadImage("communH.png"),loadImage("communP.png")};
  loadButtons=false;
  
  a= cp5.addButton("concept").setValue(150).setPosition(width/2-3*buttonWidth/2-buttonSpace,height-buttonHeight*0.95).setImages(imgCC).updateSize();
  b= cp5.addButton("connect").setValue(128).setPosition(width/2-buttonWidth/2,height-buttonHeight*0.95).setImages(imgCN).updateSize();
  c= cp5.addButton("community").setValue(128).setPosition(width/2+buttonWidth/2+buttonSpace,height-buttonHeight*0.95).setImages(imgCM).updateSize();
  }
  showOpeningScreen=true;
  loadButtons=false;
  //fill(#215096);
  
  
  fill(78,79,75); 
        textAlign(LEFT, CENTER);
  textFont(font,48);      
  text("CONCEPT CONNECT",((screenWd/2)-5-textWidth("CONCEPT CONNECT")/2),screenHt/2+50);
  
  textFont(fontB, 127);
  fill(color(hoverColor,90)); //(78,79,75)
  text("a platform for",-10,20);
  fill(color(hoverColor,120));
  textFont(fontB, 90);
  text("design collaboration",-40,70);
  /*fill(color(lineColor,180));
  textFont(fontA,16);      
  text("INSPIRED BY DISCUSSIONS WITH",((1366/2)+textWidth("CONCEPT CONNECT")*1.75),768/2);
  text("Dr. Jignesh Khakhar & Girish Krishnan, NID.",((1366/2)+textWidth("CONCEPT CONNECT")*1.75),768/2+20);
  text("Prototype coded by Shiraz Iqbal Januray 2013.",((1366/2)+textWidth("CONCEPT CONNECT")*1.75),768/2+40);
  text("Visualization built on Daniel Davis's",((1366/2)+textWidth("CONCEPT CONNECT")*1.75),768/2+60);
  text("Directed Graph, Dynamic Relaxation 2010.",((1366/2)+textWidth("CONCEPT CONNECT")*1.75),768/2+80); 
  text("Thanks A. Schlegel 2012, for the ControlP5 lib ",((1366/2)+textWidth("CONCEPT CONNECT")*1.75),768/2+100);*/
}



//the input screen
public void inputScreen()
  {
    int setFieldX=int(width/2-350);
    if(loadTextFields)
      {
         
     e= cp6.addTextfield("entry2").setPosition(setFieldX,250).setSize(500,40).setFont(fontA).setAutoClear(false).setColorCaptionLabel(0).setCaptionLabel("Conceptual Area Explored");
     f= cp6.addTextfield("entry3").setPosition(setFieldX,330).setSize(500,40).setFont(fontA).setAutoClear(false).setColorCaptionLabel(0).setCaptionLabel("Why It's Fun");
     g= cp6.addTextfield("entry4").setPosition(setFieldX,410).setSize(500,40).setFont(fontA).setAutoClear(false).setColorCaptionLabel(0).setCaptionLabel("Hurdles To Cross");
     d= cp6.addTextfield("entry1").setPosition(setFieldX,490).setSize(300,40).setFont(fontA).setAutoClear(false).setColorCaptionLabel(0).setCaptionLabel("Project Title");
     
    d.captionLabel().setFont(fontA).setSize(12).toUpperCase(false);
    e.captionLabel().setFont(fontA).setSize(12).toUpperCase(false);
    f.captionLabel().setFont(fontA).setSize(12).toUpperCase(false);
    g.captionLabel().setFont(fontA).setSize(12).toUpperCase(false);
    
   
    h=cp5.addButton("submit").setPosition(setFieldX+500-80,490).setSize(80,40);
    h.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER).setFont(font).setSize(14);
    h.setColorForeground(color(26,81,151));
    h.setColorBackground(color(255,128,0));
    h.setColorActive(color(78,79,75));//);//color(255,128,0));
    
    i=cp5.addButton("back").setPosition(width-200,250).setSize(150,200);
    i.getCaptionLabel().setFont(font).setSize(24);
    i.setCaptionLabel("whoops"+"\n"+"\n"+"\n"+"\n"+"go back"+"\n"+"\n"+"\n"+"\n"+"to menu");
    i.setColorForeground(color(255,128,0));//greycolor(3,187,187));//color(3,187,187));
    i.setColorBackground(color(26,81,151));
    i.setColorActive(color(78,79,75));//);//color(255,128,0));
    i.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
    i.captionLabel().getStyle().marginTop = -40;
    //i.captionLabel().getStyle().marginLeft = 18;
    }
  d.setVisible(true);
    e.setVisible(true);
      f.setVisible(true);
        g.setVisible(true);
          h.setVisible(true);
            i.setVisible(true);
  loadTextFields=false;
  fill(#3BBBB2);
          fill(78,79,75,120); 
        textAlign(LEFT, CENTER);
        textFont(font, 80);
        text("add",40,60);
        textFont(font,120);
        text("project",20,90);
   textFont(fontB, 12);
  textAlign(LEFT, CENTER);
  text("PLEASE MAKE SURE YOU ARE SIGNED IN WITH THE RIGHT USER ID.",setFieldX,200);
  text("CONTACT DETAILS WILL BE ASSIGNED BASED ON THE LOGIN.",setFieldX,215);
  drawKeyBelow();
  }


public void communityEngage()
{
  if(loadTextField)
  {
    loadTextField=false;
  disclaim=cp6.addTextarea("txt")
                  .setPosition(width/2-3*buttonWidth/2-buttonSpace,(screenHt-buttonHeight*1.8))
                  .setSize(430,80)
                  .setFont(createFont("FreeSans.ttf",14))
                  .setLineHeight(14)
                  .setColor(color(hoverColor,180))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100));
                  ;
  disclaim.setText("This feature is unavailable in the prototype. It is an avatar management center. Each student has a " 
                    +  "virtual character that can gain experience points for collaboration & contributions "
                    +  "to others' projects. Here, students can forge new project links, acknowledge "
                    +  "a contribution made to their project by others and select avatar (personal) attributes he/she wants to "
                    +  "work on developing.These could be anything viz. graphic design skills, electronics, hacking skills etc. Once the community"
                    + " figures out universally acceptable systems of exchange and recognition for services"
                    + " rendered, it is expected that a tool such as this will optimise the time spent acquiring"
                    + " skill sets, and contribute to higher quality of finished projects in the college"
                    + " The community of students then becomes a game world."
                    );

   }
 showDisclaimer=true;
 disclaim.setVisible(true);
}

void drawKeyBelow(){
   int keyBoxWidth=0;
   int locX=0;
 
  for (int u=0;u<13;u++){
  keyBoxWidth = (screenWd/13+1);
  locX += keyBoxWidth;
  noStroke();
  
  fill(customColour[u]);
  rect(locX-keyBoxWidth, screenHt-10, keyBoxWidth, 11);
  
  }
  
}




