
//Jordana Bungard 
//project 1
//2-18-14
float x = -5;
float y = 5;
int m= minute();
int h= hour();
int s= second();
int e= millis();


void setup() {
background(0);
  size(800, 800);
  frameRate(4);
}
 
void draw() {
  for (int i = 5; i < 500; i = i+5){//pattern
pushMatrix();//stores current position
translate(random(100), 20);//moves the lines
stroke(0); 
popMatrix();//transforms back
pushMatrix();
stroke(170);
translate(random(100), 50);//displaces following line
fill(255); //middle of ellipse 
line (0, 0, 50, 50); //grey lines
popMatrix();
stroke(56,80,9,5);
  stroke(255);//white lines
 line(e*8,x,s,m);
 stroke(0);
   rotate(x*24);//fans everything outwards
 strokeWeight(0.5);
strokeWeight(3);
if (m>10) {stroke(random(256),mouseX,mouseY);}   
else {stroke(mouseX, mouseY,random(256));}
 ellipse(random(500),s+3.5,x,e+5);//random ellipse pattern   
     println(h + ":" + m + ":" + s + ":" + e); // Prints the time to the console

}}
//void keyPressed(){
  //saveFrame(".jpg");}
