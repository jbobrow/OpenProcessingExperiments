

float yPos=350;
float vel=2;
float xPos=150;

void setup(){
   size(300,452);
   smooth();
}

void draw(){
  
 
  
  fill(0,0,0 );
  
   PImage a;
   a=loadImage("a.jpeg");
   image(a,0,0);
   fill(210,10,50);

  
  strokeWeight(3);
  fill(56,33,217);
  noStroke();
  yPos+=vel;
  xPos+=vel;
  ellipse(200,yPos,40,40);
  
  strokeWeight(3);
  fill(255,0,127);
  noStroke();
  yPos+=vel;
  xPos+=vel;
  ellipse(150,yPos,40,40);
  
  strokeWeight(3);
  fill(25,13,127);
  noStroke();
  yPos+=0.5*vel;
  xPos+=vel;
  ellipse(120,yPos,40,40);
  
  strokeWeight(3);
  fill(175,145,17);
  noStroke();
  yPos+=0.5*vel;
    xPos+=vel;
  ellipse(150,yPos,40,40);
  
  strokeWeight(3);
  fill(15,200,127);
  noStroke();
  yPos+=vel;
    xPos+=vel;
  ellipse(120,yPos,40,40);
  
    strokeWeight(3);
  fill(56,33,217);
  noStroke();
  yPos+=vel;
  xPos+=vel;
  ellipse(200,yPos,40,40);
  
  strokeWeight(3);
  fill(255,0,127);  
  noStroke();
  yPos+=vel;
  xPos+=vel;
  ellipse(150,yPos,40,40);
  
  strokeWeight(3);
  fill(25,13,127);
  noStroke();
  yPos+=vel;
  xPos+=vel;
  ellipse(120,yPos,40,40);
  
  strokeWeight(3);
  fill(175,145,17);
  noStroke();
  yPos+=vel;
    xPos+=vel;
  ellipse(150,yPos,40,40);
  
  strokeWeight(3);
  fill(15,200,127);
  noStroke();
  yPos+=vel;
    xPos+=vel;
  ellipse(170,yPos,40,40);
  if (yPos <20 || yPos>height-20){
  vel*=-1;
  }
  
 
  


}


