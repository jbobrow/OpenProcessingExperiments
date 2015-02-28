
float x,y;

void setup(){
  size(1020,762);
  background(0,0,0);
  smooth();  
  PFont lu;
  lu=createFont("",50);
  textFont(lu);
  
  x=0.1;
  y=0.2;
  
}

void draw(){
  PImage b;
  b= loadImage("carro.jpg");
  image(b,0,0);
  
  smooth();
  noStroke();
  
  fill(255,110,200);
  arc(550,170,380,70,10,PI*10);
  
  fill(random(100),random(100),random(150));
  text("Felipe K4",430,190);
  
  fill(245,150,10);
  text("Oi Kabum",430,690);
  
  pushMatrix();
  //farol esquerdo
  fill(255,110,200);
  ellipse(275,545,65,70);
  
  //farol direito
  fill(255,110,200);
  ellipse(798,543,65,70);
  popMatrix();
  
  pushMatrix();
  //farol de milha esquerdo
  fill(2,0,random(200));
  ellipse(287,643,20,20);
  
  //farol de milha direito
  fill(2,0,random(200));
  ellipse(790,640,20,20);
  popMatrix();
  
 
  fill(random(200),10,200);
  arc(539,610,50,50,0,PI);
  
  fill(255,110,200);
  arc(539,710,280,20,0,PI);
  
  fill(random(100,255),0,0);
  rect(395,340,20,25);
  
  pushMatrix();
  fill(2,0,random(200));
  rect(450,331,30,30);
  rect(510,325,30,30);
  rect(570,331,30,30);
  popMatrix();
  
  fill(random(100,255),0,0);
  rect(635,340,20,25);
  
  
  x=x +1;
  y=y +2;
}  

