
void setup (){
  size (400,400);
}

PImage a;
float y = 25;
float z = 60;
float w = 5;

void draw (){ 

 
    a = loadImage ("ORGANILLERO.jpg"); 
    image (a,0,0,400,400);

    y = y + 5;
    if (y > 80){
      y = -10;
    }  
    
    z = z + 5;
    if (z > 80){
      z = -10;
    }  
    
     w = w + 5;
    if (w > 80){
      w = -10;
    }    
    
    fill (255);
    noStroke ();
    ellipse (300,y,6,6);
    ellipse (290,z,6,6);
    ellipse (280,w,6,6);
  }








