
void setup() {
  size(600,400);
  noStroke();
} 

void draw() {
  background(255);
  maple(400,200,1,80,220);
  maple(100,300,0.5,20,200);
  maple(300,100,1,30,180);
  maple(50,100,1,40,230);
  maple(150,120,0.7,10,50);
}

void maple(int x, int y,float s,float r,int c) {
  pushMatrix();
  translate(x,y);
  scale(s);
  rotate(radians(r));
  fill(c,50,0);
  smooth();

  beginShape();
  vertex(0,-150);
  bezierVertex(-20,-40,-40,-30,-15,0);
  bezierVertex(-50,-50,-50,-30,-120,-70);
  bezierVertex(-70,-10,-70,20,-25,20);
  bezierVertex(-120,30,-70,70,-120,100);
  bezierVertex(-120,100,-90,100,-15,40);
  bezierVertex(-10,40,-30,40,-40,80);
  bezierVertex(-10,60,-10,60,-2,45);
  bezierVertex(-2,120,-10,160,0,150);
  endShape();


  translate(200,-200);
  beginShape();
  vertex(-200,50);
  bezierVertex(-170,150,-170,170,-185,200);
  bezierVertex(-150,150,-150,150,-60,130);
  bezierVertex(-130,210,-150,220,-175,220);
  bezierVertex(-80,230,-110,250,-80,300);
  bezierVertex(-80,300,-110,300,-185,240);
  bezierVertex(-190,240,-170,240,-160,280);
  bezierVertex(-190,260,-190,260,-198,245);
  bezierVertex(-198,300,-190,360,-200,350);
  endShape();
  popMatrix();
}


