
void setup(){
size(765,100);} 
void draw(){background(0);noFill();noCursor();stroke(mouseX/3);translate(mouseX,mouseY);quad(0,0,10,10,4,10,0,14);quad(6,10,8,15,6,16,3,11);stroke(1);line(3,10,5,10);}

