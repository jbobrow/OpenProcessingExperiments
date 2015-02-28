




int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  loveandhate();
  _draw(); 
}
void loveandhate(){
   arc(random(250), random(250), random(250), random(250), PI/2, TWO_PI);
} 
void _draw(){
    line (random (250), random (250), random (250), random (250)); 
}

                
                
