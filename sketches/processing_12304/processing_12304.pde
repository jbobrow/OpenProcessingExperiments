
// Assignment # : 2
// Name: Janielle Vidal
// E-mail: jvidal@brynmawr.edu
// Date: September 15, 2010


float x, y, w, h; 
void setup() {
  smooth();
  size (600,600);
  background(0);
	x = 300;

	y = 150;

	w = 200;

	h = 275;
}
  void draw() {
    //Ankh
    noStroke();
    fill(196,174,6);
    strokeWeight(8);
    stroke(41,2,67);
    ellipse(x,y,w,h);
    triangle(x,y+145,110, 265, 110,335);
    triangle(x,y+145,490,265, 490, 335);
    triangle(x,y+163,250,570, 350, 570);
    fill(0);
    ellipse(x,y,w-70,h-80);
    
    //Infinity Symbol
    frameRate(5);
    noFill();
    strokeWeight(2);
    arc(mouseX,mouseY,30,20,0,PI);
    arc(mouseX+30, mouseY,30,20,PI, 2*PI);
    stroke(196,174,6);
    arc(mouseX+30,mouseY,30,20,0,PI);
    arc(mouseX, mouseY,30,20,PI,2*PI);
    
    
} 

  void mousePressed() {
    noLoop();
    stroke(0);
    background(255);
    x=300;
    y=300;
    w=400;
    h=400;
    
    //YingYang - Outer
    fill(255);
    arc(x,y,w,h, PI/2, 3*PI/2);
    fill(0);
    arc(x,y,w,h,-PI/2,PI/2);
    
//  Ying Yang- inner
    fill(0);
    arc(x,y*1.33,w/2,h/2,PI/2,3*PI/2);
    fill(255);
    arc(x,y*.6666676,w/2,h/2,-PI/2, PI/2);
    
//  YingYang-small circles
    ellipse(x,y+100,40,40);
    fill(0);
    ellipse(x,y-100,40,40);
  }
 
    



