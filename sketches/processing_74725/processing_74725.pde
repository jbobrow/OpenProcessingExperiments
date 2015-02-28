
//used to dertermain amount it rotates by
float m = 0;
PFont font;



void setup()
{
  
  size(600, 600);
  
  font = loadFont("ArialNarrow-Bold-40.vlw");
  
  smooth();
  
}

void draw() {

  background(0);
  
  //bar used to display speed of rotations
  fill(255,0,0);
  rect(20,60,20,100);
  
  //bar used to display scale of everything on screen
  fill(0,0,255);
  rect(80,60,20,100);
  
  
  //bar showing speed of rotations relative to the mouse
  stroke(255);
  line(10,map(mouseX,0,width,110,10),30,map(mouseX,0,width,110,10));
  
  
  //bar showing scale relative to the mouse
  stroke(255);
  line(70,map(mouseY,0,height,10,110),90,map(mouseY,0,height,10,110));
  
  
  
  //Used to keep original cordinates system ( i also can only figure out how to rotate objects around the origin relitive to their postion
  pushMatrix();
  
  //test telling user what the bar represents
  translate (40,10);
  fill(255);
  textSize(30);
  rotate(radians(90));
  text("Speed", 0, 0);
 
  //restoring old cordinates system
  popMatrix();
  
   //Used to keep original cordinates system ( i also can only figure out how to rotate objects around the origin relitive to their postion
  pushMatrix();
  
  //test telling user what the bar represents
  translate (100,10);
  fill(255);
  textSize(30);
  rotate(radians(90));
  text("Scale", 0, 0);
 
  //restoring old cordinates system
  popMatrix();
  

  

  //stack is used so the original cordinates system still exists
  pushMatrix();

  //origin is change to center of the screen to get the orboting effect
  translate(300, 300);
  
  //Star(xpos,ypos)
  Star(0,0);
  
  //Planet (x pos, y pos, radius, speed, red value, green value , blue value); 
  
  //Mercury
  Planet(60,0,5,0.1,160,136,91);
  //Venus
  Planet(80,0,10,0.09,162,83,65);
  //Earth
  Planet(100,0,11,0.08,95,103,190);
  //Mars
  Planet(120,0,8,0.07,159,51,56);
  //Jupiter
  Planet(170,0,30,0.06,217,102,50);
  //Saturn
  Planet(200,0,25,0.05,212,124,88);
  //Uranus
  Planet(230,0,20,0.04,73,108,178);
  //Neptune
  Planet(260,0,20,0.03,104,152,255);
  //Pluto
  Planet(300,0,8,0.02,108,75,62);
  
  //restores cordinates system
  popMatrix();
  
  

}


/*creates a Star, would of been better to use a class but as of this project my understanding of
  functions is much better, this applies to the planets function too
*/
void Star(float x, float y) {
  
  noStroke();
  
  int speed = 1;
  
  rectMode(CENTER);
  colorMode(HSB);
  
  //scales size by a factor of 2 on the x axis
  scale(map(mouseY, height, 0, 0, 2));
  
  //rotates is based on m
  rotate(radians(m));
  fill(40, 255, 255);
  rect(x, y, 60, 60);
  noStroke();
  fill(40, 255, 255);
  rotate(radians(45));
  rect(x, y, 60, 60);
  
  //dictaes speed based on the mosues current position on the x axis
  m+= map(mouseX, 0, width, 0, 1);
  
}


void Planet(float x,float y,int d,float planetSpeed,int R, int G,int B) {

  
  colorMode(RGB);
  scale(map(mouseY,height,0,0,2));
  noFill(); 
  stroke(255);
  ellipse(x-x,y-y,x*2,x*2);
  rotate(radians(m));
  noStroke();
  fill(R,G,B);
  ellipse(x,y,d,d);
  m+=(map(mouseX,0,width,0,planetSpeed));
 
}



