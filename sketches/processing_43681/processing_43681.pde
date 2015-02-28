
PImage img;

void setup (){  
size (400,400);
img= loadImage ("twiggy.jpg");    
}
 
void draw (){  
 image (img, 0,0);
 tint(mouseX, mouseY, 100);  
 filter(THRESHOLD);   
}


