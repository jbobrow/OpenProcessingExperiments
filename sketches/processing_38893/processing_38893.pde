
void setup() {
  size(500, 500);
  background(255,255,255);
}

void draw() {
 fill(250,5,5); 
 triangle(30, 75, 58, 20, 86, 75); 
 fill(61,250,5);
 rect(440,28,50,50);
 fill(251,255,4);
 rect(30,440,50,25);
 fill(41,132,255);
 ellipse(440,440,50,50);
 
 for(int i=0;i<30;i++){
   
     point(mouseX+random(100),mouseY+random(100));
    stroke (41,132,255);
    line(pmouseX,pmouseY,mouseX,mouseY);
    stroke (61,250,5);
 }
 
 if (mousePressed == true) {
   point(mouseX+random(100),mouseY+random(100));
    stroke (251,255,4);
    line(pmouseX,pmouseY,mouseX,mouseY);
    stroke (78,250,5);
  } else {
   point(mouseX+random(100),mouseY+random(100));
    stroke (250,5,5);
    line(pmouseX,pmouseY,mouseX,mouseY);
    stroke (251,255,4);
  }
}





