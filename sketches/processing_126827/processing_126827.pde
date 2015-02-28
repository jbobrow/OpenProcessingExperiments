

PImage img; 

PImage img2; 

int flag = 0; 
  

void setup() { 

  size(450, 450); 

  background(0); 

  tint(0); 


  img = loadImage("oa27.png"); 
  img2 = loadImage("2.png"); 

  image(img, 450, 450); 
} 

void draw() { 


  background(0); 

  image(img, 0, 0); 
} 


  

void mousePressed() { 

tint(255, 255, 255); 
} 


  void mouseReleased() { 


  tint(255,0,0); 
} 


void mouseDragged() { 
for (int x = 0; x <= width; x +=450) { 
for (int y = 0; y <= width; y +=450) { 


      image(img2, x, y); 


    } 


  } 


  image(img, 5, 5); 


  noStroke();     

for(int x = 0; x < width; x++){
  float color1 = random(100); 
  stroke(color1, 120, 99);
  line(x, 0, x, height);
}
} 



