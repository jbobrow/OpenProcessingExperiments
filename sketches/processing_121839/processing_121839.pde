
int counter;

void setup() {
 size(200,200);

 }
 
 void draw() {
 background(255);
 noStroke(); 
 //OREN
 fill(3,164,45);
 ellipseMode(CENTER);
 ellipse(mouseX -30,mouseY -30,25,25);
 ellipseMode(CENTER);
 ellipse(mouseX +30,mouseY -30,25,25);
 fill(52,105,33);
 ellipseMode(CENTER);
 ellipse(mouseX -30,mouseY -30,20,20);
 ellipseMode(CENTER);
 ellipse(mouseX +30,mouseY -30,20,20);
 //POTEN
 fill(3,164,45);
 rectMode(CENTER);
 rect(mouseX -10,mouseY +35,15,25);
 rect(mouseX +10,mouseY +35,15,25);
 //HOOFD
 fill(1,183,48);
 ellipseMode(CENTER);
 ellipse(mouseX,mouseY,100,75);
  //OGEN
 fill(255);
  ellipse(mouseX -12,mouseY -15,17,15);
 ellipse(mouseX +12,mouseY -15,17,15);
  fill(0);
 ellipse(mouseX -12,mouseY -15,10,10);
 ellipse(mouseX +12,mouseY -15,10,10);
 //NEUS
 fill(10,146,45);
 ellipseMode(CENTER);
 ellipse(mouseX,mouseY,30,15);
 fill(34,34,34);
 ellipse(mouseX -5,mouseY,5,5);
 ellipse(mouseX +5,mouseY,5,5);
 //MOND
 fill(0);
 ellipse(mouseX,mouseY +20,20,15);
 fill(249,0,41);
 ellipse(mouseX,mouseY +25,15,5);
 //HOED
 fill(0);
 rect(mouseX, mouseY -35, 50, 8);
 fill(0);
 arc(mouseX, mouseY -35,40,40,-PI, 0);
}
 
 
