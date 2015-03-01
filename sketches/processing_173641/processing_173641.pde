
void setup() {
  size(600,600);
  

  
}

void draw() {
   background(#48FF7D);
  
   
     fill (#5516DE);  
   ellipse (100,100,150,50);

    fill (#5516DE);  
   ellipse (500,500,150,50);
   
    fill (#5516DE);  
   ellipse (300,300,150,50);
   
     fill (#5516DE);  
   ellipse (500,100,150,50);
   
       fill (#5516DE);  
   ellipse (100,500,150,50);
   
  noStroke();
  for (int i = 0; i < height; i += 50) {
    fill(#FF4848);
    rect(0, i, width, 40);
    fill(255);
    rect(i, 0, 30, height);
  }
  
   fill (#5516DE);  
   ellipse (300,300,150,150);
   
    fill (#FF4848);  
   ellipse (300,300,100,100);
   
    fill (#48FF7D);  
   ellipse (300,300,50,50);
   
    fill (255);  
   ellipse (300,300,10,10);
}
