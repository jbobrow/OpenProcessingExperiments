
/*
Author : Jacob Wan
Purposes: Drawing a squid that can be picked up and move around
*/
  
int counter;
int headX =0;
int headY =0;
float originX = 0.00;
float originY = 0.00;
ArrayList food = null;
ArrayList bubbles = null;
PFont font;
PImage img;
void setup() {  //setup function called initially, only once
  size(450, 350);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  strokeWeight(3);
  headX = floor((0.75)*width);
  headY = floor((0.5)*height);
  food = new ArrayList<Squid_Food>();
 // img = loadImage("/Users/Home/Downloads/deepsea3d4_f.jpg");
  img = loadImage("http://www.wired.com/news/images/full/deepsea3d4_f.jpg");
  font = loadFont("ComicSansMS-15.vlw"); textFont(font);
  textFont(font);
  frameRate(10);
}
   
void draw() {  //draw function loops
      
    int offset = 20;
    int bodyLength = 100;
    counter++;
    stroke(255);
    strokeWeight(3);
   if (mousePressed) {
     if (mouseButton==RIGHT) {
       headX = mouseX;
       headY = mouseY;
       originX = 0;
       originY = 0;
     }
    }
   if (counter%10 == 0) {
       originX += 1.0;
    }
    image(img, 0, 0);
     
    pushMatrix();
    translate (originX, originY);
    draw_squid(bodyLength, offset,headX, headY);
    popMatrix();
    draw_food(headX, headY);
    textSize(16);
    text("Check that Out?!! What's That?!", 0.4*width, 0.4*height);
 }
   
 void mouseClicked() {  // the mouse click, not pressed so that it doesn't leave a streak
    if (mouseButton ==LEFT){
       addFood(mouseX, mouseY);
    }
     
  }
  
 /*********** add the food to the ArrayList **********/
 void addFood(int mouseX, int mouseY){
     food.add(new Squid_Food(mouseX, mouseY));
 }
     
 void draw_bubble() {
     
 }
 /****** This method draw the squid *************/
void draw_squid(int bodyLength, int offset, int headX, int headY ) {
  fill(random(255),255,100,200);
  stroke(255);
  ellipse(headX-bodyLength/2, headY, bodyLength,offset*2);
  triangle(headX-bodyLength,headY-offset,
           headX-bodyLength,headY+offset,
           headX-bodyLength-offset,headY);
  point (headX-10, headY-5);
  noFill();
//  line (headX-21, headY-20, headX +60, headY-40); // upper of the tentacles
//  line (headX, headY-10, headX +60, headY-10); // point one of the tentacles
  
 // bezier (headX,headY-10, headX +40,headY-10, headX-21,headY-30, headX +60, headY-20);
   bezier (headX-5,headY- 2, headX + 40+random(15),headY-random(20), headX-(random(30)), headY-random(30), headX +55+random(5), headY-random(20));
  
  
//  line (headX, headY+8, headX + 60, headY + 10); // anchor of the second tentacles
 //  line (headX-5, headY+15, headX + 60, headY + 20); // anchor of the second tentacles
  
  bezier (headX,headY, headX + random(10),headY - random(10), headX-random(5),headY+random(15), headX + 55 + random(5),headY - random(20));
  
  
//  line (headX, headY+10, headX +55, headY + 30); // anchor of the third
//    line (headX, headY+30, headX +60, headY +40);
  
  bezier (headX, headY+2, headX+ random(55), headY+random(10), headY+random(3), headY + random(30), headX+55+random(5), headY+random(40));
  
}   
  
  
/****** The method to draw all the food in the list *******/
  
void draw_food (int headX, int headY) {
  strokeWeight(random(8));
  smooth();
  for (int i=0; i< food.size(); i++) {
     ((Squid_Food)food.get(i)).draw_food();
  }
  line (headX+4, headY, headX+5, headY-6);
    
}
  
/****** this is the Squid Food Class object *******/
class Squid_Food {
  public float x, y;
  Squid_Food (float x, float y) {
    this.x = x;
    this.y = y;
  }
    
  /******* The Function to draw the food ****/
  public void draw_food() {
    noStroke();
    fill(random(250),100,255,255);
    ellipse(x, y, 10, 5);
  }
}
