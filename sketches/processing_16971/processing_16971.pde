
int counter;

void setup() {  //setup function called initially, only once
  size(1000, 1000);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
 background(255);
 noFill();
  func(width/2,height/2,mouseX,7);
}


void func(float x, float y, float radius, int depth){
   if( depth > 0){
      ellipse(x,y,radius,radius);
      func(x + radius/2,y,radius/ 2,depth - 1);
      func(x - radius/2,y,radius/ 2,depth - 1);
      func(x ,y + radius/2,radius/ 2,depth - 1);
      func(x ,y - radius/2,radius/2,depth - 1);
   }
   
   
 }
   
   

                
                                
