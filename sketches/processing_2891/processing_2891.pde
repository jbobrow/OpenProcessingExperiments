
void setup(){
  size(600,400);
  noStroke();
  smooth();
  background(36,38,54);
}

void draw(){
  estrellas();
  luna();
  edificios();  
  agua();
  sombralunistica();
  nube();


}

void estrellas(){
  delay(500);
  float x=random(800);
  float y= random(200);

  float r= random (200,255);
  float g= random (247,255);
  float b= random (0);
  float alfa= random (10,255);
  fill(r,g,b,alfa);
  ellipse(x,y,random(7),5);
}



  void nube (){
 
 
    noStroke();
    float alfa= random(0,20);
    fill(255,255,255,alfa);
  
  beginShape();
  curveVertex(197,210);
  curveVertex(206,211);
  curveVertex(216,213);
  curveVertex(227,210);
  curveVertex(240,210);
  curveVertex(255,217);
  curveVertex(269,223);
  curveVertex(281,227);
  curveVertex(288,230);
  curveVertex(296,234);
  curveVertex(302,240);
  curveVertex(302,248);
  curveVertex(295,255);
  curveVertex(274,267);
  curveVertex(245,274);
  curveVertex(239,268);
  curveVertex(228,265);
  curveVertex(209,282);
  curveVertex(201,278);
  curveVertex(181,264);
  curveVertex(170,254);
  curveVertex(152,253);
  curveVertex(136,242);
  curveVertex(144,232);
  curveVertex(158,224);
  curveVertex(169,203);
  endShape(CLOSE);
}



void edificios(){
  float beta=random (50,100);
  fill (160,160,160,beta); 
  ;
  beginShape();

  vertex(1,234);
  vertex(73,236);
  vertex(74,280);
  vertex(129,282);
  vertex(132,236);
  vertex(143,216);
  vertex(153,237);
  vertex(160,286);
  vertex(162,336);
  vertex(184,338);
  vertex(203,338);
  vertex(204,368);
  vertex(204,399);
  vertex(0,400);  

  endShape();
}

void agua(){
  fill  (0,mouseY,mouseX,1);   
  beginShape();
  vertex(228,397);

  vertex(244,395);

  vertex(277,395);

  vertex(305,392);

  vertex(335,392);

  vertex(370,397);

  vertex(397,391);

  vertex(452,393);

  vertex(487,398);

  vertex(516,392);

  vertex(541,383);

  vertex(580,380);

  vertex(631,389);

  vertex(639,397);

  endShape(CLOSE);
}

void luna(){
  float r= random (254,255);
  float g= random (250,251);
  float b= random (167);
  fill(r,g,b,5);
  ellipse(270,170,70,70);
}
void sombralunistica(){
  fill(36,38,54);
  ellipse(290,170,60,60);
}



