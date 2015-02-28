
float margen, sp;

void setup(){
  margen = 20;
  sp = 25;
  size(500, 500);
  smooth();
  //noStroke();
}


void draw(){
  background(255);
  for(float y =margen; y <= height-margen; y += sp){
    for(float x = margen; x <= width-margen; x += sp){
      float d; //esta es la distancia
      d = 100 - sqrt((mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY - y));
      
     
     smooth();
     fill(#FA9108);
     ellipse(x, y, 20/d, 20/d);
     strokeWeight(1);
     fill(0,100); 
     rect(mouseY,x, 50/d, 50/d); 
    
 
     fill(34,96,97,100); 
     ellipse(mouseX,y, 50/d, 50/d); 
     strokeWeight(1); 
     smooth();  

    
    }
  }
}


