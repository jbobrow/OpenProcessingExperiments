
//in order to use this program you need to download a library controlP5

import controlP5.*;
ControlP5 cp5; // you always need the main class
boolean rectOver = false;
int drunkeness=0;
int coef=0;
int j = 0;
char letter;
String toCheck="";
String beerChoice="";
String ciderChoice="";
String wineChoice="";
String spiritsChoice="";
String weightPre="";
int beerAmmount=0;
int ciderAmmount=0;
int wineAmmount=0;
int spiritsAmmount=0;
int rectX, rectY;
int rectWidth = 284;   
int rectHeight= 83;
int beerNum=0;
int ciderNum=0;
int wineNum=0;
int spiritsNum=0;
int genderNum=0;
int weightNum=0;
color rectColor, baseColor;
color rectHighlight;
int mouseState=0;
color currentColor;  
int weightResult=0;

String genderResult="";

String[] numberUnits = {
  "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"
}; 
String[] genderList= {
  "male", "female"
};
String[] weightUnits = {
  "30", "35", "40", "45", "50", "60", "65", "70", "75", "80", "85", "90", "95", "100", "105", "110", "115", "120", "125", "130", "135", "140", "145", "150", "155", "160"
}; 
int parse=0;

int a=0;
String c="";
int d=0; 

PImage bg;
PImage beer;
PImage cider;
PImage wine;
PImage shot;
PImage gender;
PImage weight;

PFont font; 
int which = 0;

void setup() {
  size(600, 600);


  bg = loadImage("bg.png");
  font = loadFont("Monaco-48.vlw");
  beer = loadImage("beer.png");
  cider = loadImage("cider.png");
  wine = loadImage("wine.png");
  shot = loadImage("shot.png");
  gender = loadImage("gender.png");
  weight = loadImage("weight.png");



  String[] beerFile = loadStrings("beer.txt"); 
  String[] ciderFile = loadStrings("cider.txt");
  String[] wineFile = loadStrings("wine.txt"); 
  String[] spiritsFile = loadStrings("spirits.txt");

  String[] beer = split(beerFile[0], ",");
  String[] cider = split(ciderFile[0], ",");
  String[] wine = split(wineFile[0], ",");
  String[] spirits = split(spiritsFile[0], ","); 
  cp5 = new ControlP5(this);
  //button
  rectX = 160;
  rectY = 500;
  rectColor = color(0);
  rectHighlight = color(51);
  baseColor = color(102);
  currentColor = baseColor;
  //end

  //making new droplists for every type of alco with different positions
  DropdownList beerMenu = cp5.addDropdownList("Beer").setPosition(80, 200);  //add a dropdownlist at position 
  for (int i=1; i<(beer.length); i++) 
  { 
    beerMenu.addItem(beer[i], i);
  }  

  DropdownList ciderMenu = cp5.addDropdownList("Cider").setPosition(190, 200);  //add a dropdownlist at position 
  for (int i=1; i<(cider.length); i++) 
  { 
    ciderMenu.addItem(cider[i], i);
  }   




  DropdownList wineMenu = cp5.addDropdownList("Wine").setPosition(300, 200);  //add a dropdownlist at position 
  for (int i=1; i<(wine.length); i++) 
  { 
    wineMenu.addItem(wine[i], i);
  }    

  DropdownList spiritsMenu = cp5.addDropdownList("Spirits").setPosition(410, 200);  //add a dropdownlist at position 
  for (int i=1; i<(spirits.length); i++) 
  { 
    spiritsMenu.addItem(spirits[i], i);
  }    

  DropdownList numberBeer = cp5.addDropdownList("number of Pints").setPosition(80, 320);  //add a dropdownlist at position 
  for (int i=1; i<(numberUnits.length); i++) 
  { 
    numberBeer.addItem(numberUnits[i], i);
  } 

  DropdownList numberCider = cp5.addDropdownList("number of Ciders").setPosition(190, 320);  //add a dropdownlist at position 
  for (int i=1; i<(numberUnits.length); i++) 
  { 
    numberCider.addItem(numberUnits[i], i);
  } 

  DropdownList numberWine = cp5.addDropdownList("number of Glasses").setPosition(300, 320);  //add a dropdownlist at position 
  for (int i=1; i<(numberUnits.length); i++) 
  { 
    numberWine.addItem(numberUnits[i], i);
  }  

  DropdownList numberSpirits = cp5.addDropdownList("number of Shots").setPosition(410, 320);  //add a dropdownlist at position 
  for (int i=1; i<(numberUnits.length); i++) 
  { 
    numberSpirits.addItem(numberUnits[i], i);
  }  



  DropdownList gender = cp5.addDropdownList("gender").setPosition(190, 440);  //add a dropdownlist at position
  for (int i=0; i<(genderList.length); i++) 
  { 
    gender.addItem(genderList[i], i);
  }  



  DropdownList weightMenu = cp5.addDropdownList("weight(kg)").setPosition(300, 440);  //add a dropdownlist at position 
  for (int i=0; i<weightUnits.length; i++) 
  { 
    weightMenu.addItem(weightUnits[i], i);
  }
}




void draw() {
  PImage but0 = loadImage("but0.png");
  PImage but1 = loadImage("but1.png");



  background(bg);
  fill(255);
  noStroke();
  writeText();

  textFont(font, 16);
  textAlign(LEFT);

  image(beer, 90, 210);
  image(cider, 180, 190);
  image(wine, 305, 220);
  image(shot, 380, 180);
  image(gender, 200, 340);
  image(weight, 305, 340);
  fill(255);
  
     update(mouseX, mouseY);
  //button

  if (rectOver) {
    
    image(but1, 160, 500);
  } 
  else {
    image(but0, 160, 500);
  }
  
  if (mouseState==1)
  {
     action();
  }
  
  print(beerAmmount);
  print(ciderAmmount);
  print(wineAmmount);
  print(spiritsAmmount);
  print(weightResult);
  print(coef);
  print(genderResult);
  
//  print(coef);
}


void action()
{
    //here it was planned to put text messages on the different results on drunkeness,  but because of time lack it was impossible. We will try to fix it due presentation
}  

void writeText()
{
  textAlign(LEFT);
  fill(244, 102, 6);
  textFont(font, 20);
  text("Please select your drinks", 140, 50);
  text("and amount from lists below:", 130, 80);
}  

// controlEvent monitors clicks on the gui
void controlEvent(ControlEvent theEvent) 
{
  if (theEvent.isGroup()) 
  {
    println(theEvent.getGroup() + " => " + theEvent.getGroup().getValue());
    //declaring arrays and converting files again because of the library and loop issues :(

    String[] beer1 = loadStrings("beer.txt"); 
    String[] cider1 = loadStrings("cider.txt");
    String[] wine1 = loadStrings("wine.txt"); 
    String[] spirits1 = loadStrings("spirits.txt");

    String[] beerCheck = split(beer1[0], ",");
    String[] ciderCheck = split(cider1[0], ",");
    String[] wineCheck = split(wine1[0], ",");
    String[] spiritsCheck = split(spirits1[0], ","); 


    //finding appropriate information from dropdown list

    //getting array index for alcohol arrays
    if (cp5.getGroup("Beer")!=null) 
    {

      beerNum=parseInt(cp5.getGroup("Beer").getValue());
      beerChoice=beerCheck[beerNum];
    }

    if (cp5.getGroup("Cider")!=null) 
    {

      ciderNum=parseInt(cp5.getGroup("Cider").getValue());
      ciderChoice=ciderCheck[ciderNum];
    } 

    if (cp5.getGroup("Wine")!=null) 
    {

      wineNum=parseInt(cp5.getGroup("Wine").getValue());
      wineChoice=wineCheck[wineNum];
    }  
    if (cp5.getGroup("Spirits")!=null) 
    {

      spiritsNum=parseInt(cp5.getGroup("Spirits").getValue());
      spiritsChoice=spiritsCheck[spiritsNum];
    }          

    //getting alco ammount 
    if (cp5.getGroup("number of Pints")!=null) 
    {

      beerAmmount=parseInt(cp5.getGroup("number of Pints").getValue());
    }

    if (cp5.getGroup("number of Ciders")!=null) 
    {

      ciderAmmount=parseInt(cp5.getGroup("number of Ciders").getValue());
    }  

    if (cp5.getGroup("number of Glasses")!=null) 
    {

      wineAmmount=parseInt(cp5.getGroup("number of Glasses").getValue());
    }
      if (cp5.getGroup("number of Shots")!=null) 
    {

      spiritsAmmount=parseInt(cp5.getGroup("number of Shots").getValue());
    }

    if (cp5.getGroup("gender")!=null) 
    {

      genderNum=parseInt(cp5.getGroup("gender").getValue());
      genderResult=genderList[genderNum];
    } 

    if (cp5.getGroup("weight(kg)")!=null) 
    {
      weightNum=parseInt(cp5.getGroup("weight(kg)").getValue());

      weightPre=(weightUnits[weightNum]);
      weightResult=parseInt(weightPre);
      
    }
  }
}

//for Button

void update(int x, int y) {
  if ( overRect(rectX, rectY, rectWidth, rectHeight) ) {
    rectOver = true;
  } 
  else {
    rectOver = false;
  }
}

boolean overRect(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }
}

void mousePressed() {
  if (rectOver) {
    mouseState=1;
  }
}


//for formula "weightResult", "genderResult", "wineAmmount","beerAmmount", "ciderAmmount", "spiritsAmmount" 1 pint of beer(28g) 
//1pint of cider(35g), 1 glass of wine 250ml(30g), 1shot 50g(20g)


void drunkFormula() {
  if (genderResult=="female")
  {
    coef=6/10;
  }
  else if (genderResult=="male")
  {
    coef=7/10;
  }

  drunkeness = (( (28*beerAmmount)+(35*ciderAmmount)+(30*wineAmmount)+(20*spiritsAmmount)) / (weightResult*coef) );

  
  
}




