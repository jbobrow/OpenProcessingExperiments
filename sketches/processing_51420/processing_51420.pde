
void setup () {
  size(400,400);
  smooth();
  frameRate(30);}
  
  void draw() {
    ///background
    background(255);
    stroke(0);
    fill(175,40,33);
    ellipse(mouseX,mouseY,20,103);
    ellipse(mouseX,mouseY,90,100);
   ellipse(mouseX,mouseY,60,100); 
  
  
  fill(33,88,69);
    arc(50, 55, 50, 50, 0, PI/2);
fill(33,88,60);
arc(55, 59, 60, 60, PI/2, PI);
arc(50, 55, 70, 70, PI, TWO_PI-PI/2);
arc(50, 55, 80, 80, TWO_PI-PI/100, TWO_PI);
    
    stroke(0);
    fill(100,33,56);
     
  line(mouseX-9,mouseY+50,pmouseX-50,mouseY+60);
  line(mouseX+2,mouseY+19,pmouseX+9,pmouseY-2); 
  ellipse(mouseX,mouseY,100,30);}
  
 void mousePressed() {
    stroke(0);
    fill(17,33,55);
    ellipseMode(CENTER);
  ellipse(mouseX,mouseY,13,19);
  ellipse(mouseX,mouseY,12,12);
 
 ellipse(mouseX+2,mouseY-8,pmouseX-5,pmouseY+3); }
  


 

