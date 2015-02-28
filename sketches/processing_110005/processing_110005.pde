
int counter;

void setup() {  //setup function called initially, only once
  size(850, 650);
  background(50);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
 line(pmouseX, pmouseY, mouseX, mouseY)
 for(int i=0; i<30; i++){
 point(mouseX + random(20), mouseY + random(20));
 }
 
 }
 
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
