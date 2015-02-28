
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(0);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),random(255),random(255),50);

  ellipse(width/2, height/2, 200*sin(counter)*cos(counter*4), 200*cos(counter)*sin(counter*4));
  
    fill(random(255),random(255),random(255),50);
  ellipse(width/1.01, height/1.01, 300*sin(counter)*cos(counter*4), 300*cos(counter)*sin(counter*4));
  
    fill(random(255),random(255),random(255),50);
  ellipse(width/35, height/35, 300*sin(counter)*cos(counter*4), 300*cos(counter)*sin(counter*4));
 
   fill(random(255),random(255),random(255),50);
  ellipse(width/1.01, height/35, 300*sin(counter)*cos(counter*4), 300*cos(counter)*sin(counter*4));
  
    fill(random(255),random(255),random(255),50);
  ellipse(width/35, height/1.01, 300*sin(counter)*cos(counter*4), 300*cos(counter)*sin(counter*4));

}
