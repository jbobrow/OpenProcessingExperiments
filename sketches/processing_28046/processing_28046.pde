
int counter;

void setup() {  //setup function called initially, only once
  size(600, 400);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  ellipse(mouseX, mouseY, 150,150);
  fill(random(255),10,0,10);
 
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 50, 50);
    fill(255,100,255,random(30));
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}

                
                
