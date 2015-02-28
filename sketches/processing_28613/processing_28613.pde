
int a = 0;      
float b = 0.0;  

void setup()
{
  size(300, 300);
  stroke(0);
  frameRate(20);
}

void draw()
{
  background(255);
  for(int y = 0; y <= height; y = y + 50){
    for(int x = 0; x <= width; x = x + 50){
  a = a + 1;
  b = b + 10; 
  line(a, 0, a, height);
  
  a = a + 2;
  b = b + 10; 
  line(a, 0, a, height);

  if(a > width) {
    a = 0;
  }
  if(b > width) {
    b = 0;
  }
    }
  }

 // Schluss Standard 

if (mousePressed) {
 
  
  frameRate(20);

 {
  for(int y = 0; y <= height; y = y +2){
    for(int x = 0; x <= width; x = x +2){
  a = a + 1;
  b = b + 0.2; 
  line(a, 0, a, height);
  line(b, height, b, height);
  a = a + 2;
  b = b + 10; 
  line(a, 0, a, height);
  line(b, height, b, height);
  if(a > width) {
    a = 0;
  }
  if(b > width) {
    b = 0;
  }     
    

  }
    }
  }
}
}
       
                
