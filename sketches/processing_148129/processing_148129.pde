
boolean button = false;
float r;//declare r a float  
float g;//declare g a float
float b;//declare b a float
float a;//declare a a float

float diam;//declare diamete a float
float x;//declare x a float
float y;//declare y a flaat

void setup () {
  size ( 600,500); //set size of the window
  smooth();//draw with smoth edges
  frameRate (30);//set framerat
}

void draw () 
{if(mouseX<width/2){//if the mouse is on the left side of the window the background will be red
  background(95,1,12);
}else {
  background(1,17,95);//if the mouse is on the right side off the window the background will be blue
}
  
  
   rectMode(CENTER);
   ellipseMode(CENTER);
    
    
    if (mousePressed) {//when the mouse is clocked a circle will appear behnind the robots head
   fill(255);
   ellipse(mouseX,mouseY+10,200,200);
    }
   
  stroke (0);//create the robots head and neck
  fill(115,115,118);//neck
  rect(mouseX-0,mouseY+50,50,30);
   fill(70,70,72);//head
  rect(mouseX,mouseY,100,100);
  
  
  
  stroke(0);//create the robots eyes
  fill(mouseX,0,mouseY);//make the colour of the eyes change based on the location of the mouse
  ellipse(mouseX-20,mouseY-10,30,20);
  ellipse(mouseX+20,mouseY-10,30,20);
  
  stroke(0);//create the robots nose
  fill(0);
  ellipse(mouseX-0,mouseY+10,10,20);
  
  stroke(0);//create the robots mouth
  line(mouseX-20,mouseY+30,mouseX+20,mouseY+30);
  
  
  stroke(0);//create the robots legs and feet
 fill(70,70,72);
 rect(mouseX-30,mouseY+250,40,130);//leg
 rect(mouseX+30,mouseY+250,40,130);//leg
 fill(115,115,118);
 rect(mouseX-30,mouseY+330,50,40);//foot
 rect(mouseX+30,mouseY+330,50,40);//foot
 
 stroke(0);//create the robots arms,legs,hands and fingers
 fill(70,70,72);
 rect(mouseX+70,mouseY+120,30,100);//arm    
 rect(mouseX-70,mouseY+120,30,100);//arm
 fill(115,115,118);
 rect(mouseX-70,mouseY+180,30,30);//hand
 rect(mouseX+70,mouseY+180,30,30);//hand
 rect(mouseX+70,mouseY+200,5,10);//fingers
 rect(mouseX+60,mouseY+200,5,10);//fingers
 rect(mouseX+80,mouseY+200,5,10);//fingers
 rect(mouseX-80,mouseY+200,5,10);//fingers
 rect(mouseX-60,mouseY+200,5,10);//fingers
 rect(mouseX-70,mouseY+200,5,10);//fingers
  
  stroke(0);//creat the robots body
  fill(115,115,118);
  rect(mouseX-0,mouseY+130,120,130);
  fill(15,13,214);
  ellipse(mouseX-0,mouseY+110,10,10);// robots buttons
  ellipse(mouseX-0,mouseY+130,10,10);//robots buttons
  ellipse(mouseX-0,mouseY+150,10,10);//robots buttons
  
 //draw the background circles
 r=random(255);//declare a random between 0 and 255
 g=random(255);//declare a random between 0 and 255
 b=random(255);//declare a random between 0 and 255
 a=random(255);//declare a random between 0 and 255
 diam= random(100);// declare a rnadom diameter 
 x=random(width);//declare random width 
 y=random(height);//declare random height
 
 
 noStroke();
 fill(r,g,b,a);//declare to draw ellipses of random colour
 ellipse(x,y,diam,diam);//declare to draw random ellipses of random size 
 

}

