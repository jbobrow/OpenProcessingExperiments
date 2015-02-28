
// Click within the image to change 
// the value of the rectangle after
// after the mouse has been clicked

int value = 0;

void setup(){
  
  size(500,500,P3D);
  background(255,255,255);
  ellipseMode(CENTER);
  
   
  
}
  
  
  
void draw(){
 background(0);

  stroke(255, 50);
  translate(50, 50, 0);
  rotateX(mouseY * 0.05);
  rotateY(mouseX * 0.05);
  fill(mouseX * 2, 0, 160);
  sphereDetail(mouseX / 4);
  sphere(40);
float r;
r = random(10,90);
 
  
  
smooth();
  colorMode(HSB,360);
  rectMode(CENTER);
 
 
    
//background(255,0,255);
fill(255,0,255,54);
  
rectMode(CENTER);
rect(200,200,400,400);
  
stroke(0);
strokeWeight(1);
ellipse(mouseX,mouseY,r,r);
ellipseMode(CENTER);
ellipse(mouseY,mouseX,r,r);
ellipse(random(0,400),mouseX,r,r);
ellipse(mouseY,random(0,400),r,r);
noStroke();
lights();
translate(58, 48, 0);
sphere(28);
rect(205,mouseX,50,50);
rect(random(0,400),mouseX,50,50);
rect(random(0,400),205,50,50);
rect(mouseX,mouseY,50,50);
rect(105,mouseX,50,50);
rect(mouseY,mouseX,50,50);
rect(mouseX,305,50,50);
rect(mouseX,mouseY,50,50);
rect(205,mouseX,50,50);
rect(0,mouseX,50,50);
rect(random(0,400),400,205,50);
rect(0,mouseY,50,50);
rect(105,mouseX,50,50);
rect(mouseY,mouseX,50,50);
rect(mouseX,305,50,50);
rect(mouseX,mouseY,50,50);
fill(random(0,255),random(0,255),random(0,255));
line(0,random(0,400),random(0,400),400);
line(200,200,mouseX,mouseY);
line(200,200,mouseY,mouseX);
line(200,200,random(0,400),mouseY);
line(200,200,random(0,400),mouseX);
line(200,200,mouseY,random(0,400));
line(200,200,mouseX,random(0,400));
line(200,200,mouseY,random(0,200));
line(200,200,mouseX,random(0,200));
 
 
 
  
noStroke();
colorMode(HSB);
fill(mouseX,255,255);
 
ellipse(mouseX,mouseY,r,r);
ellipseMode(CENTER);
ellipse(mouseY,mouseX,r,r);
ellipse(random(0,400),mouseX,r,r);
ellipse(mouseY,random(0,400),r,r);
noStroke();
lights();
translate(58, 48, 0);
sphere(28);
rect(205,mouseX,50,50);
rect(random(0,400),mouseX,50,50);
rect(random(0,400),205,50,50);
rect(mouseX,mouseY,50,50);
rect(105,mouseX,50,50);
rect(mouseY,mouseX,50,50);
rect(mouseX,305,50,50);
rect(mouseX,mouseY,50,50);
fill(random(0,255),random(0,255),random(0,255));
line(0,random(0,400),random(0,400),400);
fill(value);
  rect(25, 25, 50, 50);
   rect(200, 200, 50, 50);
    rect(10, 25, 50, 50);
  
  
  

 
 
 
  
  
}

void mouseClicked() {
  if(value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}

