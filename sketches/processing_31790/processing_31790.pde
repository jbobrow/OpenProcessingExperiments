

float x = 1;
float y = 1;
float color_a =0;
float count = 100;
 
void setup(){  
  size(500,500);
  background(255);
  noStroke();
  smooth();

}

void draw(){ 
 
  while(count<300){

  count = 100+10;
  color_a = (0);
    x = x;
    y = y+random (180);
  fill (color_a,0,0,20);
  ellipse(x, y, count, count); 
    x = x+5;
    y = y+5;
    
  if (x > 500){ 
      x=0;
    }
    
  if (y>500){
      y=30;

}
}
}


