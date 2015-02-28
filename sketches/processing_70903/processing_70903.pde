
//*****************************************
//*Assignment 2
//*Bryce Lewis
//*bklewis@brynmawr.edu
//*CS 110 - Section 1
//*9/19/2012
//*This program draws a randomized field of flowers.
//*When the mouse is pressed, a bee appears.
//*The bee's color and shape is determined by its location.
//*Pressing a key wipes the screen and restarts the program.
//*****************************************

void drawBackground(){
  
  //green field and blue sky
  background (50,random(150,255),100);
  strokeWeight(0);
  fill(150,230,255);
  rect(-3,-3,610,105);
  smooth();
  
  //loop that draws 10 flowers
  for(int i = 0; i <10;  i++){
 
    float a = random(0,600);
    float b = random(110,600);
 
    strokeWeight(b/100);
    fill(255,0,0);
    ellipse(a+b/20,b+b/20,b/10,b/10);
    ellipse(a-b/20,b+b/20,b/10,b/10);
    ellipse(a+b/20,b-b/20,b/10,b/10);
    ellipse(a-b/20,b-b/20,b/10,b/10);
    fill(255,255,0);
    ellipse(a,b,b/10,b/10);
  }
}

void setup(){
  size(600,600);
  drawBackground();
}

//printing mouse coordinates
void draw(){
  println (mouseX +"," + mouseY);
}

//click to create bees
void mousePressed(){
 
  float x = mouseX;
  float y = mouseY;
 
  if(x<600 && y>000 && y<600){
 
    //bee wings
    strokeWeight(y/100);
    fill(100,150,250);
    bezier(x,y-y/20,x-y/7.5,y-y/5,x+y/5,y-y/3.75,x,y-y/20);
    bezier(x-y/60,y-y/20,x-y/5,y-y/5,x+y/7.5,y-y/3.75,x-y/60,y-y/20);
  
    //bee body and color: color changes based on location
    //of mouseX and mouseY)
    if(x<255 && y<255){
    fill(x,y,100);
    }
    else if(x>=255 && y<255){
      fill(x-254,y,100);
    }
        else if(x<255 && y>=255){
    fill(x,y-254,100);
    }
    else if(x>=255 && y>=255){
      fill(x-254,y-254,100);
    }
    ellipse(x,y,7*y/30,y/7.5);
    strokeWeight(y/20);
    strokeCap(SQUARE);
    line(x,y+y/15,x,y-y/15);
    strokeWeight(y/100);
 
    //bee face & stinger
    ellipse(x-(y/10),y-(y/60),(y/100),(y/300));
    line(x-(11*y/100),y+(7*y/300),x-(7*y/75),y+(y/150));
    line(x+7*y/60,y,x+y/7.5,y);
 
    //bee stripes
    fill(0);
    beginShape();
    vertex(x+(y/20),y+(y/(53/3)));
    vertex(x+(y/12),y+(y/25));
    vertex(x+(y/12),y-(y/25)); 
    vertex(x+(y/20),y-(y/(56/3)));
    vertex(x+(y/20),y+(y/(53/3)));
    endShape();
 
    beginShape();
    vertex(x-(y/20),y+(y/(53/3)));
    vertex(x-(y/12),y+(y/26));
    vertex(x-(y/12),y-(y/26)); 
    vertex(x-(y/20),y-(y/(59/3)));
    vertex(x-(y/20),y+(y/(53/3)));
    endShape();
  }
}

//press to wipe
void keyPressed() {
  drawBackground();
}
