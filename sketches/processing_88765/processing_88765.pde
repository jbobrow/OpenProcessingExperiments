
  
  int x = 100;                          // setting integer variables 
  int y = 100;                          // x&y center points
  int w = 50;                           // w&h width and height
  int h = 25;
  int radius = 30;
 

void setup(){
 size(500,500); 
 smooth();
}

void draw(){

  background(0);
  noStroke();

//rectangle//
  if ((mouseX>x) && (mouseX<x+w) && (mouseY>y) && (mouseY<y+h)){
    fill(194,234,83);
  } else {
    fill(61,81,7);
  }
  if (mousePressed){
    fill(0);
  }
  rect(x,y,w,h);
  

//ellipse//
  float d = dist(mouseX,mouseY,x+275,y+275);
  if (d<radius){
    fill(327,43,122);
  } else {
    fill(102,12,53);
  }
  if (mousePressed){
    fill(0);
  }
  ellipse(x+275,y+275,radius,radius);
}
  
  
  



