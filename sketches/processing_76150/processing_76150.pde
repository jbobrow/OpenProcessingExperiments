
PImage img;
int x = 0;

void setup(){
  
 size(600, 600);
 img = loadImage("lena.jpg"); 
  
  
}

void draw(){
  
  background(255);  
  image(img, -400+x, -400+x);
  
  if(x<=1000)
    x++;
  
}

