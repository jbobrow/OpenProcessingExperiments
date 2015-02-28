
PImage img;

void setup(){
  size(600,600);
  smooth();
 img = loadImage("Unknown.jpeg");
}

void draw(){
  image(img,width,height);
 
  fill(20,10);
  ellipse(0,0,width,height);
   ellipse(80,85,width,height);
  image (img,mouseX,mouseY);
  
for (int i = 0; i < 80; i = i+5) {
  line(0, i, 600, 200);
  
  line(0, i, 600, 100);
  
  line(0, i, 600, 300);
  
  line(0, i, 600, 400);
  
  line(0, i, 600, 500);
  
}
    
for (int z = 0; z <height/2; z = z+10) {
  ellipseMode (CENTER);
  ellipse (z,45,100,100);
  fill(30,40,5,6);
}
    
  }
  
  

  








