
import java.awt.event.KeyEvent; 

PShape s;
float scaleFactor = 1.0;
boolean zoomIn = false;
boolean zoomOut = false;
boolean moveUp = false;
boolean moveDown = false;
boolean moveLeft = false;
boolean moveRight = false;
boolean pause = false;
boolean charts=false;
int mapX = 0;
int mapY = 0;
color oceanColor = color(177, 207, 231);
color borderColor = color(0, 153, 204);
color boxColor = color(255, 255, 150);
color tempColor;
String [] flagFileNames;
String [] lines;

PFont capitalsRegular;
PFont helvetica;
PFont helveticaBold;

PImage girl;
PImage boy;
int prevCountry=0;
int chartWidth=400;
int chartHeight = 400;
int chartY=250;

float r,g,b;

int menuWidth=480;
int menuHeight=680;
int menuX=1010;
int menuY=10;
int leftBound = 1050;

String tempLine;
String tempLine2;
String tempLine3;
String [] tempArray;
String [] tempArray2;
String [] tempArray3;
String temp;
String temp2;
String temp3;

color c;
color currentColor;
int rVal, bVal, gVal;
ArrayList flagArray = new ArrayList();

float ellipseW=5;

void setup() {
  size(1500, 700);
  s= loadShape("vectorworldmap.svg");
  
  capitalsRegular = loadFont("CapitalsRegular-60.vlw");
  helvetica = loadFont("HelveticaNeue-20.vlw");
  helveticaBold = loadFont("Helvetica-Bold-60.vlw");
  
  lines= loadStrings("BMI.csv");
  flagFileNames = new String[lines.length];
  girl = loadImage("female.png");
  boy = loadImage("male.png");
  girl.resize(65,130);
  boy.resize(65,130);
  
  for (int i=0;i<lines.length;i++){
    tempLine = lines[i];
    tempArray = split(tempLine,',');
    temp = tempArray[0] + ".svg.png";
    flagFileNames[i]=temp;
    flagArray.add( loadImage(flagFileNames[i]) );
  }
      
}

void draw() {
  background(255);
  scaleFactor = constrain(scaleFactor, 1.0, 4.0);
  pushMatrix();

  translate(width/2, height/2);
  scale(scaleFactor);
  translate(-width/2, -height/2);

  translate(mapX*(scaleFactor-1.0f), mapY*(scaleFactor-1.0f));
  shape(s, 0, 0, 1000, 700);
  popMatrix();

  checkMovement();

  fill(255, 255, 150);//20);
  rect(menuX, menuY, menuWidth, menuHeight); //Dimensions/1000,0,500,700
    
  c = get(mouseX,mouseY);
       r = red(c);
     g = green(c);
     b = blue(c);
  
  if (!charts){
     if (c==oceanColor || c==borderColor || c==boxColor || c==color(255) || c==color(0)){
        drawTitle();
     }
     else{
       countryText(c);
     }
   }
   else{
     drawCharts();
   }

}

void mouseReleased(){
  if(c!=oceanColor && c!=borderColor && c!=boxColor && c!=color(255) && c!=color(0)){
    charts = !charts;
    if(charts){
      currentColor = c;
    }
  }
}

void checkMovement() {
  if (zoomIn) {
    scaleFactor+=0.1;   
    zoomIn=false;
  }
  if (zoomOut) {
    scaleFactor-=0.1;
    zoomOut=false;
  }
  if (moveUp && scaleFactor>1.0) {
    if (get(500, 0) != borderColor) {
      mapY++;
    }
  }
  if (moveDown && scaleFactor>1.0) {
    if (get(500, 699) != borderColor) { 
      mapY--;
    }
  }
  if (moveLeft && scaleFactor>1.0) {
    if (get(0, 300) != borderColor) {
      mapX++;
    }
  }
  if (moveRight && scaleFactor>1.0) {
    if (get(1000, 300) != borderColor) {
      mapX--;
    }
  }
}

void keyPressed(KeyEvent evt) {
  int keyVal = evt.getKeyCode();

  switch(keyVal) {
  case KeyEvent.VK_LEFT:
    moveLeft = true;
    break;
  case KeyEvent.VK_RIGHT:
    moveRight = true;
    break;
  case KeyEvent.VK_UP:
    moveUp = true;
    break;
  case KeyEvent.VK_DOWN:
    moveDown = true;
    break;
  }
}

void keyReleased(KeyEvent evt) {
  int keyVal = evt.getKeyCode();

  switch(keyVal) {
  case KeyEvent.VK_I:
    zoomIn = true;
    break;
  case KeyEvent.VK_O:
    zoomOut = true;
    break;
  case KeyEvent.VK_LEFT:
    moveLeft = false;
    break;
  case KeyEvent.VK_RIGHT:
    moveRight = false;
    break;
  case KeyEvent.VK_UP:
    moveUp = false;
    break;
  case KeyEvent.VK_DOWN:
    moveDown = false;
    break;
  }
}

void countryText(color c){
     
     for (int i=0;i<lines.length;i++){
       
       tempLine2 = lines[i];
       tempArray2 = split(tempLine2,',');
       rVal = int(tempArray2[1]);
       gVal = int(tempArray2[2]);
       bVal = int(tempArray2[3]);
       if (r==rVal && g==gVal && b==bVal){
        
         //Display the country name, sized accordingly
         fill(0);
         textFont(helvetica,8);
         text(tempArray2[0],mouseX,mouseY);
         if(tempArray2[0].length()<=10){
           textFont(capitalsRegular,60);
           text(tempArray2[0],leftBound,100);
         }
         else if(tempArray2[0].length()<=15){
           textFont(capitalsRegular,55);
           text(tempArray2[0],leftBound,100);
         }
         else{ 
           textFont(capitalsRegular,30);
           text(tempArray2[0],leftBound,100);
         }
         
         //Display the country flag         
         PImage tempFlag = (PImage)flagArray.get(i);
         tempFlag.resize(chartWidth,(chartWidth)/2);
         image(tempFlag,leftBound,450);
         
         //Display the main BMI number
         textFont(capitalsRegular,30);
         text("Average BMI",leftBound,170);
         textFont(capitalsRegular,100);
         if (tempArray2[4].length()>4){
           text(tempArray2[4].substring(0,4),leftBound,270);
         }
         else{
           text(tempArray2[4],leftBound,270);
         }
         

         image(girl,leftBound+250,150);
         image(boy,leftBound+320,150);
         
         fill(255);
         textFont(helvetica,20);
         if (tempArray2[5].length()>4){
           text(tempArray2[5].substring(0,4),leftBound+263,232); //female
         }
         else{
           text(tempArray2[5],leftBound+263,232); //female
         }
         if (tempArray2[6].length()>4){
           text(tempArray2[6].substring(0,4),leftBound+334,232); //male
         }
         else{
           text(tempArray2[6],leftBound+334,232); //male
         }
         
         fill(70,70,70);
         textFont(capitalsRegular,30);
         text("Average Lifespan: " + tempArray2[7], leftBound, 330);
         text("Female Lifespan: " + tempArray2[9], leftBound, 370);
         text("Male Lifespan: " + tempArray2[8], leftBound, 410);
         
   //      prevCountry=i;
       }//end if
   }//end for loop
} 


void drawCharts(){
    c = get(mouseX,mouseY);
       r = red(c);
     g = green(c);
     b = blue(c);
  
  stroke(4);
  fill(255,0,255);
  strokeWeight(4);
  line(leftBound, chartY, leftBound, chartHeight+chartY); //////////////////////1000,0,500,700
  fill(0);
  textSize(20);
  text("BMI",leftBound-12,chartY-2);
  line(leftBound,chartHeight+chartY,chartWidth+leftBound,chartHeight+chartY);
  text("Life Expectancy",leftBound+(chartWidth/2)-80,chartY+chartHeight+20);
 
  for (int i=0;i<lines.length;i++){
       tempLine3 = lines[i];
       tempArray3 = split(tempLine3,',');
       float tempR = Float.valueOf(tempArray3[1]).floatValue();
       float tempG =  Float.valueOf(tempArray3[2]).floatValue();
       float tempB =  Float.valueOf(tempArray3[3]).floatValue();
       
       float BMI = Float.valueOf(tempArray3[4]).floatValue();
       float lifeExpectancy = Float.valueOf(tempArray3[7]).floatValue();
       
       float ellipseX=leftBound+(85-lifeExpectancy)*(chartWidth/55);
       float ellipseY=(30.5-BMI)*(chartHeight/10)+(chartY);
       
       if (tempR==red(currentColor) && tempG==green(currentColor) && tempB==blue(currentColor)){
         fill(255,0,0);
         ellipseW=10;
         text(tempArray3[0],ellipseX+4,ellipseY+3);
       }
       else{
         ellipseW=5;
         fill(tempR,tempG,tempB);
       }
       noStroke();
       ellipse(ellipseX,ellipseY,ellipseW,ellipseW);
       
       if (r==tempR && g==tempG && b == tempB){
         textSize(8);
         fill(0);
         text(tempArray3[0],ellipseX+4,ellipseY+3);
       }
       
       fill(0);
        
           textFont(capitalsRegular,30);
           text("Compared to",leftBound,150);
           text("other countries",leftBound,200);
  }
}

void drawTitle(){
  fill(0);
  textFont(capitalsRegular,100);
  text("WEIGHT",leftBound,170);
  textFont(capitalsRegular,100);
  text("of the",leftBound,250);
  textFont(capitalsRegular,100);
  text("WORLD",leftBound,350);
  
  textFont(capitalsRegular,30);
  text("Project by Iris Sun",leftBound,450);
  textFont(capitalsRegular,15);
  text("Press 'I' to zoom in, 'O' to zoom out",leftBound,500);
  text("Click country for scatterplot",leftBound,530);
}


