
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);

  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 

  counter++;

  strokeWeight(counter);  // Beastly

   80*sin(counter), 80*sin(counter)
   
 fill(random(255),100,255,50);
     background(random(255));  //set background white

 
  ellipse(width/2, height/2, 128*sin(counter), 128*sin(counter));
  if(counter == height) {
      counter = 0;
  }

}
