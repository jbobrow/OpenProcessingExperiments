
void setup() {
size(500, 500);
noStroke();
}
void draw() {
  background(0);
  float d = dist(width/2, height/2, mouseX, mouseY);
  
  beginShape();
  fill(250,250,80,100);
  vertex(d*2,100);
    vertex(200,150);
  vertex(250,100);
    vertex(300,150);
  vertex(d*2,100);
    vertex(350,200);
  vertex(d*2,250);
    vertex(350,300);
  vertex(d*2,400);
    vertex(300,350);
  vertex(250,400);
    vertex(200,350);
  vertex(d*2,400);
    vertex(150,300);
  vertex(d*2,250);
    vertex(150,200);
  endShape(CLOSE);
  
  pushMatrix();
  fill(250,120,120,100);
   translate(500,0);
   rotate(HALF_PI);
    beginShape();
  vertex(d*2,100);
    vertex(200,150);
  vertex(250,100);
    vertex(300,150);
  vertex(d*2,100);
    vertex(350,200);
  vertex(d*2,250);
    vertex(350,300);
  vertex(d*2,400);
    vertex(300,350);
  vertex(250,400);
    vertex(200,350);
  vertex(d*2,400);
    vertex(150,300);
  vertex(d*2,250);
    vertex(150,200);
 endShape(CLOSE);
 popMatrix();
 
 pushMatrix();
 fill(120,250,250,100);
   translate(500,500);
   rotate(PI);
    beginShape();
  vertex(d*2,100);
    vertex(200,150);
  vertex(250,100);
    vertex(300,150);
  vertex(d*2,100);
    vertex(350,200);
  vertex(d*2,250);
    vertex(350,300);
  vertex(d*2,400);
    vertex(300,350);
  vertex(250,400);
    vertex(200,350);
  vertex(d*2,400);
    vertex(150,300);
  vertex(d*2,250);
    vertex(150,200);
 endShape(CLOSE);
 popMatrix();
 
  pushMatrix();
  fill(255,100);
   translate(0,500);
   rotate(-HALF_PI);
    beginShape();
  vertex(d*2,100);
    vertex(200,150);
  vertex(250,100);
    vertex(300,150);
  vertex(d*2,100);
    vertex(350,200);
  vertex(d*2,250);
    vertex(350,300);
  vertex(d*2,400);
    vertex(300,350);
  vertex(250,400);
    vertex(200,350);
  vertex(d*2,400);
    vertex(150,300);
  vertex(d*2,250);
    vertex(150,200);
 endShape(CLOSE);
 popMatrix();
}


