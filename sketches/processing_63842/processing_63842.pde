
float x = 40;
float y = 40;
float change = 1;
float geschwindigkeit = 1.09;
float colR = mouseY;
float rad = 3;
  
void setup() {
  size(800, 600);
  smooth();
  colorMode(RGB,600,255,255);
  fill(460,200,200,40);
  rect(0,0,width,height);
}
void draw() {
 
  x= x+change * mouseY*0.1;
  y = y*geschwindigkeit;
  //geschwindigkeit=random(-2,3);
  
  if ((y >= height) || (y <= 1)) {
    geschwindigkeit=1/geschwindigkeit;
    y= 1;
  }
  
  if ((x >= width) || (x <= 4)) {
    change =-change;
    x=1;
     
  }
  colR = mouseY;
  strokeWeight (rad);
  stroke (colR,random(10,20),random(80),80);
  noFill();
  //fill (colR,random(10,20),random(80),80);
  ellipse (width/2,height/2,x*2+mouseX/2,y+mouseY*1.3);
  
}
 
void mousePressed() {
rad = rad*1.2;
}
 
void keyPressed() {
rad= 3;
 noStroke();
 fill(460,200,200);
 rect(0,0,width,height);
}


