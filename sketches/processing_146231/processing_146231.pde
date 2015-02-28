
//GREEN LANTERN
//fet per Santi Farrés
//Programa que mou de manera "random" deu perssonatges i els fa desapareixes al premer el mouse
 int numgreen = 10;  //numero de perssonatges
 
//definim varibles
 float[] posX = new float[numgreen];
 float[] posY = new float[numgreen];
 color[] colormasc = new color[numgreen];
 
void setup(){
  size(700,700);
  noStroke();
  for(int i=0; i<numgreen; i++){                    //dintre del "for" es defineix la posició inicial dels elements
  posX[i] = (posX[i]+width/2)+(int)random(-50,50);  //surten a +-50 del centre 
  posY[i] = (posY[i]+height/2)+(int)random(-50,50);
  }
}
  
void draw(){
  noCursor();
  background(255);
//marc de fons
  fill(136,190,91,127);
  ellipse(width/2,height/2,(2*width)/3,(2*height)/3);
  fill(28,100,1,127);
  ellipse(width/2,height/2,(2*width)/3.25,(2*height)/3.25);
  for(int i=0; i<numgreen; i++){  //Redeterminem les posicions inicials:
  posX[i] += random(-20,20);     //es mou de +-20 unitats
  posY[i] += random(-20,20);
    
  //cal definir marges 
  if (posX[i]<(2.5*width/36)){
      posX[i] = (2.5*width/36);
  }
  if (posX[i]>(width-(2.5*(width/36)))){
      posX[i] =width-(2.5*width/36);
  }
  if (posY[i]<(3*height/36)){
      posY[i] = (3*height/36);
  }
  if (posY[i]>height-(3*height/36)){
      posY[i] = height-(3*height/36);
  }

  //s'ha dividit el size en una cuadricula de 36x36 on s'ha dibuixat el personatge
  //cabell
  fill(55,31,21);
  rect(posX[i]-((2.5*width)/36),posY[i]-((2*height)/36),(5*width)/36,(3*height)/36); 
  //face
  fill(250,214,182);
  rect(posX[i]-((2*width)/36),posY[i]-(height/36),(4*width)/36,(3.5*height)/36);  
  //barveta
  fill(221,187,159);
  rect(posX[i]-((2*width)/36),posY[i]+((1.5*height)/36),(4*width)/36,height/36);
  rect(posX[i]-(width/36),posY[i]+((2*height)/36),(2*width)/36,height/36);
  triangle(posX[i]+((2*width)/36),posY[i]+(height/36),posX[i]+((2*width)/36),posY[i]+((2*height)/36),posX[i]+(width/36),posY[i]+((2*height)/36)); 
  triangle(posX[i]-((2*width)/36),posY[i]+(height/36),posX[i]-((2*width)/36),posY[i]+((2*height)/36),posX[i]-(width/36),posY[i]+((2*height)/36));  
  //mascara
  fill(136,190,91);
  quad(posX[i]+((1.5*width)/36),posY[i]-((0.5*height)/36),posX[i],posY[i],posX[i],posY[i]+(height/36),posX[i]+((1.5*width)/36),posY[i]+((0.5*height)/36));
  quad(posX[i]-((1.5*width)/36),posY[i]-((0.5*height)/36),posX[i],posY[i],posX[i],posY[i]+(height/36),posX[i]-((1.5*width)/36),posY[i]+((0.5*height)/36));
  //tupé
  fill(55,31,21);
  triangle(posX[i]-((2*width)/36),posY[i]-((2*height)/36),posX[i]+((2*width)/36),posY[i]-((2*height)/36),posX[i]-(width/36),posY[i]-((3*height)/36));
  quad(posX[i]-(width/36),posY[i]-((3*height)/36),posX[i]+((2*width)/36),posY[i]-((3*height)/36),posX[i]+((1.5*width)/36),posY[i]-((2.5*height)/36),posX[i]+((2.5*width)/36),posY[i]-((1.5*height)/36));
  //ulls
  fill(255); 
  ellipse(posX[i]-((0.25*width)/36),posY[i]+((0.5*height)/36), width/128, width/128);
  ellipse(posX[i]+((0.25*width)/36),posY[i]+((0.5*height)/36), width/128, width/128);
 }
}

void mousePressed(){  //si cliquem el mouse eliminarem de un en un els perssonatges fins a trobar l'original
  if(numgreen>0){
    numgreen = numgreen-1;
  }
  if(numgreen<=0){ 
    numgreen = 10;
  }
}



