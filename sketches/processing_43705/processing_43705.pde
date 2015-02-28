
PImage b;
 
void setup (){ 
size (300,300);
b= loadImage ("andy.jpg");   
}
  
void draw (){ 
 image (b, 0, 0);
 tint(mouseX, 50,50); 
 filter(INVERT);  
}


