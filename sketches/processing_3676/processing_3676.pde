

void setup(){ 
  size(600,400); 
  noStroke(); 
  smooth(); 
  background(36,38,54); 
  frameRate(10);
} 

void draw(){ 
 fill(36,38,54,70);
  rect(0,0,width,height);
  estrellas(); 
  luna(); 
  edificios();   
  agua(); 
  sombralunistica(); 
  nube(); 


} 

void estrellas(){ 

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

  pushMatrix();
  translate(mouseX-197,mouseY-210);
  noStroke(); 
  float alfa= random(0,10); 
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

 popMatrix();
} 



void edificios(){ 
  float beta=random (50,100); 
  fill (160,160,160,beta);  
  ; 
  beginShape(); 
  vertex(0,396);
  vertex(0,231);
  vertex(69,231);
  vertex(69,278);
  vertex(126,278);
  vertex(126,232);
  vertex(138,208);
  vertex(138,186);
  vertex(141,207);
  vertex(152,231);
  vertex(152,333);
  vertex(202,334);
  vertex(202,394);
  vertex(112,395);
  vertex(25,393);
  vertex(0,396);  
  vertex(200,334);
  vertex(200,299);
  vertex(210,299);
  vertex(210,230);
  vertex(228,330);
  vertex(231,330);
  vertex(210,330);
  vertex(210,335);
  vertex(210,335);
  vertex(210,393);
  vertex(210,329);
  vertex(226,329);
  vertex(228,392);
  vertex(200,392);
  endShape(); 
} 

void agua(){ 
  fill  (23,94,129,mouseX);    
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
  fill(r,g,b,220); 
  ellipse(270,170,70,70); 
} 
void sombralunistica(){ 
  fill(36,38,54); 
  ellipse(290,170,60,60); 
} 


void keyPressed(){

  setup(); 
}


