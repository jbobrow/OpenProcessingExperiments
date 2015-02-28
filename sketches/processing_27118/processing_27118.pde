


 
 
float ballX, ballY; 
float difX, difY; 
float friction = 0.01; 
boolean capt = false; 
float bounce = 1;
  boolean bUp = true;
  boolean ran = false;
  float ranX = 0;
  float ranY = 0;
  ArrayList<Float> xC;
  ArrayList<Float> yC;
  ArrayList<Boolean> xSel;
  ArrayList<Boolean> ySel;
  int seg = 20;
 
void setup(){
  size(500, 500);
  int i = 0;
  int m = 0;
  
  xC = new ArrayList();
  yC = new ArrayList();

  while( i < seg+1){
   float segx = (width/seg) * i;
   float segy = (height/seg) * i;
   xC.add(segx);
   yC.add(segy);
  i++;
  
  }
  xSel = new ArrayList();
  ySel = new ArrayList();

  while( m < seg+1){
   boolean selx = false;
   boolean sely = false;
   xSel.add(selx);
   ySel.add(sely);
  m++;
  
  }
   


   
 // noCursor();
  smooth();
}
 
void draw(){
   
  background(255);
 int k = 0;
 int L = 0;
 int colour = 0;
 

  while ( k < seg){
    L = 0;
    
    while(L < seg){
      if (xSel.get(L) && ySel.get(k)){
        fill(255); 
        
      }else{
        fill(0);
        
      }
     rect(xC.get(L), yC.get(k), width/seg,height/seg);
     L++; 
    }
    
    k ++;
  } 

  
 

 
    
  
  
  
   

  stroke(0);
  noFill();
  
}
 

 

void mouseMoved(){
 if (!ran){
   ran = true; 
   ranX = round(random(width));
   ranY = round(random(height));
 }else{
   ran = false;
 }
 for (int i = 0; i < seg; i++){
   
   if ( mouseX >= xC.get(i) && mouseX <= xC.get(i+1)){
     if(!xSel.get(i)){ 
       xSel.set(i,true);
     }else{
       xSel.set(i,false);
     }
   }
 }
 for (int k = 0; k < seg; k++){
   
   if ( mouseY >= yC.get(k) && mouseY <= yC.get(k+1)){
     if(!ySel.get(k)){ 
       ySel.set(k,true);
     }else{
       ySel.set(k,false);
     }
           
   }
 }
 
 
}

