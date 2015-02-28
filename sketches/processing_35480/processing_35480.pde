

//import maxlink.*;
//MaxLink link = new MaxLink(this,"blob_input");

//---------------------------------------- 

Boolean button = false;
Circle[] circles = new Circle[500];
                      
int Width = 1280;
int Height = 800;
int counter = 0;
int score = 0;
int health = 100;
int xM = 20;
int xV = 10;

//int[] xM = new int[1];
//xM[0] = 90;

//int[] xV = new int[1];
//xV[0] = 90;



boolean s = false; //start variable
boolean bots = false;
boolean questionMode = false;
boolean answer = false;



//---------------------------------------- coordinaten van kinect

public int blobID1,blobID2,blobID3,blobID4,blobID5,blobID6,blobID7,blobID8,blobID9,blobID10;
public float XVal1,XVal2,XVal3,XVal4,XVal5,XVal6,XVal7,XVal8,XVal9,XVal10;
public float YVal1,YVal2,YVal3,YVal4,YVal5,YVal6,YVal7,YVal8,YVal9,YVal10;
public float Area1,Area2,Area3,Area4,Area5,Area6,Area7,Area8,Area9,Area10;

//----------------------------------------

boolean SouthAmericaOver = false;
boolean NorthAmericaOver = false;
boolean EuropeOver = false;
boolean AfricaOver = false;
boolean AsiaOver = false;
boolean OceaniaOver = false;

boolean uitleg1 = false;
boolean uitleg2 = false;
boolean uitleg3 = false;
boolean uitleg4 = false;


int currentLevel = 0;
Level[] levels = new Level[6];

/*
boolean ronde0 = true;
boolean ronde1 = false;
boolean ronde2 = false;
boolean ronde3 = false;
boolean ronde4 = false;
boolean ronde5 = false;

Level0 level0;
Level1 level1;
Level2 level2;
Level3 level3;
Level4 level4;
Level5 level5;
*/
GameOver gameover;
Referentiepunt referentiepunt;
Referentiepunt2 referentiepunt2;


//----------------------------------------  //color -------------------

color c = color(255, 255, 255, 255);

//----------------------------------------  //fonts -------------------

PFont font;
PFont font1;
float x1 = -20;

//----------------------------------------  //images -------------------

PImage Virus;
PImage female;
PImage male;
PImage man;
PImage woman;
PImage ribbon;
PImage needle;
PImage beginscherm;
PImage condom;
PImage condom1;
PImage worldmap;
PImage mousepointer;
PImage bubble;
PImage play;

PImage bannertemplate;
PImage banner;
PImage banner1;
PImage banner2;
PImage banner3;
PImage banner4;
PImage banner5;
PImage banner6;
PImage banner7;
PImage banner8;
PImage banner9;
PImage banner10;

PImage statistiekenSouthAmerica;
PImage statistiekenNorthAmerica;
PImage statistiekenEuropa;
PImage statistiekenAfrica;
PImage statistiekenAsia;
PImage statistiekenOceania;
PImage statistiekenGlobal;

PShape worldshape;
PShape SouthAmerica;
PShape NorthAmerica;
PShape Europe;
PShape Africa;
PShape Asia;
PShape Oceania;

/*
PVector positionvirus;
PVector snelheidvirus;

PVector positionmens;
PVector snelheidmens;
*/
//---------------------------------------- 

float radvirus= 40;
float vminvirus = -30;
float vmaxvirus = 30;

float radmens= 40;
/*float vminmens = -2;
float vmaxmens = 3;*/

float positionmens;
float snelheidmens;

float positionvirus;
float snelheidvirus;

//----------------------------------------  //start void setup  -------------------  

void setup()
{
  //javax.swing.JOptionPane.showMessageDialog(null, "Setup");
  //frameRate(60);
  size(1280, 800);
  
  smooth();
  for (int i=0; i<circles.length; i++) 
  {
    circles[i] = new Circle(random(width), random(height), random(100), random(15, 30), random(-50, 50), random(-50, 50), random(255), random(255), random(255), random(255));
  }
  
  //Level(String title, int xM, int xV, int vminmens, int vmaxmens,  int scoreLevel)
  
  levels[0] = new Level("LEVEL 1", 10, 5, -3, 3, 7);
  levels[1] = new Level("LEVEL 2", 20, 10, -6, 6, 10);
  levels[2] = new Level("LEVEL 3", 30, 15, -10, 10, 15);
  levels[3] = new Level("LEVEL 4", 40, 20, -15, 15, 20);
  levels[4] = new Level("LEVEL 5", 50, 10, -20, 20, 25);
  levels[5] = new Level("LEVEL 6", 60, 10, -30, 30, 30);
  
  gameover = new GameOver();
  referentiepunt = new Referentiepunt();
  referentiepunt2 = new Referentiepunt2();
  
//----------------------------------------  // inlets
  
//      link.declareInlet("blobID1");
//  link.declareInlet("XVal1");
//  link.declareInlet("YVal1");
//  link.declareInlet("Area1");
//  
//      link.declareInlet("blobID2");
//  link.declareInlet("XVal2");
//  link.declareInlet("YVal2");
//  link.declareInlet("Area2");
    
//     link.declareInlet("blobID3");
//  link.declareInlet("XVal3");
//  link.declareInlet("YVal3");
//  link.declareInlet("Area3");
  
//     link.declareInlet("blobID4");
//  link.declareInlet("XVal4");
//  link.declareInlet("YVal4");
//  link.declareInlet("Area4");
//  
//   link.declareInlet("blobID5");
//  link.declareInlet("XVal5");
//  link.declareInlet("YVal5");
//  link.declareInlet("Area5");
//  
//     link.declareInlet("blobID6");
//  link.declareInlet("XVal6");
//  link.declareInlet("YVal6");
//  link.declareInlet("Area6");
//  
//     link.declareInlet("blobID7");
//  link.declareInlet("XVal7");
//  link.declareInlet("YVal7");
//  link.declareInlet("Area7");
//  
//     link.declareInlet("blobID8");
//  link.declareInlet("XVal8");
//  link.declareInlet("YVal8");
//  link.declareInlet("Area8");
  
//----------------------------------------  //load images -------------------  
  
  Virus = loadImage("virus5.png");
  female = loadImage("female.png");
  male = loadImage("male.png");
  man = loadImage("man.png");
  woman = loadImage("woman.png");
  ribbon = loadImage("ribbon.png");
  worldmap = loadImage("Worldmapbackground2.png");
  needle = loadImage("needle.png");
  beginscherm = loadImage("beginscherm.png");
  condom = loadImage("condom.png");
  condom1 = loadImage("condom1.png");
  mousepointer = loadImage("mouse pointer.png");
  bubble = loadImage("bubble.png");
  play = loadImage("play.png");
  
  bannertemplate = loadImage("bannertemplate.png");
  banner  = loadImage("banner.png");
  banner1 = loadImage("banner1.png");
  banner2 = loadImage("banner2.png");
  banner3 = loadImage("banner3.png");
  banner4 = loadImage("banner4.png");
  banner5 = loadImage("banner5.png");
  banner6 = loadImage("banner6.png");
  banner7 = loadImage("banner7.png");
  banner8 = loadImage("banner8.png");  
  banner9 = loadImage("banner9.png");
  banner10 = loadImage("banner10.png");
  
  statistiekenSouthAmerica = loadImage("statistieken_SouthAmerica.png");
  statistiekenNorthAmerica = loadImage("statistieken_NorthAmerica.png");
  statistiekenEuropa = loadImage("statistieken_Europa.png");
  statistiekenAfrica = loadImage("statistieken_Africa.png");
  statistiekenAsia = loadImage("statistieken_Asia.png");
  statistiekenOceania = loadImage("statistieken_Oceania.png");
  statistiekenGlobal = loadImage("statistieken_Global.png");
  
  worldshape = loadShape("worldmap.svg");
  SouthAmerica = worldshape.getChild("SouthAmerica");
  NorthAmerica = worldshape.getChild("NorthAmerica");
  Europe = worldshape.getChild("Europe");
  Africa = worldshape.getChild("Africa");
  Asia = worldshape.getChild("Asia");
  Oceania = worldshape.getChild("Oceania");
  smooth();
  
  //----------------------------------------  //fonts -------------------
  
  font = loadFont("Rockwell-ExtraBold-20.vlw");
  font1 = loadFont("Rockwell-ExtraBold-16.vlw");
   
}


//----------------------------------------  //start void draw
void draw()
{

        //mouseKinect();
        //referentiepunt.update();
        //referentiepunt2.update();
   //----------------------------------------  //startscherm
   if(s == false) 
   {
              background(0);
         imageMode(CENTER);
         image(beginscherm, 640, 400);   
         for (int i=0; i<circles.length; i++) 
          {
          circles[i].display();
          }
          
          startscherm();
          mouseKinect();
          //referentiepunt.update();
          //referentiepunt2.update();
          
        
         if(mouseX > 0) {
        cursor(mousepointer);
        //cursor(HAND);
        }
          
        
          loop();
        
        
    }

    //----------------------------------------  //begin van sketch
    if(s == true) 
    { 

        //----------------------------------------  //Vervang muis cursor door afbeelding
       
        if(mouseX > 0) {
        cursor(mousepointer);
        //cursor(HAND);
        } 
        
        mouse();
        kaart();
        //kinect
        //mouseKinect();
        
        //cursor
  
        
        
        
        
                
                if (currentLevel < 6)
                {
                levels[currentLevel].display();
                }
                //----------------------------------------  end of levels
                 
                if(health <= 0 || currentLevel > 5) {gameover.display();
                      
                    }
                
        //referentiepunt.update();
        //referentiepunt2.update();
        
        
    //----------------------------------------  end s == true
    
    
    
    
    }

//----------------------------------------  end void draw
}




 






