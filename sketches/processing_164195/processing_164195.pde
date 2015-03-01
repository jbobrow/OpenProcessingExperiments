
PImage white_noise;
PImage KH;
PImage KM;

float r = 0;
float y = 0;
float dy = 0;

int time;
int wait = 5000;


void setup(){
  size(500, 300);
  white_noise=loadImage("white_noise.jpg");
  KH=loadImage("kanye_head.gif");
  KM=loadImage("kanye_mouth_copy.gif");
  background(0);
  time = millis();
  colorMode(HSB, 282, 92, 62);

}


void draw(){
    
  //medium center ellipse
  fill(0, 2);
  ellipse(250, 150, 200, 200);
  
 //mouse-moving triangle
  stroke(0);
  fill(179, 92, 62, 100);
  triangle(mouseX, mouseY, (mouseX + 25), (mouseY + 50), (mouseX - 25), (mouseY + 50));
  
  //black and white crosshatching
 if(mouseX >= 450){
   stroke(240, 60);
   line(random(0, 500), y, random(0, 500), (y + 300));
 }
 else{
   stroke(0);
   line(random(0, 500), y, random(0, 500), (y + 300));

}
   
  //spinning rectangle
  translate(250, 150);{
  rotate(r);
  stroke(0);
  fill(250, 94, 47, 80);
  rect(0, 0, 100, 100);
  
  r = r + 0.06;
  }
  
  //white noise 
  if(mouseX <= 100){
   image(white_noise);
  } 

  //red rectangle
  if(millis() - time >= wait){
    translate(-250, -150);
    rotate(r);
      fill(375, 99, 97);
      rect(0,0, random(0, 500), random(0, 300));
      time = millis();
      r = 0;
  }
  

  //kanye head
  if(mouseX >= 475){
    translate(-250, -150);
    image(KH, 0, 0);
    image(KM, 0, random(0, 10));
    
    r = 0;
  }
  
  //invert
  if(mouseY >= 280){
    filter(INVERT);
  }

 
    
}


  



