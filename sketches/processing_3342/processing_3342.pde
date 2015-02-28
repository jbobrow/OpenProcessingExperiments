
int esp = 27; // espaciador 
 
void setup(){ 
  size ( 400, 400); 
  colorMode (RGB);
  frameRate (10);
  smooth ();
} 
 
void draw(){ 
  background(13,1,26); 
  for (int y = 0; y < height; y += esp){ 
    for (int x = 0; x < width; x += esp){ 
    
  
  stroke(136,188,222); 
    
      pelotitas(x,y); 
    } 
  } 
} 
 


 
void pelotitas (int _x, int _y){ 
float d = dist(0, 0, _x, _y);  
float a= noise(345);
float b= noise (45);

pushMatrix();{ 
  translate(_x,_y); 
rotate(random (56));
//stroke(162,5,162); 
fill(random(255), random (255), random (255), random (255)); 
noStroke();
ellipse(a,b,random(34,229),random(34)); 

} 
popMatrix(); 
} 

