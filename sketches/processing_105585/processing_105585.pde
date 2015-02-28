

float buttonX;
float buttonY;
float BG;
float radius=10;
float cursor;

int value=0;

PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;

color textColor;
color star1Color;

void setup() {
  
  size(500, 700);
  buttonX=150;
  buttonY=300;
  
  img=loadImage("bg.jpg");
  img2=loadImage("cursor.gif");
  img3=loadImage("icon.gif");
  img4=loadImage("icon2.gif");
  img5=loadImage("bg2.jpg");
 
  textColor = color(250, 229, 164);
  star1Color = color(250, 229, 164);
  }

void draw() {
    
 img2=loadImage("cursor.gif");
  cursor(img2);
  cursor(img2, 20, 20);
  cursor(); 
  
  background(img);

  smooth();
  fill(star1Color);
  strokeWeight(50);
  stroke(255, 255, 255, 40);
  ellipse(150,300, radius*3, radius*3);

  strokeWeight(30); 
  ellipse(200, 600, radius*2, radius*2);

 strokeWeight(30); 
  ellipse(400, 400, radius*2, radius*2);

  strokeWeight(20); 
  
  ellipse(100, 100, radius, radius);


//change color
  if (dist(mouseX, mouseY, buttonX, buttonY) <radius*2) {
    star1Color = color(250,229,164);
  } 
  else {
    star1Color = color(255, 255, 255);
  }
   
  PFont myFont= loadFont("Nightmare5-Regular-60.vlw");
  textFont(myFont);
  smooth();
  fill(textColor);
  text("Starry Night", width/2, height/4);  


 if (mousePressed==true && mouseY<500){
 {if(mousePressed)
 {  background(img5); }  
   else {            
        background(img5);  }

{if (mousePressed == true && mouseY>500 && mouseX <100) { 
  {if(mousePressed)
   {background(img);}
  
  }}}
 
  textFont(myFont);
  smooth();
  fill(textColor);
  text("Starry Night", width/4, height/4); 
 
  
 if(mousePressed==true && mouseY<500)
 {
   noStroke();
   for (float x= 1; x < width; x++){
   for (float y= 1; y < width; y++){
     fill(x*10, 10, 99, 50);
  ellipse(x*20,y*20, 10, 10);

}
   } 
 }
}}}


