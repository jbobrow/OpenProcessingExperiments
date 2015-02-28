
int counter;
int circ;
void setup() {  //setup function called initially, only once
  size(450, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() 
{  
  counter++;
  noStroke();
  fill(random(255),100,255);
  
  if(mousePressed == true) {
    fill(110,random(255),150);
  }
  circ = random(100);
  ellipse(random(450), random(250), circ,circ);
}

                
                
