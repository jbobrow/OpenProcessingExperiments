
int margen = 1;  
int esp = 30;
 
void setup(){ 
  size(450,300,P3D);  
    smooth(); 
      background(255);  
      colorMode (HSB);
} 
 
void draw(){ 
  for (int y = margen; y < height; y += esp){ 
    for (int x = margen; x < width; x += esp){ 
      formitas(x, y); 
     
  } 
} 
 
  for (int y = margen; y < height; y += esp){ 
    for (int x = margen; x < width; x += esp){ 
    formitas(x, y); 
    } 
  } 
} 
 void formitas(int x, int y){ 
  float d = dist(0 , 0 , x, y);  
  pushMatrix();  
  translate(x  ,y );
   rotateZ (TWO_PI * 0.001); 
   
   float h = noise(width);  
  float z = noise(height - 23);  
  float o = random (10,34);  

  stroke(121,183,17,30);  
  strokeWeight(5);  
  fill(random(10,196),random(145,273),random(1,250), random (5,150));   
 rect (h,z,o,o);  
 
  popMatrix(); 
} 
 


