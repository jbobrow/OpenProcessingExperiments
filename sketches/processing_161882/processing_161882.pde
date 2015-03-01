
int counter;

void setup() {  //setup function called initially, only once
  size(1000, 1000);
  background(255);  //set background to colour
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 

  noStroke();
    fill(random(0,0,0),10000,255,50);

  
  if(mousePressed == true) { //add some interaction
    fill(255,255,255);
    ellipse(mouseX, mouseY, 20, 20);
    fill(255,0,0);
    ellipse(mouseX+50, mouseY+50, 20, 20);   
    fill(0,0,128);
    ellipse(mouseX+100, mouseY+100, 20, 20);
    fill(0,128,255);
    ellipse(mouseX+150, mouseY+150, 20, 20);
    fill(128,128,128);
    ellipse(mouseX+200, mouseY+200, 20, 20);
    fill(200,200,128);
    ellipse(mouseX+250, mouseY+250, 20, 20);
   
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
 }
