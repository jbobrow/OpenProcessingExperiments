
int totalElements = 200;

float [] pX = new float [totalElements];
float [] pY = new float [totalElements];
float [] vX = new float [totalElements];
float [] vY = new float [totalElements];



void setup() {
   size(800, 800);
    stroke(255, 20,35);
  for (int i=0; i <totalElements; i++){
  pX [i] = random (width);
  pY [i] = random (height);
  vX [i] = random (-8,8);
  vY [i] = random (-8,8);
  }





}

void draw() {
  
  //linies del centre
background(18,3,160);
for (int i=0; i<=800; i = i +15) {

  line (800,400, i,height/2);
  line(width/2,height/2,0,i);
  line(width/2,height/2,i,0);
  line(width/2,height/2,width,i);
  line(width/2,height/2,i,height);

      }
      for (int i=0; i <totalElements; i++){
    
      pX [i] = pX [i] + vX[i];
      pY [i] = pY [i] + vY[i];
      
      if (pX [i] < 0 ||pX [i] > width)  {
         vX [i] = -vX [i];
      }    
      
      
        if (pY [i] < 0 ||pY [i] > height)  {
          vY [i] = -vY [i]; 
         
      }    
      rect(pX[i],pY[i],25,15);
      rect(pX[i],pY[i],2,35);
}
}
     void mousePressed() {
  
  fill(247,240,20);
  if (cambiarColor==true);
  }  
  
  boolean cambiarColor= true;{
   
          
  }




