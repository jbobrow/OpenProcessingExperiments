
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(115);  //set background white
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
void draw() {
counter++
noStroke();
fill(random(255),100,225,50);
ellipse(width/3, height/1, 99*sin(counter), 290*sin(counter));
}
void draw() {
counter++
noStroke();
fill(random(255),100,225,50);
ellipse(width/4, height/4, 89*sin(counter), 90*sin(counter));
}
