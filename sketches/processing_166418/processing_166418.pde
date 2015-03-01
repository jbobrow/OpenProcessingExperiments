
float pos = 15;
int relleno1 = 1;
void setup(){

size(255,255);
}

void draw() {
  background(255,167,3);
  fill(3,249,relleno1);
 
  stroke(#57728E);
  
   strokeWeight(4);
 ellipse(mouseX-20,mouseY-20,pos,pos);
 ellipse(mouseX+20,mouseY-20,pos,pos);
  strokeWeight(8);
 line(mouseX,mouseY-15,mouseX,mouseY-40);
 line(mouseX-15,mouseY-50,mouseX,mouseY-40);
  line(mouseX-15,mouseY-50,mouseX+5,mouseY-60);
   line(mouseX+5,mouseY-60,mouseX+15,mouseY-50);
    line(mouseX+15,mouseY-50,mouseX+25,mouseY-50);
    
    fill(#57728E);
    stroke(#57728E);
  
   strokeWeight(4);
   pos= 05+mouseY*0.1;
     ellipse(mouseX+25,mouseY-70,pos,pos);
 relleno1 = 1+mouseX;
 pos= 05+mouseY*0.2;
}


