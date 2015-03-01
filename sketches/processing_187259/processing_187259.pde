
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  colorMode(HSB, 360,100,100);   //set colors to Hue, Saturation, Brightness mode
  x=10; y=10; size=1;
}

void draw() {  //draw function loops 
  
  fill(random(360),70,90);
  
  if (size%2 == 0){
      fill(0,0,random(100));
  }
  
  ellipse(x,y,size,size);
  
  if (x > 250){
      x=10; y=10; size=1;
    }
    x=x+10; y=x+10; size=size+5;
}
