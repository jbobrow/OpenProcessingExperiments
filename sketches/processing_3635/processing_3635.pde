
 
float margen, sp;
void setup(){
  margen=2; 
  sp=12; 
  size(500,500); 
  smooth(); 
   background (0);
  colorMode (RGB, 255);
} 
 
void draw(){ 
  for(float y= margen-2; y <= height-margen; y += sp){ 
    for (float x = margen; x <=width-margen; x += sp*2){ 
      float d; 
   d= 200 - sqrt((mouseX - x)*(mouseX - x)+(mouseY - y)*(mouseY -y)); 
     rotate (random(0.5,0.6));
       stroke(0);
     fill(mouseX+135,mouseY+33,mouseX+50,random(15,100)); 
      ellipse(x,y, d/8,d/8);
  }
  }
}


