
Segueix[] neu;

boolean m = true;

int nombre = 10000;
 
void setup() {
  
  size(800, 600);
  
  smooth();
  
  noStroke();
 
  neu = new Segueix[nombre];
 
  for (int i=0; i < nombre; i++){
    
    neu[i] = new Segueix();
    
    neu[i].pos.x = random(800);
    
    neu[i].pos.y = random(10000);
    
    neu[i].d = 2;
    
    neu[i].r = 255;
   
    neu[i].g = 255;
    
    neu[i].b = 255;
  
  }

}
 
void draw(){
  
  background(0);
  
  for (int i=0; i < neu.length; i++){
        
    neu[i].move();
    
    neu[i].show();
 
  }

}
 
class Segueix{
  
  int d;
  
  int r, g, b, al;
  
  //
  
  PVector pos;
  
  PVector v;
  
  PVector acc;
  
  float ts;
 
  Segueix(){
   
    pos = new PVector(random(width), random(height));
   
    v = new PVector(10, 10000);
   
    ts = 10;
    
  }
 
  void show(){
    
    fill(r, g, b);
    
    ellipse(pos.x, pos.y, d, d);
 
  }
 
 
 
  void update2(){
    
    PVector screen = new PVector(width/2, height/2);
    
    PVector dir = PVector.sub(screen, pos); 
   
    dir.normalize();    
    
    dir.mult(100);      
    
    acc = dir; 
    
    v.add(acc);
    
    v.limit(ts);
    
    pos.add(v);
  
  }
 
  void update(){
    
    PVector mouse = new PVector(mouseX, mouseY);
    
    PVector dir = PVector.sub(mouse, pos); 
    
    dir.normalize();    
    
    dir.mult(0.5);      
    
    acc = dir; 
    
    v.add(acc);
    
    v.limit(ts);
   
    pos.add(v);
  
  }
 
  void move(){
    
    if (m){
      
      update2();
      
    }
   
    if (mousePressed){
     
      m = false;
      
      update();
    
    }
   
    else{
      
       m = true;
    
    }
  
   } 
}

 
void mouseReleased(){
 
  for(int i=0; i < nombre; i++){
    
    neu[i].pos = new PVector(random(width), random(height));
    
  }
  
}


