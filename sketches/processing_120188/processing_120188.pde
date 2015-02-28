
int color1= 255;
int color2= 255;
int color3= 255;
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(0)}

void draw() { 
  strokeWeight(pmouseX-mouseX);
  stroke(color1,color2,color3);
  line(mouseX,mouseY,pmouseX,pmouseY);
  line((mouseX-200),mouseY,(pmouseX-200),pmouseY);
}
void mousePressed(){
    color1=random(0,255);
    color2=random(0,255);
    color3=random(0,255);
    fill(color1,color2,color3);
    ellipse(mouseX,mouseY,20,20);
        ellipse((mouseX-12),(mouseY-12),4,4);
        ellipse((mouseX-12),(mouseY+12),4,4);
        ellipse((mouseX+12),(mouseY+12),4,4);
        ellipse((mouseX+12),(mouseY-12),4,4);
    ellipse((mouseX-200),mouseY,20,20);
        ellipse((mouseX-212),(mouseY-12),4,4);
        ellipse((mouseX-212),(mouseY+12),4,4);
        ellipse((mouseX-188),(mouseY+12),4,4);
        ellipse((mouseX-188),(mouseY-12),4,4);
}
