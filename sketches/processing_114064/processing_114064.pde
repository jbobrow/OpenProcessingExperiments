
//Group 4

int counter;
int opacity;

void setup(){
  size(600, 600);       //set window size
  background(0);        //set background black
  colorMode (HSB);      //set colours to Hue, Saturation and Brightness mode
  counter = 0;
  opacity = 50;
  frameRate(20);
  smooth();
}

void draw() {
  
  //generates lines with random Hue
  stroke(random(255), 75, 255, opacity);
  //draws line from the centre of window to a random point on screen
  line(width/2, height/2, random(width), random(height));
  
  //generates lines with random Hue and less brightness
  stroke(random(255), 25, 255, opacity);
  //draws line from the centre of window to a random point on screen
  line(width/2, height/2, random(width), random(height));
  
  counter++;
  noStroke();
  //this is the Hue, Saturation and Brightness inside the flashing circle
  fill(random(255), 150, 255, 20);
  ellipse(width/2, height/2, 50*sin(counter), 50*sin(counter));  
}


