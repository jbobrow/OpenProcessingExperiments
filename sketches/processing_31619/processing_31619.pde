
int X = 0;
int Y = 0;

void setup(){
   size (500,500);
background(90);
  
}

void draw(){
  
  smooth();
  
  fill(255,255,255,Y);
  
  ellipse(300, 200, mouseX, mouseX);
  ellipse(200, 300, mouseX, mouseX);
  ellipse(200,200, mouseX, mouseX);
  ellipse(300,300, mouseX, mouseX);
  ellipse(250,175, mouseX, mouseX);
  ellipse(175,250, mouseX, mouseX);
  ellipse(325,250, mouseX, mouseX);
  ellipse(250,325, mouseX, mouseX); 
 
  Y = 20;
  
}

void mousePressed(){
  background(90);
}

