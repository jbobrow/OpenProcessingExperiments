
float[] Monigotex = new float [10]; 
float[] Monigotey = new float [10];
Monigote[] m = new Monigote[10]; 
Pelota[] us = new Pelota[1];
float Pelotax = width/2;
float Pelotay = height/2;
void setup(){
  size (500, 500); 
 
    us[0] = new Pelota(random(width), random(height), 10 , color(random(255)));
  
  for (int i = 0; i < m.length;i++){
    m[i] = new Monigote(random(width), random(height));
  }   
} 
void draw(){
  background(20,20,20); 
  //us[0].c = color(255);
   for (int i = 0;i < us.length;i++){ 
      us[i].dibuixa();
      us[i].mourex();
      us[i].mourey();
      Pelotax = us[i].mourex();
      Pelotay = us[i].mourey();
  }
  for (int i = 0; i < m.length;i++){
    m[i].dibuixa();
    m[i].moureX();
    m[i].moureY();
    Monigotex[i] =  m[i].moureX();
    Monigotey[i] =  m[i].moureY();
    
    if(dist(Monigotex[i], Monigotey[i], Pelotax, Pelotay ) <10) {
        us[0].c = color(255,0,0);
       print("ok");    //Aquest if le colocat per calcular la distancia del xoc entra les pilotes y la pilota del usuari
    }
  }
}  
  
public class Monigote {
  float xPos;
  float yPos;
  
  Monigote(float x, float y){
    xPos = x;
    yPos = y;
  }
  void dibuixa(){
    fill(0,0,255);
     ellipse(xPos, yPos, 20,20);
  }
  
  float moureX(){
    xPos = xPos +random(-5,5);
   
    if (xPos <0) xPos = 0;
  
    if (xPos >width) xPos = width;
   return xPos; 
  }
  float moureY() { 
    yPos = yPos +random(-5,5);
    if (yPos <0) yPos = 0;  
    if (yPos >height) yPos = height; 
    return yPos;
  }
}
public class Pelota{
  float xPos;
  float yPos;
  float radi;
  color c;
  
  Pelota(){
  xPos = width/2;
  yPos = height/2;
  radi = 20;
  c = color(255);
  }
  
  Pelota(float x, float y, float r, color col){ 
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




