
ArrayList bits; 
 
void setup()
{ 
  size(700, 450); 
  bits = new ArrayList(); 
  smooth(); 
} 
 
void draw()
{ 
  
  background(0);
  bits.add(new bits());  
 
  for (int i = 0; i < bits.size(); i++ ) 
  {  
    bits b = (bits) bits.get(i); 
    b.move(); 
    b.grav(); 
    b.show(); 
  } 
 
  if (bits.size() > 100) 
  { 
    bits.remove(0);  
  } 
  
} 

class bits { 
  
  float x; 
  float y; 
  
  float xv; 
  float yv; 
   
  bits() 
 { 
    x = mouseX; 
    y = mouseY; 
    xv = random(-1,1); 
    yv = random(-1,0); 
  } 
   
  void move()
  { 
    x = x + xv; 
    y = y + yv; 
  } 
   
  void grav() 
  { 
    yv += 0.01; 
  } 
   
  void show() 
  { 
    stroke(0); 
    fill(random(0,255),random(0,255),random(0,255)); 
    rect(x,y,4,4); 
  } 
  
} 



