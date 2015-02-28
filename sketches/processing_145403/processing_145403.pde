
//GREEN LANTERN
//fet per Santi Farrés
//Programa que mou de manera "random" un perssonatge i el torna a la seva possició inicial al clicar el mouse

//definim varibles
 float posX;
 float posY;
 float velX;
 float velY;

void setup(){
  size(700,700);
  noStroke();
  velX=int (random(2,4));  //volocitat inicial
  velY=int (random(2,4));
  posX=width/2;            //posició inicial
  posY=height/2;
}
 
void draw(){
  noCursor();
  background(255);
//marc de fons
  fill(118,190,91,127);
  ellipse(width/2,height/2,(2*width)/3,(2*height)/3);
  fill(28,100,1,127);
  ellipse(width/2,height/2,(2*width)/3.25,(2*height)/3.25);
  posX=posX+velX;
  posY=posY+velY;
  //s'ha dividit el size en una cuadricula de 18x18 on s'ha dibuixat el personatge
  //cabell
  fill(55,31,21);
  rect(posX-((2.5*width)/18),posY-((2*height)/18),(5*width)/18,(3*height)/18); 
  //face
  fill(250,214,182);
  rect(posX-((2*width)/18),posY-(height/18),(4*width)/18,(3.5*height)/18);  
  //barveta
  fill(221,187,159);
  rect(posX-((2*width)/18),posY+((1.5*height)/18),(4*width)/18,height/18);
  rect(posX-(width/18),posY+((2*height)/18),(2*width)/18,height/18);
  triangle(posX+((2*width)/18),posY+(height/18),posX+((2*width)/18),posY+((2*height)/18),posX+(width/18),posY+((2*height)/18)); 
  triangle(posX-((2*width)/18),posY+(height/18),posX-((2*width)/18),posY+((2*height)/18),posX-(width/18),posY+((2*height)/18));  
  //mascara
  fill(118,190,91);
  quad(posX+((1.5*width)/18),posY-((0.5*height)/18),posX,posY,posX,posY+(height/18),posX+((1.5*width)/18),posY+((0.5*height)/18));
  quad(posX-((1.5*width)/18),posY-((0.5*height)/18),posX,posY,posX,posY+(height/18),posX-((1.5*width)/18),posY+((0.5*height)/18));
  //tupé
  fill(55,31,21);
  triangle(posX-((2*width)/18),posY-((2*height)/18),posX+((2*width)/18),posY-((2*height)/18),posX-(width/18),posY-((3*height)/18));
  quad(posX-(width/18),posY-((3*height)/18),posX+((2*width)/18),posY-((3*height)/18),posX+((1.5*width)/18),posY-((2.5*height)/18),posX+((2.5*width)/18),posY-((1.5*height)/18));
  //ulls
  fill(255); 
  ellipse(posX-((0.25*width)/18),posY+((0.5*height)/18), width/64, width/64);
  ellipse(posX+((0.25*width)/18),posY+((0.5*height)/18), width/64, width/64);
 //Limits posició X
 if((posX-(2.5*width/18)<0)||(posX+(2.5*width/18)>width)){
 velX= -velX;
 }
 //Limitis posició Y
 if((posY-(3*width/18)<0)||(posY+(3*width/18)>height)){
 velY= -velY;
 }
}

void mousePressed(){
  posX=width/2;
  posY=height/2;
  }


