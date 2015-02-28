
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(200,200,255); 
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  
  fill(random(200,255),random(150,200),0,50);
  ellipse((width/2) + random(6), (height/2) + random(6), 80*sin(counter), 80*sin(counter));

  strokeWeight(5);
  stroke(0,random(150,225),0,5);
  int topOfGrass = counter%width;
  line(topOfGrass + random(-15,15),random(height-55, height), topOfGrass + random(-5,5), height);
}
