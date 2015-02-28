
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void setup(){size(500,500);}
void draw(){fill(random(0,225),0,50,250);
ellipse(mouseX,mouseY,random(0,400),random(0,400));
}

                
                
