

  int barWidth = 20;
int lastBar = -1;
//This code will import noise into my project.
    import processing.sound.*;
PinkNoise noise;
  
  void setup() {
//This code will input noise into my project.  This is the link where I got the code:
//https://www.processing.org/reference/libraries/sound/PinkNoise.html
noise = new PinkNoise(this);
  noise.play();
//This is for the background size and colour, I chose for it to be fairly big so theres more space to fit in my different shapes.
  size(700,700);
  noStroke();
  //This helps choose the colour mode to fill the shapes.  Examples are HSB or RGB.
colorMode(HSB, width, height, 100); }

void draw() {
  int whichBar = mouseX / barWidth;
  if (whichBar != lastBar) {
    int barX = whichBar * barWidth;
    //This allows wherever you point your mouse to be filled a different colour, I was hoping that in each shape there would be several colours mixed togather to for an array of colours but one shape seemed to only be able to contain one colour.  I got this snippet from this website:
//https://processing.org/examples/saturation.html
  fill(barX, mouseY, 66);
  rect(random(0,700),random(20,700),40,40);
  fill(random(66,90),100,80,100);
    rect(random(0,700),random(20,700),40,40);

}
}
void keyPressed() {
  int keyIndex = -1;
  //These show the keys needed to be pressed to manipulate the art.
  //I could have chosen any random key to manipulate the art but a seemed the most simple one to handle other than the space bar.  This part of the code also allows the art to reset when a key other than "a" is pressed.  I got this snippet from this website:
//https://processing.org/examples/keyboard.html
  if (key >= 'A' && key <= 'A') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'a') {
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    background(0);
  } else {
//This is the shape that will appear and change colour when the keys are pressed
//adding an extra number to the fill allowed it to be transparent,
//I had trouble with choosing the right colours but I eventually decided on very low toned calm colours.
fill(random(0,400),200,500,200);
ellipse(random(0,700), random(0,700),300,300);


  }
}
