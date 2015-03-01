
float pX=400;
float pY=300;
 
float vX=4;
float vY=4;
float angV;
float vecV;

float col1=random(0,255);
float col2=random(0,255);
float col3=random(0,255);

float radiint=25;
float radi=250;

float angle;
float limX;
float limY;
float x;
float y;
 
void setup() {
  size(800,600);

}
     
void draw() {
    
 background(0);
 fill(255);
 strokeWeight(0);
 ellipse (400,300, radiint*2+radi*2, radiint*2+radi*2);
  
  
  //pilota

  fill(col1, col2, col3);
  stroke(0,0,0);
  strokeWeight(2);
  ellipse (pX,pY, radiint*2,radiint*2);
    
  //avanÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â§ar
   pX=pX+vX;
   pY=pY+vY;
  
  //condiciÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â³ rebot
  
  //0 al centre
  y=(height/2)-pY;
  x=pX-(width/2);  
 
 //calcul angle
 angle = atan2 (y,x);
 
 //calcul limits exteriors
   limX= cos(angle)*radi;
  limX=abs(limX);
  limY= sin(angle)*radi;
  limY=abs(limY);

  //control interior
  if(pX>((width/2)-limX)&&pX<((width/2)+limX)&&pY>=((height/2)-limY)&&pY<=((height/2)+limY)) {}
    else{
       
      /*  
      INTENT DE FER UN REBOT CREÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã�Â¯Ã�ï¿½Ã�Â¿Ã�ï¿½Ã�Â½BLE
      angV=atan2(vY,vX);
        vecV= sqrt(vX*^vX+vY*vY);
        vX=vX*cos(angV);
         
        
    }
         if()) {}
        else{
     vY=vY*sin(angV);
      }
 
      */
    
     vX=-vX;
     vY=-vY;
    
        
 
}

//FALTA CONTROLAR EL BUG FORA DEL CERCLE


}


  void mouseReleased() {
     
    //calcul velocitat     
   vX=mouseX-pmouseX;
   vX=vX/5;
   vY=mouseY-pmouseY;
   vY=vY/5;
      
   //posiciÃ�ï¿½Ã¯Â¿Â½Ã�Â¯Ã�Â¿Ã�Â½Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â³
   pX=pmouseX;
   pY=pmouseY;
      
   //color
  col1=random(0,255);
  col2=random(0,255);
  col3=random(0,255);
 
   
  }

