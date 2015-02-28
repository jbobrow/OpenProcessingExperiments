
int figures= 20;
//posicions
float[]posX= new float [figures];
float[]posY= new float [figures];
 
//velocitats
float[] velX= new float [figures];
float[] velY= new float [figures];
float[] vX= new float [figures];
float[] vY=new float [figures];
 
float mides= 20;
float dosmides= 20;
float e1=25;
boolean cosa=true;
 
//dibuix de fons
float[]coses= new float [200];
 
void setup() {
  size(600, 600);
  for(int i=0; i<figures; i++) {
   
  posX[i]= random(width);
  posY[i]= random(height);
  velX[i]=random(-29,29);
  velY[i]=random(-29,29);
  vX[i]= random(-25,25);
  vY[i]=random(-25,25);
  mides=20;
  dosmides=20;
  e1=25;
  cosa=true;
    }
}
void draw() {
  
dibuixa_fons();
for (int i=0; i<figures; i++) {
posiciona_element(posX[i], posY[i]);
actualitza_posicio(i);
}
posiciona_element(mouseX,mouseY);

}

void dibuixa_fons(){

 background((width/2)+230, (height/2)+100, 150);
 background(0);
// Dibuix de fons
 colorMode (RGB,400);
 strokeWeight(2); 
 
 for (int i=0; i<700; i= i+9) {
     
    stroke(185,179,203);
    //stroke((width/2)+230, (height/2)+100, 150);
    line(500,500, 0,i);
     
    stroke(88,58,173);
    line(500,500,i,700);
     
    stroke(85, 61, 152);
    line(500,500, i,0);
     
    stroke(82, 75, 98);
    line(500,500,694,i);
     
  }
 
}

void posiciona_element(float posX,float posY){
  
  //diametres 
  e1=25;
  mides= 20;
  dosmides=20;
  rectMode(CENTER);
    
         
   //Verticals
     
  fill(posX+100, posY-50, -35);
  stroke(posX-100, posY+50, 35);
   
  line(posX, posY, posX, posY+50);
  ellipse(posX, posY+50, mides, mides);
 
  line(posX, posY, posX, posY-50);
  ellipse(posX, posY-50, dosmides, dosmides);
  
  
   //Colors variant
  fill(posX+50, posY-100, 35);
  stroke(posX-100, posY+50, 35);
 
////////////////////////////////////////////////////////////////////////
  //Dibuix  
 
  strokeWeight(3);
  line(posX, posY, posX+35, posY-30);
  line(posX, posY, posX-35, posY-30);
  line(posX, posY, posX-35, posY+30);
  line(posX, posY, posX+35, posY+30);
 
  //Colors variant
//elipses diagonals
  fill(posX+50, posY-100, 35);
  stroke(posX-100, posY+50, 35);
  strokeWeight(8);
 
  ellipse(posX+35, posY-30, e1, e1);
  ellipse(posX-35, posY-30, e1, e1);
  ellipse(posX-35, posY+30, e1, e1);
  ellipse(posX+35, posY+30, e1, e1);
   
  //Colors variant
  fill(random(50), posY-100, 35);
  stroke(posX-100, posY+50, 35);
  strokeWeight(8);
  //frameRate(50);
  
 if(cosa==true) {
  rect(posX, posY, random(-30,+40), (40));
  }
  else {
   
  fill(posX+50, posY-100, 35);
 ellipse(posX, posY, random(30,60), (60));
  }
}
  

void actualitza_posicio(int figura){

//comprovacio posicio
    // posicions
    posX[figura]= posX[figura]+velX[figura];
    posY[figura]=posY[figura]+velY[figura];
 
  
//LIMITS HORITZONTALS
  if((posX[figura]+35)+ (e1/2)>=width){
      velX[figura]=-velX[figura];
      posX[figura]=width-(35+(e1/2));     
}
 
  if((posX[figura]-35)-e1/2<=0){
      velX[figura]=-velX[figura];
      posX[figura]=+35+e1/2;     
}
  
//LIMITS VERTICALS
 
  if(((posY[figura]-50)-(mides/2))<=0){
      velY[figura]=-velY[figura];
      posY[figura]=50+(mides/2);     
}
 
  if(((posY[figura]+50)+(dosmides/2))>=height){
      velY[figura]=-velY[figura];
      posY[figura]=height-(50+(dosmides/2));     
}

}

    

  
 ////////////////////////////////////////////////////////////////////////

 
void mousePressed(){
 cosa = !cosa;
  for(int i=0; i<figures; i++) {
    posX[i]= mouseX+10;
    posY[i]=mouseY+10;
 velX= vX;
 velY=vY;
 
 
}
}
   



