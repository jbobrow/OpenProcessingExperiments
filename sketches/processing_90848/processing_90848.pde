
float mappedXpos;
float mappedColor;

void setup() {
  size(450, 450);
  background(168, 174, 153);
}

void draw() {
  mappedColor=map(mouseY,0,height,0,255);
  background(mappedColor);
  fill(33, 80, 86);
  stroke(255);
  strokeWeight(5);
  for (int i= 50; i < 400; i+=100) {
    for (int j=40;j<400;j+=100) {
      rect(i, j, 60, 60);
      rect(i, j, 5, 5);
      rect(i+50,j+50,5,5);
                  rect(i+50,j+50,5,5);
    }
  }
}
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
