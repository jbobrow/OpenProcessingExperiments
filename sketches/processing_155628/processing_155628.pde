
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
ellipse(199,100,125,150);
rect(174 175,55,175);
rect(100,200,80,10);
rect(225,200,80,10);
rect(175,325,10,80);
rect(225,325,10,80);
ellipse(180,85,10,10);
ellipse(225,85,10,10);
rect(199,120,5,8);
rect(175,130,50,10);
