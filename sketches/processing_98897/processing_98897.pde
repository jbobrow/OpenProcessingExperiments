
int x=10 ;
int y=10;
float r = 20;
int Boles = 10;
 
float[] posX = new float[Boles];
 
float[] posY = new float[Boles];
 
float[] velX = new float[Boles];
 
float[] velY = new float[Boles];
 
 
void setup(){
 size(600,600);
 
 for(int i = 0; i<Boles; i++){
    posX[i] = int(random(width));
    posY[i] = int(random(height));
    velX[i] = random(5,7);
    velY[i] = random(5,7);   
  }
}

void draw(){
  size(600,600);
 dibuixa_fons();
   for (int i=0; i<Boles;i++){
  actualitza_posicio (i);
      posiciona_element(posX[i], posY[i]);
      
  }
}


void dibuixa_fons (){
stroke(188,44,191);
 background(0);
colorMode(RGB,255);
  fill(255,25);
strokeWeight(5);
  
      for(x=0; x<650; x=x+20)
{
    for(y=0;y<650;y=y+20)
    {point(x,y);}
     
    
      
    
    }
}
    void posiciona_element(float posX, float posY){
       strokeWeight(1);
  
    fill(random(255),random(255),random(255));
    ellipse(posX,posY,r,r); 
    }
    
    
    void actualitza_posicio( int i){
     
    posX[i] += velX[i];
    posY[i] += velY[i];
 
    
    if((posX[i]<0)||(posX[i]>width)){
      velX[i] = -velX[i];
        background(random(255),random(255),random(255));//canvia de color amb tocar amb les parets
         
    }
   
    if((posY[i]<0)||(posY[i]>height)){
      velY[i] = -velY[i];
       background(random(255),random(255),random(255));//canvia de color amb tocar amb les parets
         
        }
      }
    void mousePressed(){
   
  for(int i = 0; i<Boles; i++){
    posX[i] = random(width);
    posY[i] = random(height);
    velX[i]=-velX[i];
    velY[i]=-velY[i];
 
 
  }
}


