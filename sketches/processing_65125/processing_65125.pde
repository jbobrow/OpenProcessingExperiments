
float xpos, ypos;
 
void setup() {
  size(1170,560);
  xpos = width/2;
 ypos = 0;
  smooth();
  rectMode(CENTER);
}
void draw() {
  background(255);
   
  for(int i =0; i <=width; i+=128){
  pushMatrix();
  float angle = atan2(mouseY-ypos, mouseX-i); // y first. x later.
 translate(i, ypos);
 scale(0.3);
 
    float xpos=map(mouseX,0,width,240,370);
    float xpos2=map(mouseX,0,width,150,280);
    float diff1 = xpos - 80;
    float diff2 = xpos2 - 80;
    float fill1 = map(diff1, 150,280, 10, 80);
    float fill2 = map(diff2, 280,150, 10, 80);
    
   beginShape();
   fill(fill1,200);
   noStroke();
   vertex(90,260);
   vertex(90,340);
   vertex(xpos,340);
   vertex(xpos,180);
   endShape();
 
   beginShape();
   fill(fill2,180);
   noStroke();
   vertex(420,260);
   vertex(420,340);
   vertex(xpos2,340);
   vertex(xpos2,180);
   endShape();
 
popMatrix();

  pushMatrix();
 translate(i, ypos+60);
 scale(0.3);
   beginShape();
   fill(fill1,200);
   noStroke();
   vertex(90,260);
   vertex(90,340);
   vertex(xpos,340);
   vertex(xpos,180);
   endShape();
   beginShape();
   fill(fill2,180);
   noStroke();
   vertex(420,260);
   vertex(420,340);
   vertex(xpos2,340);
   vertex(xpos2,180);
   endShape();
popMatrix();



  pushMatrix();
 translate(i, ypos+120);
 scale(0.3);
   beginShape();
   fill(fill1,200);
   noStroke();
   vertex(90,260);
   vertex(90,340);
   vertex(xpos,340);
   vertex(xpos,180);
   endShape();
   beginShape();
   fill(fill2,180);
   noStroke();
   vertex(420,260);
   vertex(420,340);
   vertex(xpos2,340);
   vertex(xpos2,180);
   endShape();
popMatrix();


pushMatrix();
 translate(i, ypos+180);
 scale(0.3);
   beginShape();
   fill(fill1,200);
   noStroke();
   vertex(90,260);
   vertex(90,340);
   vertex(xpos,340);
   vertex(xpos,180);
   endShape();
   beginShape();
   fill(fill2,180);
   noStroke();
   vertex(420,260);
   vertex(420,340);
   vertex(xpos2,340);
   vertex(xpos2,180);
   endShape();
popMatrix();


pushMatrix();
 translate(i, ypos+240);
 scale(0.3);
   beginShape();
   fill(fill1,200);
   noStroke();
   vertex(90,260);
   vertex(90,340);
   vertex(xpos,340);
   vertex(xpos,180);
   endShape();
   beginShape();
   fill(fill2,180);
   noStroke();
   vertex(420,260);
   vertex(420,340);
   vertex(xpos2,340);
   vertex(xpos2,180);
   endShape();
popMatrix();


pushMatrix();
 translate(i, ypos+300);
 scale(0.3);
   beginShape();
   fill(fill1,200);
   noStroke();
   vertex(90,260);
   vertex(90,340);
   vertex(xpos,340);
   vertex(xpos,180);
   endShape();
   beginShape();
   fill(fill2,180);
   noStroke();
   vertex(420,260);
   vertex(420,340);
   vertex(xpos2,340);
   vertex(xpos2,180);
   endShape();
popMatrix();



pushMatrix();
 translate(i, ypos+360);
 scale(0.3);
   beginShape();
   fill(fill1,200);
   noStroke();
   vertex(90,260);
   vertex(90,340);
   vertex(xpos,340);
   vertex(xpos,180);
   endShape();
   beginShape();
   fill(fill2,180);
   noStroke();
   vertex(420,260);
   vertex(420,340);
   vertex(xpos2,340);
   vertex(xpos2,180);
   endShape();
popMatrix();



pushMatrix();
 translate(i, ypos+420);
 scale(0.3);
   beginShape();
   fill(fill1,200);
   noStroke();
   vertex(90,260);
   vertex(90,340);
   vertex(xpos,340);
   vertex(xpos,180);
   endShape();
   beginShape();
   fill(fill2,180);
   noStroke();
   vertex(420,260);
   vertex(420,340);
   vertex(xpos2,340);
   vertex(xpos2,180);
   endShape();
popMatrix();


    }
  }




