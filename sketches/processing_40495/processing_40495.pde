
//Assignment 3
//Name:       Ilena Pegan
//E-mail:     ipegan@brynmawr.edu
//Course:     CS 110 - Section 03

//Created Raining Clouds - stored objects in arrays and used basic shapes and draw() method.
//As the mouse nears the clouds - the shade of the clouds get darker and when the mouse overlaps the cloud 
//begins to rain. 

//Variables
cloud clouds[];

//Setup
void setup()  {
  size(500, 500); 
  smooth();
  background(194, 233, 252);
  clouds = new cloud [6];
 for(int i = 0; i < clouds.length; i++)
  clouds[i] = new cloud();  
}

//Calls: Cloud Function
void draw(){
  updateCloud();
  background(194, 233, 252);
  drawCloud();
}

//Calls: Cloud Function 3xs
void drawCloud(){
  for(int i = 0; i < clouds.length; i++)
    clouds[i].draw();
}

//Calls: Update Function
void updateCloud() {
  for(int i = 0; i < clouds.length; i++)
    clouds[i].update();
}

//Defines: Cloud Class
class cloud{
  float centerX;
  float centerY;
  float diam;
  float opacity;
  boolean hover;
  
//Defines: Cloud Variables and Float
  cloud(){
    centerX = random(50, 450);
    centerY = random(50, 450);
    diam = random(100, 150);
    opacity = 0;
    hover = false;
}

//Draws: Cloud
  void draw(){
    strokeWeight(10);
    
    //Cloud Rain
    // When mouse hovers over cloud: cloud will rain. 
    if (hover){
      noStroke();
      fill(0, 255, 180);
      rect (centerX - (diam/3), centerY + (diam/4), diam/20, diam/1);
      rect (centerX - (diam/5), centerY + (diam/4), diam/20, diam/1.5);
      rect (centerX - (diam/10), centerY + (diam/4), diam/20, diam/1);
      rect (centerX, centerY + (diam/4), diam/20, diam/1.5);
      rect (centerX + (diam/10), centerY + (diam/4), diam/20, diam/1);
      rect (centerX + (diam/5), centerY + (diam/4), diam/20, diam/1.5);
      rect (centerX + (diam/3), centerY + (diam/4), diam/20, diam/1);
       
    }
    else{
    line((centerX - (diam/6)), (centerY + (diam/3)), (centerX + (diam/6)), (centerY + (diam/6)));
    }
    //Cloud
    //Cloud varies in opacity based on the distance of the mouse. 
  noStroke ();
  fill (12, 240, 234, 100);
  fill (70, opacity);
  ellipse (centerX + (diam/100), centerY - (diam/15), diam/1, diam/3);
  ellipse (centerX - (diam/5), centerY - (diam/10), diam/1, diam/3);
  ellipse (centerX + (diam/5), centerY - (diam/10), diam/1, diam/3);
  ellipse (centerX + (diam/5), centerY + (diam/10), diam/1, diam/3);
  ellipse (centerX - (diam/5), centerY + (diam/10), diam/1, diam/3);
   
   }
  
  //Set up: Variable "i" 
  // "i" = Center Point & Mouse Position
  // Defines: True/False Hover: Boolean Function
void update(){
    float i = dist(centerX, centerY, mouseX, mouseY);
    opacity = 255.0 - i;
    if(i < diam/2) 
    hover = true;
    else
    hover = false;
  }
}


