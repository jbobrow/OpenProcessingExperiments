

Laser[] lasers = new Laser[100];
 
int totallasers = 0;

 
void setup(){
  size (1200,1200);
  smooth();
}
 
void draw(){

  fill (0,30);
  rectMode(CENTER);
  rect(width/2,height/2,width,height);
  
   
   
  lasers[totallasers] = new Laser();
   
  totallasers++;
   
  if (totallasers >= lasers.length) {
    totallasers = 0;
  }
   
  for (int i = 0; i < totallasers; i++ ) {
    lasers[i].llover();
    lasers[i].mostrar();
    lasers[i].rebotar();
  }
   
}
class Laser {
   
  float x,y;
  float velocidadY;
  float velocidadX;
  color c;
  float r;
   
  Laser() {
    r = 4;
    x = random(800);
    y = -r*4;
    velocidadY = random(10,50);
    velocidadX = random(10,50);
    c = color(0,random(200),0);
  }
  void llover() {
    y += velocidadY;
    x+=velocidadX/4;
  }
   
  void rebotar(){
    if (y>=height){
      velocidadY=velocidadY*-1;
    }
    if (x>=width || x <0){
      velocidadX = velocidadY*-1;
  }
  }
  void mostrar() {

    
    fill(c,50);
    noStroke();
     
    for (int i = 2; i < r; i++) {
      
      
  
     strokeWeight(1);  
      stroke(random(100,139),0,255);
      line(x,y,width,height/2);
      
    
      line(x,y,0,height/2);
      
     
     
     
    stroke(255);
      noFill();
      rect(width/2,height/2,width,5);
      rect(width/2,height/2,width,50);
      rect(width/2,height/2,width,100);
       rect(width/2,height/2,width,200);
       rect(width/2,height/2,width,500);
       
 
 
     strokeWeight(10);
     stroke(random(100,139),0,255);
      ellipse(x,y,5,5);
        
    }
  }
   
}
                
                
