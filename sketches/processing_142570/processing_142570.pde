
void setup() {
  size(500, 500);
}

void draw(){
 
 pushMatrix();
  background(0,0,0);
  noStroke();
  fill(255);
  float r1 = map(0, mouseY, 500, 0, 50);
  float r2 = map(mouseX, mouseY, 0, 0, 50);
  //float r2 = map(mouseY, 0, 500, 0, -90);
    //float r3 = map(0, mouseX, 500, 0, 200);
  translate(r2, 0);

  popMatrix();
  resetMatrix();
   
  noStroke();
  fill(255);
  
  //ellipse (250, 250, 200, r3);

rect (130, 20, 230, r1);
rect (130, 50, 230, r1);
fill(19,90,130);
rect (130, 80, 230, r1);
fill(255,255,255);
rect (130, 110, 230, r1);
rect (130, 140, 230, r1);
rect (130, 170, 230, r1);

rect (130, 200, 230, r1);
rect (130, 230, 230, r1);
fill(19,90,130);
rect (130, 260, 230, r1);
fill(255,255,255);

rect (130, 290, 230, r1);
rect (130, 320, 230, r1);
rect (130, 350, 230, r1);

rect (130, 380, 230, r1);

rect (130, 410, 230, r1);
fill(19,90,130);
rect (130, 440, 230, r1);
fill(255,255,255);
rect (130, 470, 230, r1);
rect (130, 500, 230, r1);
fill(19,90,130);
rect (130, 260, 230, r1);




}
