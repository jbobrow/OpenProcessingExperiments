
//import processing.pdf.*;

void setup() {
  size(420,800);//,PDF,"filename.pdf");

  background(255);
}




void draw() {
  for(int x=50; x < 380; x+=20) {
    ellipse(x, random(100,240), random(100,120), random(80,120));

    int y=floor(random(300,760));

    beginShape();
    vertex(x,y+26);
    vertex(x+8,y+12);
    vertex(x+10,y+8);
    vertex(x+12,y);
    vertex(x+14,y+8);
    vertex(x+16,y+12);
    vertex(x+24,y+26);
    endShape();

    ellipse(x+12,y+30,25,20);
    ellipse(x+12,y+18,5,5);
  }
 // println("Finished.");
noLoop();
}
 
                
