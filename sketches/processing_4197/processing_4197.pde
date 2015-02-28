
// Borealis - Maxime Gaillard 
// playing with bezier curves 
 
int a,b,c,d; 
int pas = 3; 
int[] speedY=new int[4]; 
int[] speedX=new int[4]; 
int[] posX=new int[4]; 
int[] posY=new int[4]; 
 
void setup(){ 
  size(768,420,P2D); // slower but more clean than JAVA2D 
  colorMode(HSB,256); 
  smooth(); 
  frameRate(30); 
  reinit(); 
} 
 
void draw(){ 
  //----------------------------- do the "fade" thing 
    fill(0,0,0,1); //-- use (0,0,0,7) with JAVA2D  
    noStroke(); 
    rect(0,0,width,height); 
    noFill(); 
  // -------------------------- calculate the 4 bouncing spots 
  for (int i=0;i<4;i++){   
    posX[i]+=speedX[i]; 
    if((posX[i]<0)||(posX[i]>width)){ 
      speedX[i]*=-1; 
    } 
    posY[i]+=speedY[i]; 
    if((posY[i]<0)||(posY[i]>height)){ 
      speedY[i]*=-1; 
    }   
  } 
  //------------------------------join the spots by bezier curves 
  strokeWeight(pas); 
  stroke(map(posX[a],0,width,0,256),map(posY[b],0,height,64,256),map(posY[c],0,height,200,256),map(posX[d],10,width,0,120)); 
  bezier(posX[0],posY[0],posX[3],posY[3],posX[2],posY[2],posX[1],posY[1]);
  bezier(posX[0],posY[0],posX[1],posY[1],posX[3],posY[3],posX[2],posY[2]);  
  bezier(posX[0],posY[0],posX[2],posY[2],posX[1],posY[1],posX[3],posY[3]);  
  bezier(posX[1],posY[1],posX[3],posY[3],posX[0],posY[0],posX[2],posY[2]);  
  bezier(posX[1],posY[1],posX[2],posY[2],posX[0],posY[0],posX[3],posY[3]);  
  bezier(posX[2],posY[2],posX[1],posY[1],posX[0],posY[0],posX[3],posY[3]);  
} 
//--------------------------------------- sets all bright new 
void reinit(){ 
  for (int i=0;i<4;i++){ 
    posX[i]=  (int) random(width);   
    posY[i]=  (int) random(height); 
    speedY[i]=(int)random(-pas,pas); 
    speedX[i]=(int)random(-pas,pas); 
    if (speedX[i]==0) speedX[i]=pas; 
    if (speedY[i]==0) speedY[i]=pas;  
  } 
    a=(int)random(4); 
    b=(int)random(4); 
    c=(int)random(4); 
    d=(int)random(4); 
  posX[d]=10; 
  background(0,0,0); // ----- use (0,0,30) with JAVA2D 
} 
 
//---------------------- not much interactivity ! 
void keyPressed() { 
    reinit(); 
} 


