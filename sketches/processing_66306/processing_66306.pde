
// Michael Tortely
//Time-based lab

PFont myFont;
String title = "Victory Ceremony" ;
float angle = 0.0; // Current angle
float speed = 0.03; // Speed of motion
float radius = 100.0; // Range of motion
float sx = 2.0;
float sy = 2.0;


//------------------
void setup() {
size(800,600);
  noStroke();
background(255);
  smooth();
  myFont = loadFont("myFont.vlw");
textFont(myFont, 80);
}

//------------------
void draw() {
  
  fill(255, 4);

  rect(0, 0, width, height);

  angle += speed; // Update the angle

  float sinval = sin(angle);

  float cosval = cos(angle);

 text(title, 100, height/2);
//-------------------------------
//Drawing the Yellow dots in background

  float x5 = (random(1,width)) + tan(angle * sx) * radius / 2;

  float y5 = (random(1,height)) + tan(angle * sy) * radius / 2;

 fill( 255,255,0);
  rect(x5, y5, 5, 5); 
  
  //-------------------------------
//Drawing the Green dots in Background

  float x6 = (random(1,width)) + tan(angle * sx) * radius / 2;

  float y6 = (random(1,height)) + cos(angle * sy) * radius / 2;

 fill(0,255,0);
  rect(x6, y6, 5,5); 

//-------------------------------
//Drawing the Red dots in background

  float x7 = (random(1,width)) + tan(angle * sx) * radius / 2;

  float y7 = (random(1,height)) + tan(angle * sy) * radius / 2;

 fill( 255,0 ,0);
  rect(x7, y7, 5, 5); 
  
  //-------------------------------
//Drawing the Blue dots in Background

  float x8 = (random(1,width)) + tan(angle * sx) * radius / 2;

  float y8 = (random(1,height)) + cos(angle * sy) * radius / 2;

 fill(0, 0,255);
  rect(x8, y8, 5, 5); 



  



//--------------------------------

 //Blue Circle

  float x = 200 + (cosval * radius);

  float y = 200 + (sinval * radius); 

  fill(0,0, 255);

  ellipse(x, y, 50, 50); 
  
 //-------------------------------
 
 //Black Circle
  
  float x1 = 400 + (sinval * radius);

  float y1 = 200 + (cosval * radius); 

  fill(0,0, 0);
  

  ellipse(x1, y1, 50, 50); 

//-------------------------------
    
 //Red Circle

  float x2 = 600 + (cosval * radius);

  float y2 = 200 + (sinval * radius); 

  fill(255 ,0,0);

  ellipse(x2, y2, 50, 50); 
  
  //-------------------------------
  
 //Yellow Circle
  float x3 = 300 + (cosval * radius);

  float y3 = 400 + (sinval * radius); 

  fill(255, 255, 0);

  ellipse(x3, y3, 50, 50); 
  
  //-------------------------------

 //Green Circle
  float x4 = 500 + (sinval * radius);

  float y4 = 400 + (cosval * radius); 

  fill(0,255, 0);

  ellipse(x4, y4, 50, 50); 
    
    }
    

