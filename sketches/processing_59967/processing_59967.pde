
  PImage b;
  PImage f;


void setup (){

size(854,524);

}

void draw(){

  tint(255,15);

  
  if(mouseX>500)  {
  b = loadImage("W1.gif");
b.resize(854,524);
image(b, 0, 0);
  }
  
  
  if(mouseX<500)  {
f = loadImage("W2.gif");
f.resize(854,524);
image(f, 0, 0); 
  }
  

  
//  if (mousePressed){
//   ellipse(50,50,50,50); 
//    
//  }


}


