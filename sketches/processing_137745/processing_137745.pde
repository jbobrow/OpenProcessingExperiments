
float n = 0;
float x = 0;
 
void setup(){
  size(500,300);
  background(0); 

  }
void draw(){
fill(#336699);
rect(0,0,width, height);
point(x, height/2 + sin(n) * 40); 
fill(0,180,0);
ellipse(x, height/2 + sin(n) * 40,30,30);
for (int i = 0; i< width; i++){
} 

  

  n = n + 0.029;
  x = x + 1;
}
