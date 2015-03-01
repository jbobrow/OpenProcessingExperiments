
int gap;
void setup(){
size(450,450);
}
void draw(){
background(0); 
  
translate(width/2,height/2);
rect(-50-gap,-50-gap,50,50);
rect(0,-50-gap,50,50);
rect(50+gap,-50-gap,50,50);
rect(-50-gap,0,50,50);
rect(0,0,50,50);
rect(50+gap,0,50,50);
rect(-50-gap,50+gap,50,50);
rect(0,50+gap,50,50);
rect(50+gap,50+gap,50,50);
  
gap = mouseX/2;
}


