
float a,b,c,d,e;

void setup(){
  size(1000,1000);
  smooth();
  
  }

void draw(){
  
  PImage star = loadImage ("star.jpg");
  PImage rings = loadImage ("rings.jpg");
  PImage blake = loadImage ("blake.jpg");
  
 
    fill(255,255,255,pmouseX);
    stroke(pmouseY);
    triangle(0,0,mouseX,mouseY,1000,0); //top triangle 
    fill(255,255,255,pmouseY);
    stroke(pmouseX);
    triangle(0,0,mouseX,mouseY,0,1000); // left trianlge
    fill(255,255,255,pmouseY);
    stroke(pmouseX);
    triangle(1000,0,mouseX,mouseY,1000,1000); // right trianlge
    fill(255,255,255,pmouseX);
    stroke(pmouseY);
    triangle(1000,1000,mouseX,mouseY,0,1000); // bottom triangle
      
      
        
  tint(255,random(100));
  image(blake,0,0);
  
  b= 30;
  a= 10;
  if(mouseX > 500){
    tint(255, a+= 10);
    image(rings, 0 ,0);
  } else {
    tint(255, b+= 20);
    image(star, 0, 0);
  }
    
 }


