
int n=1;

void setup() {
 size(1000,800);
 background(0);
 fill(0,255,255);  
}

void draw() {
 background(0);
 translate(500,400); 
 ellipse(0,0,70,70); 
 rotate(radians(n));
 translate(400,0); 
  fill(255,255,0); 
 ellipse(0,0,50,50);
 n++;
 rotate(radians(n));
 translate(300,0); 
  fill(255,255,0); 
 ellipse(0,0,30,30);
 rotate(radians(n));
 translate(100,0);
 fill(255,0 ,0); 
 ellipse(0,0,10,10);
}
