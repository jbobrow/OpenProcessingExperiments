
int counter;
int STEPS = 20;
int x;

void setup() {  //setup function called initially, only once
  size(200, 200);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(255,255,255,255);
  
  for(int i = 0; i < 20; i++){
      x = (STEPS*((counter/STEPS)%2)+(pow(-1,(counter/STEPS)%2)*i)*pow(-1,(counter/(STEPS*2))%2); 
      ellipse(x*10+5, i*10+5, 10, 10);
  }
  
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 10, 10);
  }
}
