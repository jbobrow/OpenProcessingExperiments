

int x= 300;
int speed = 5;
float r=0;
float b=0;
float g=0;

void setup() {
  size(600, 600);
}

void draw() {
  background(0);
    ellipse(x, 100, 100, 100);
  if (x > width){ 
    fill(r,b,g);
    ellipse(x, 100, 100, 100);
    speed = speed* -1;
    r= random(0,255);
    b=random(0,255);
    g=random(0,255);
    
  }
  else if(x < 0){

   ellipse(x, 100, 100, 100); 
    speed = speed* -1;
    fill(r,g,b);
     r= random(0,255);
    b=random(0,255);
    g=random(0,255);
  }
   
   
   if(keyPressed){
   rectMode(CENTER);  
   rect(x,100,100,100);}
   
    x = x + speed;
  

   

    
    
}



