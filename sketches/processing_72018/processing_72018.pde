
// Constants
int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2, c1, c2;

void setup(){
  size(380,600);
  smooth();
  
   // Define colors
  b1 = color(238,200,85);
  b2 = color(253,238,127);
  c1 = color(222, 142, 73);
  c2 = color(0, 102, 153);
  

  noLoop();
}

void draw(){
  // Background
  setGradient(0, 0, width, height/2, b1, b2, Y_AXIS);
  setGradient(0, height/2, width, height/2, b2, c1, Y_AXIS);
  

  
  //big red triangle
  fill(255,00,000);
  stroke(204,80,10);

  beginShape();
    vertex(40, 120); //1
    vertex(85, 120);
    vertex(85, 80);  //3
    vertex(140,78);
    vertex(138, 430); //5
    vertex(40, 120);
  endShape();
  
   //left black triangle
  fill(000,000,000);
  noStroke();
  beginShape();
    vertex(50, 50); //1
    vertex(120, 50);
    vertex(85, 200);  //3
    vertex(50,50);
  endShape();
  
 //black lines
 //big line
 strokeWeight(10);
 stroke(0);
 line(0,400,200,300);
 
 //#
 strokeWeight(1);
 stroke(0);
 line(270,200,270,260);
 line(290,200,290,260);
 line(250,220,310,220);
 line(250,240,310,240);

 
  
  //main sun
  noStroke();
  fill(188,128,51);
  ellipse(380,0,100,100);
  
  //sun rings
  noFill();
  stroke(0);
  strokeWeight(.25);
  ellipse(380,0,105,105);
  ellipse(380,0,102,102);
  ellipse(380,0,110,110);
  ellipse(380,0,115,115);
  ellipse(380,0,122,122);

  //lower right rectangles
  fill(236,90,15,200);
  noStroke();
  rect(320,420,300,300);
  
  fill(197,10,20,190);
  noStroke();
  rect(250,480,300,300);
 
  fill(182,55,23,190);
  noStroke();
  rect(190,520,300,300);
  
 
  
  fill(216,37,50,190);
  noStroke();
  rect(280,440,300,300);
  
  
  //black
  fill(18,9,8,230);
  noStroke();
  rect(300,560,50,80);
  
  
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
