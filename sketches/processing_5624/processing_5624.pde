
int x, y, deg;  
int mode = 10; 
int nbr =10; 
Dot[] d = new Dot[nbr]; 
float maxRadius  = 2000;  
float angle=5; 
void setup(){ 
    background(206,0,62); 
  size(400, 440); 
  smooth(); 
  x = width/4 ; 
  y = height/4; 
 float deg = (180/nbr); 
  for (int i=0; i<d.length; i++){ 
     angle += radians(deg); 
   maxRadius += random(100); 
    d[i] = new Dot(x + cos(angle)*maxRadius  , y+ sin(angle)*maxRadius , random(-20, 20), i); 
  }  
}  
void mouseReleased(){ 
  background(233, 233, 220); 
  float deg = (360/nbr); 
  for (int i=0; i<d.length; i++){ 
     angle += radians(deg); 
     maxRadius =200+random(20); 
    d[i] = new Dot(x + cos(angle)*maxRadius  , y+ sin(angle)*maxRadius, random(-20, 20), i); 
  } 
} 
void draw(){ 
  beginShape(); 
   for (int i=0; i<d.length; i++){ 
     d[i].maison(); 
     stroke(200); 
     noFill(); 
   vertex(d[i].x , d[i].y); 
   } 
   endShape(CLOSE); 
} 
class Dot{ 
  float x, y; 
  float vx, vy; 
  float ar = random(2, 20); 
  int id; 
  Dot(float xpos, float ypos, float angledeRotation, int moi){ 
    x  = xpos; 
    y  = ypos; 
    ar  = angledeRotation; 
    id = moi ; 
  } 
  void maison(){ 
     ar+=random(0.2); 
     x += cos(ar)*(random(1))+((width/2 - x) * 0.025);  
     y += sin(ar)*(random(1))+((height/2 - y) * 0.025);  
  } 
} 
 

