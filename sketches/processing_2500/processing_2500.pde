
boolean isDrawing = false;

void setup(){
  PImage myImage;
  size(900,500);
  myImage = loadImage("face2.gif");
  image(myImage,0,0);
};

void draw(){
  
 if (isDrawing){
  
  //stroke(255,0,0,250);
  //line(pmouseX,pmouseY,mouseX - random(-50,50),mouseY - random(-50,50));
  noStroke();
  fill(70,61,4,50);
  ellipse(mouseX - random(-10,10),mouseY - random(-10,10),10,10);
 };
  
};


void mousePressed(){
  isDrawing = !isDrawing;
};

