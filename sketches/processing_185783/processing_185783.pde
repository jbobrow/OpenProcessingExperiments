
void setup(){
 size(400,400);
 background(255);
 rectMode(CORNERS);
 ellipseMode(CORNERS);
 noStroke();
}
void drawPattern1(){
  fill(#FFF5EE);
  rect(0,0,100,200);
  fill(0);
  rect(0,0,100,200,30);
  fill(#FFF5EE);
  rect(25,25,100,175,30);
  fill(0);
  rect(50,55,100,145,30);
  fill(0);
  ellipse(50,50,100,100);
  ellipse(50,100,100,150);
  fill(#FFF5EE);
  rect(76,80,100,120,30);
  ellipse(76,75,100,100);
  ellipse(76,100,100,125);
}
void drawPattern2(){
  fill(0);
  rect(0,0,100,200);
  fill(#FFF5EE);
  rect(0,0,100,200,30);
  fill(0);
  rect(25,25,100,175,30);
  fill(#FFF5EE);
  rect(50,55,100,145,50);
  fill(#FFF5EE);
  ellipse(50,50,100,100);
  ellipse(50,100,100,150);
  fill(0);
  rect(76,80,100,120,30);
  ellipse(76,75,100,100);
  ellipse(76,100,100,125);
}
void drawPattern3(){
  fill(0);
  rect(100,100,200,300);
  fill(#FFF5EE);
  rect(100,100,200,300,30,30,30,0);
  fill(0);
  rect(100,125,175,275,30,30,30,0);
  fill(#FFF5EE);
  rect(100,160,150,250,30,30,30,0);
  ellipse(100,150,150,200);
  fill(0);
  rect(100,180,125,200,30,30,0,0);
  ellipse(100,175,125,200);
  arc(75,175,125,225,0,HALF_PI); 
}
void drawPattern4(){
 fill(#FFF5EE);
  rect(100,100,200,300);
  fill(0);
  rect(100,100,200,300,30,30,30,0);
  fill(#FFF5EE);
  rect(100,125,175,275,30,30,30,0);
  fill(0);
  rect(100,160,150,250,30,30,30,0);
  ellipse(100,150,150,200);
  fill(#FFF5EE);
  rect(100,180,125,200,30,30,0,0);
  ellipse(100,175,125,200);  
  arc(75,175,125,225,0,HALF_PI);
}
  
void draw(){
 //Oben der 1. Spalte
   drawPattern1();
  //Unten der 1. Spalte 
  pushMatrix();
  translate(0,height/2);
  drawPattern2();
  popMatrix(); 
  //Mitte der 2.Spalte
  drawPattern3();
  //Oben der 2. Spalte
  pushMatrix();
  translate(0,-height/2);
  drawPattern4();
  popMatrix();
  //Unten der 2. Spalte
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
}


