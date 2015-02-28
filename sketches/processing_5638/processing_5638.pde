
int x = 0; 
int y = 0; 
  
float rood;  // kleur van het vierkantje
float groen; 
float blauw; 
  
int speed = 5; 
 
int state = 0; 
 
void setup(){ 
  size(400,400); 
} 
 
void draw() { 
  background (255,0,0); 
 
  noStroke(); 
  //fill(0,0,255); 

  rood  = random(0,255); 
  groen = random(0,255); 
  blauw = random(0,255); 
  
   
  x = x + speed; 
  
  // teken het vierkantje 
  fill(rood,groen,blauw,100); 
  rect(x,y,50,50); 
  
  if(state == 0 ) 
  { x = x + speed; 
    if (x > width-50) 
    { x = width-50; 
      state = 1; 
    } 
  } 
  else if (state == 1) 
  { y = y + speed - 2; 
    x = x - speed - 3; 
    if (x < 0) 
    { y = 200; 
      x = 0; 
      state = 2; 
    }  
  } 
  else if (state == 2) 
  { x = x + speed; 
    if (x > width-50) 
    { y = 200; 
      x = 350; 
      state = 3; 
    } 
  } 
  else if (state == 3) 
  { y = y + speed - 2; 
    x = x - speed + 1; 
    
    if (x < 0) 
    { 
      y = 350; 
      x = 0; 
      state = 4; 
    } 
  } 
  else if (state == 4) 
  { x = x + speed; 
    if (x > width-50) 
    { y = 350; 
      x = 350; 
      state = 5; 
    } 
  } 
  else if (state == 5) 
  { 
    x = 0; 
    y = 0; 
    state = 0; 
  } 
} 
 


