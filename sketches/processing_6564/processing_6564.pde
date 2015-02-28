

// "Robotman" By Riaz 
// http://www.ahmedriaz.com

// Boom Varibale 
float boom = 0;

// Robot Heart
boolean button = false;

// Background Varbiables 
float bright0 = 0;
float bright1 = 0;
float bright2 = 0;
float bright3 = 0;

void setup()
{
  size(500, 500);
//  smooth();
  frameRate(30);
}

void draw() 
{ 

  // Background 
  background (256, 256, 256); 

  // back colors
  noStroke();
  fill(0);

  if (mouseX < 250 && mouseY < 250) { 
    bright0 = 255; 
  } 
  else if (mouseX > 250 && mouseY < 250 ) { 
    bright1 = 255;
  } 
  else if(mouseX < 250 && mouseY > 250) {   
    bright2 = 255; 
  } 
  else if (mouseX > 250 && mouseY > 250) { 
    bright3 = 255;
  }

  // All rectangles always fade
if (!button)
{
  bright0 = constrain (bright0 - 1, 230, 250);
  bright1 = constrain (bright1 - 1, 230, 250);
  bright2 = constrain (bright2 - 1, 220, 250);
  bright3 = constrain (bright3 - 1, 220, 250);
}
else 
{
  bright0 = constrain (bright0 - 1, 0, 20);
  bright1 = constrain (bright1 - 1, 0, 20);
  bright2 = constrain (bright2 - 1, 0, 20);
  bright3 = constrain (bright3 - 1, 0, 20);
}  


  // Draw sqaures 
  fill(bright0);
  rect(0,0,250,250);
  fill(bright1);
  rect(250,0,250,250);
  fill(bright2); 
  rect(0,250,250,250);
  fill(bright3);
  rect(250,250,250,250);     


  //Horizon
  stroke(224, 225, 227);
  strokeWeight(0);
  // line (100, 350, 400, 350);
  noFill(); 
  arc(250, 350, 300, 20, PI, PI*2);
  stroke(180, 0, 115);
  strokeWeight(0);
  fill(255,224,237);  

  // Body 
  rect(170, 60, 150, 180);
  fill(255,175,237);
  ellipse(245,120,20,20);  
  fill(mouseX,185,mouseY);
  ellipse(245,120,10,10);
  fill(255,224,237);

  // Robot Heart 
  if ((mouseX > 235 && mouseX < 255)&&(mouseY > 115 && mouseY < 125))
  {
    fill(41,135,255);
    ellipse(245,120,20,20);  
    fill(mouseX,185,mouseY);
    ellipse(245,120,10,10);
    fill(255,224,237);  
  }



  // Head 
  rect(220,40,50,30);    
  fill(mouseX,185,mouseY);
  rect(225,50,5,5);    
  rect(260,50,5,5);    
  line(242,60,248,60);

  // legs
  fill(255,224,237); 
  line(185,240,185,250);
  rect(180,250,10,140);
  rect(190,390,-40,10);  
  line(305,240,305,250);
  rect(300,250,10,140);
  rect(300,390,40,10);   

  // arms
  rect(150, 60, 10, 140);  
  line (160, 60, 170, 60);
  line (150, 200, 150, 215);
  line (150, 200, 145, 215);
  line (150, 200, 140, 215);  
  line (150, 200, 135, 215);  

  rect(330, 60, 10, 140);  
  line (320, 60, 330, 60);
  line (340, 200, 340, 215);
  line (340, 200, 345, 215);
  line (340, 200, 350, 215);  
  line (340, 200, 355, 215);   

  // target ball 

  if(mouseX<width/2)
  {
    ellipseMode(CENTER);
    ellipse(mouseX, mouseY, 10, 10);    
    line(mouseX, mouseY, pmouseX, pmouseY);
  } 
  else if (mouseX > width/2) {
    rectMode(CENTER);
    rect(mouseX, mouseY, 10, 10);
    line(mouseX, mouseY, pmouseX, pmouseY);
    rectMode(CORNER);
  }





}

// Do Something 
void mousePressed()
{ 
  println("Do Doop Dee Boop Bee Doop Dee Do");
  stroke(175,185,255);
  line(225, 50, mouseX, mouseY);
  line(260, 50, mouseX, mouseY);

  boom = random(10, 300);
  ellipse(mouseX-10, mouseY-10, boom, boom);
  ellipse(mouseX-10, mouseY-10, boom, boom);  

  // Look for button
  if ((mouseX > 235 && mouseX < 255)&&(mouseY > 115 && mouseY < 125))
  {
    button = !button;
  }


}




