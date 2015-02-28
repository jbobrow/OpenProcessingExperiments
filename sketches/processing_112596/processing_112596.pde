
void setup(){
  size (400,400);
  background(240,27,27);
}

void draw(){
 background(240,27,27);
 //noStroke();
 fill(3,46,255);
 rect(50,50,100,100);
 stroke(255,255,255);
 rect(mouseX-100,mouseY-100,mouseX+100,mouseY+100);
 line(50,50,mouseX-100,mouseY-100);
 line(150,50,mouseX+200,mouseY-100);
 line(50,150,mouseX-100,mouseY+200);
 line(150,150,mouseX+200,mouseY+200);
 }


