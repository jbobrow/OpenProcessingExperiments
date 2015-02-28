
void setup(){
size(500,450);
 background(255);
 smooth();
 //fill(255);
 strokeWeight(6); //llne thickness


}

void draw(){
 

 if (mousePressed) {
  line(mouseX,mouseY,pmouseX,pmouseY);
  fill(125);
  line(mouseX-2,mouseY-2,pmouseX,pmouseY);
  fill(5);
  line(mouseX-3,mouseY+2,pmouseX,pmouseY);
   fill(155);
  line(mouseX-2,mouseY-2,pmouseX,pmouseY);
  fill(25);
  line(mouseX-3,mouseY+2,pmouseX,pmouseY);
  //round(mouseX,mouseY,100,100);
  
  delay(100);
    fill(255);
 }
}               
