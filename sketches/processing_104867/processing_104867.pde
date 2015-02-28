
int counter;
ArrayList<ellipse> ellipses;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  for (int i = 0; i <= 10; i++) {
      for (int j = 0; j <= 10; j++) {
          ellipse(50*i, 50*j, 20, 20);
          ellipses.add(ellipse);
      }
  }
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    //ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
