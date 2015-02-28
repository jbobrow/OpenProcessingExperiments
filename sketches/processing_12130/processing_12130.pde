

void setup() {
size (500,500);
smooth();
background(0);
}
  void draw(){
    fill(225,1);
    rect(0, 0, width, height);
 if (mouseButton == LEFT){
 stroke(random(1,255),random(1,255),random(1,255));
 strokeWeight(10);
 fill(mouseX,mouseY, mouseY);
 quad(mouseX, mouseY, 50,50, 20, 10, 40,70);

stroke(0);
 }}
void mousePressed(){
   if(mouseButton == RIGHT){
   fill(random(1,255),random(1,255),random(1,255));
rect(mouseX,mouseY,random(1,100),random(1,100));
 }}
 
 

