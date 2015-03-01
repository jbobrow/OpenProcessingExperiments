
void setup(){
  size(510,510);
}
void draw(){
  background(random(255));
  
  //Variables
  float mida1X = mouseX/5;
  float mida1Y = mouseY/3;
  float mida2 = mouseX/7;
  float mida3 = mouseY/4;
  float mida4 = mouseX/40;
  float mida5 = mouseY/1.5;
  float mida6 = mouseX*0.30;
  float mida7 = mouseY*0.15;
  float mida8 = mouseX/0.9;
  float mida9 = mouseX/4;
  float mida10 = mouseY/3.3;
  float mida11 = mouseX/6;
  float mida12= mouseX/12;
  float mida13 = mouseY/3.1;
  float midaNas = mouseX/32;
  float midaUlls = mouseX*0.20;
  float midaNineta = mouseX*0.10;
  float midaPotes = mouseX*0.07;
  
  //Cos
  fill(62,140,68);
  stroke(62,140,68);
  strokeWeight(midaPotes);
  point(mouseX-mida12,mouseY+mida1Y);
  point(mouseX-mida11,mouseY+mida13);
  point(mouseX-mida9,mouseY+mida10);
  point(mouseX+mida12,mouseY+mida1Y);
  point(mouseX+mida11,mouseY+mida13);
  point(mouseX+mida9,mouseY+mida10);
  noStroke();
  ellipse(mouseX,mouseY+mida2,mida8,mida1Y);
  
  //Cara
  fill(62,180,68);
  ellipse(mouseX,mouseY,mouseX,mida5);
  
  //Nas
  stroke(0);
  strokeWeight(midaNas);
  point(mouseX-mida4,mouseY);
  point(mouseX+mida4,mouseY);
  
  //Ulls
  stroke(62,180,68);
  strokeWeight(mouseX/20);
  fill(255);
  ellipse(mouseX-mida1X,mouseY-mida1Y,midaUlls,midaUlls);
  ellipse(mouseX+mida1X,mouseY-mida1Y,midaUlls,midaUlls);
  noStroke();
  fill(0);
  ellipse(mouseX-mida1X,mouseY-mida1Y,midaNineta,midaNineta);
  ellipse(mouseX+mida1X,mouseY-mida1Y,midaNineta,midaNineta);

  //Boca
  stroke(178,50,0);
  strokeWeight(3);
  fill(255,30,30);
  arc(mouseX,mouseY+mida2,mida6,mida7,0,PI+QUARTER_PI);
}
