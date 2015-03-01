
 //METEORITOS
 class Meteorit {
    float xPos;
    float yPos;
    
    Meteorit(float x, float y){
      xPos = x;
      yPos = y;
    }
    void dibuixa(){
      fill(255,0,0);
      ellipse(xPos, yPos, 20,20);
    }    
    float moureX(){
      xPos = xPos +random(-5,5);     
      if (xPos <0) xPos = 0;    
      if (xPos >width) xPos = width;
      return xPos; 
    }
    float moureY() { 
      yPos = yPos + random(1,4);
      if (yPos <0) yPos = 0;  
      if (yPos >height) yPos = 0; 
      return yPos;
    }
}
 //PROTAGONISTA
 class Protagonista{
  float xPos;
  float yPos;
  float radi;
  color c;
  
  Protagonista(){
  xPos = width/2;
  yPos = height/2;
  radi = 20;
  c = color(0,0,255);
  }
  
  Protagonista(float x, float y, float r, color col){ 
    xPos = x;
    yPos = y;
    radi = r;
    c = col;
  }
  void dibuixa(){
    fill(c); 
    ellipse(xPos, yPos, radi, radi);
  }
  float mourex(){
    xPos =  xPos + (mouseX-xPos)/radi;
    return xPos;
  }
  float mourey(){
    yPos =  yPos + (mouseY-yPos)/radi;
    return yPos;
  }
}
float[] Meteoritx = new float [20]; 
float[] Meteority = new float [20];
Meteorit[] m = new Meteorit[20]; 
Protagonista[] p = new Protagonista[1];
float Protagonistax = width/2;
float Protagonistay = height/2;

boolean acaba=false;
void setup(){
  
  size (500, 500);  
  //POSICION PROTAGONISTA
  p[0] = new Protagonista(width/2, height, 10 , color(0,255,0));  
  
  for (int i = 0; i < m.length;i++){
    m[i] = new Meteorit(random(width), 0);
  }   
} 
void draw(){
   background(0); 
 if(acaba==false){ 
   for (int i = 0;i < p.length;i++){ 
      p[i].dibuixa();
      p[i].mourex();
      p[i].mourey();
      Protagonistax = p[i].mourex();
      Protagonistay = p[i].mourey();
      
  }
  for (int i = 0; i < m.length;i++){
    m[i].dibuixa();
    m[i].moureX();
    m[i].moureY();
    Meteoritx[i] =  m[i].moureX();
    Meteority[i] =  m[i].moureY();
    
    //VER SI SE TOCAN
    if(dist(Meteoritx[i], Meteority[i], Protagonistax, Protagonistay ) <10) {
        //p[0].c = color(random(255),random(255),random(255));
        acaba=true;
        
        
           
    }
  }
 }
      //PANTALLA DE GAME OVER
      if(acaba==true){

        fill(255,0,0);
        textSize(40);
        text("Game Over", width/2 -100, height/2); 
        
        fill(255,255,255,0);
        strokeWeight(2);
        stroke(255,0,0);
        rect(width/2-50, 300, 100, 30, 7);
        fill(255,0,0);
        textSize(15);
        text("Reintentar", width/2 -37, 320); 
        noStroke();
        
        if(mousePressed && (mouseButton == LEFT)&& mouseX>width/2-50 && mouseX<width/2-50+100 && mouseY>300 && mouseY<330){
        acaba=false; 
        
 }
        
        
      }
  
    
  }
  



