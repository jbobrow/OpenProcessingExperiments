
float angle=0; 
void setup() {
size(800,400);
background(5);
smooth(); 
}

void draw() {
  if(mousePressed==true){
    angle+=0.1;
 float durchmesser=dist(pmouseX,pmouseY,mouseX,mouseY);

stroke(random(80,100),200,50);
translate(mouseX,mouseY);
rotate(360);
line(0,0,random(100),0);
ellipse(0,0, random(width/20), random(height/20));
}
}
void keyPressed() {
  }
           
