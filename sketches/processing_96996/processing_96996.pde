
int mida = 70;
float boca = 9;
float ulls =20;
float pX = 300;
float pY = 300;
float vY=6;
float vX=7;
float fi = 45;
float fi2 = 35;
void setup(){
  //posicio
  
  size(600,600);
  rectMode(CENTER);



  
  
}
void draw(){
 background(67,165,247); 
  pX = pX + vX;
  pY = pY + vY;

  //paredesX
  if (pX + 80 > 1200) {
  
    vX = -vX;
    pX = 1200 -80;
  }
   if (pX-80 <0) {
    vX = -vX;
    pX = 80;
  }


  
  //parde-rebote(y)
  if (pY-80 <0) {
     vY = -vY;
    pY = 80;
  }
   
   if (pY + 80 > 1200) {
    vY = -vY;
    pY = 1200 -80;
  }

//caudrantes:
if((pX<width)||(pY>width)){
stroke(5,5,5);
}
else{
stroke(222,19,237);
}



//strokeWeight(2);
  
  

  //pinchos


  line(pX/2,pY/2,pX/2,pY/2-fi);
    line(pX/2,pY/2,pX/2,pY/2+fi);
    line(pX/2,pY/2,pX/2+fi,pY/2);
     line(pX/2,pY/2,pX/2-fi,pY/2);
     line(pX/2,pY/2,pX/2-fi2,pY/2+fi2);
     line(pX/2,pY/2,pX/2+fi2,pY/2+fi2);
     line(pX/2,pY/2,pX/2-fi2,pY/2-fi2);
     line(pX/2,pY/2,pX/2+fi2,pY/2-fi2);

  //cos
  fill(227,138,44);
  ellipse(pX/2,pY/2,mida,mida);
  strokeWeight(1);
  //boca
  fill(0);
  ellipse(pX/2-8,(pY/2),boca,boca);
  fill(255);
  ellipse(pX/2-8,(pY/2),5,5);
 //ulls
  fill(255);
  ellipse(pX/2-8,pY/2-17,ulls,ulls);
  fill(0);
  ellipse(pX/2-8,pY/2-17,5,5);
  fill(255);
  ellipse(pX/2+8,pY/2-17,ulls,ulls);
  fill(0);
  ellipse(pX/2+8,pY/2-17,5,5);
  //aletes
  strokeWeight(2);
  line(pX/2+26,(pY/2)+15,pX/2+32,pY/2+10);
  line(pX/2+32,pY/2+10,pX/2+26,pY/2+3);
  line(pX/2-26,pY/2+15,pX/2-32,pY/2+10);
  line(pX/2-32,pY/2+10,pX/2-26,pY/2+3);

  } 
  //mouse
  void mousePressed(){
  
    fi=random(90-200);
  stroke(166,255,3);
    fi2=random(90-200);
    ulls=random(30-60);
   
    //fill()
    //stroKeweight(random(
  }
    



