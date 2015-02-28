
void setup(){
  size(600,600);
}

void draw(){
  background(255);
  lego(100,100);
  lego(250,100);
  lego(100,250);
  lego(250,250);
  lego(400,400);
}

 
void lego(int x, int y){
  pushMatrix();
  translate(x,y);
  smooth();
  strokeWeight(2);
  strokeJoin(BEVEL);

fill(255,242,0);
beginShape();
vertex(140,220);
vertex(120,220);
vertex(93,320);
vertex(93,345);
vertex(120,345);
endShape();

beginShape();
vertex(240,220);
vertex(260,220);
vertex(285,320);
vertex(285,345);
vertex(260,345);
endShape();
 fill(255,242,0);
  rect(140,140,100,70);
  quad(140,220,120,320,260,320,240,220);
  quad(120,320,120,360,260,360,260,320);
  rect(160,210,60,10);
  rect(135,360,45,100);
  rect(200,360,45,100);
  rect(160,120,60,20);
  line(170,190,210,190);
  fill(0);
  ellipse(170,170,10,10);
  ellipse(210,170,10,10);
  popMatrix();
}

