
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
}

void draw() {  //draw function loops 
  drawCircle(width/2, height/2,100);
}

void drawCircle(x,y,d){
   ellipse(x,y,d,d);
 // ellipse(x-d,y,d,d);
 if(d>2){
   drawCircle(x+d/2,y,d/2);
   drawCircle( x - d/2,y,d/2);
   drawCircle( x,y+d/2,d/2);
   }
   
}
