
void setup() { 

  size(500,500,P3D);
  PImage a;
  a = loadImage ("pasion.jpg");
  image (a,0,0);
} 

void draw() { 

  for(float i = 10; i <500; i+=5) { 
    for(float e = 50; e < 500; e += 1000) { 
      translate(70+ i,mouseY,mouseX);  
      rotateX(millis()/500);  
      rotateY(millis());  
      fill(random(400),random(10),0); 
      box(e/i + 10);
    }
  }
} 


