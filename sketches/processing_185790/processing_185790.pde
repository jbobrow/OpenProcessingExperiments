
color beige = #FFF5EE;
color schwarz = #000000;

void setup(){
 size(400,400);
 background(255);
 rectMode(CORNERS);
 ellipseMode(CORNERS);
 colorMode(HSB,360,100,100);
 noStroke();
 frameRate(3);
}

void drawPattern1(){
  fill(beige);
  rect(0,0,100,200);
  fill(schwarz);
  rect(0,0,100,200,30);
  fill(beige);
  rect(25,25,100,175,30);
  fill(schwarz);
  rect(50,55,100,145,30);
  fill(schwarz);
  ellipse(50,50,100,100);
  ellipse(50,100,100,150);
  fill(beige);
  rect(76,80,100,120,30);
  ellipse(76,75,100,100);
  ellipse(76,100,100,125);
}
void drawPattern2(){
  fill(schwarz);
  rect(0,0,100,200);
  fill(beige);
  rect(0,0,100,200,30);
  fill(schwarz);
  rect(25,25,100,175,30);
  fill(beige);
  rect(50,55,100,145,50);
  fill(beige);
  ellipse(50,50,100,100);
  ellipse(50,100,100,150);
  fill(schwarz);
  rect(76,80,100,120,30);
  ellipse(76,75,100,100);
  ellipse(76,100,100,125);
}
void drawPattern3(){
  fill(schwarz);
  rect(100,100,200,300);
  fill(beige);
  rect(100,100,200,300,30,30,30,0);
  fill(schwarz);
  rect(100,125,175,275,30,30,30,0);
  fill(beige);
  rect(100,160,150,250,30,30,30,0);
  ellipse(100,150,150,200);
  fill(schwarz);
  rect(100,180,125,200,30,30,0,0);
  ellipse(100,175,125,200);
  arc(75,175,125,225,0,HALF_PI);
}
void drawPattern4(){
 fill(beige);
  rect(100,100,200,300);
  fill(schwarz);
  rect(100,100,200,300,30,30,30,0);
  fill(beige);
  rect(100,125,175,275,30,30,30,0);
  fill(schwarz);
  rect(100,160,150,250,30,30,30,0);
  ellipse(100,150,150,200);
  fill(beige);
  rect(100,180,125,200,30,30,0,0);
  ellipse(100,175,125,200);  
  arc(75,175,125,225,0,HALF_PI);
}
  
void draw(){
  background(255);
  //Oben der 1. Spalten
  drawPattern1();
 //Unten der 1. Spalte 
  pushMatrix(); 
  translate(0,height/2);
  drawPattern2();
  popMatrix();
  drawPattern3();  
  //Oben der 2. Spalte
  pushMatrix();
  translate(0,-height/2);
  drawPattern4();
  popMatrix();
  //Unten der 2. Spalten
  pushMatrix();
  translate(0,height/2);
  drawPattern4();
  popMatrix();
  //Oben der 3. Spalte
  pushMatrix();
  translate(width/2,0);
  drawPattern2();
  popMatrix();  
  //Unten der 3. Spalte
  pushMatrix();
  translate(width/2,height/2);
  drawPattern1();
  popMatrix();  
  //Mitte der 4. Spalte
  pushMatrix();
  translate(width/2,0);
  drawPattern4();
  popMatrix();  
  //Oben der 4. Spalte
  pushMatrix();
  translate(width/2,-height/2);
  drawPattern3();
  popMatrix(); 
  //Unten der 4. Spalte
  pushMatrix();
  translate(width/2,height/2);
  drawPattern3();
  popMatrix();
  
  beige=color(random(0,360),random(0,100),random(0,100));
  schwarz=color(random(0,360),random(0,100),random(0,100));
}



