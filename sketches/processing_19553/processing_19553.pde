
PFont font;

void setup(){
  size(250 ,250);
  smooth();
  font = loadFont("Futura-Medium-48.vlw");
  //the exact file name of your VLW font
  background(149, 143, 184);
  textFont(font);
}


void draw(){
  fill(119, 113, 154);
  text("L4G0C8", random(250), random(250));
  fill(255);
  textSize(random(20));
text("L4G0C8", mouseX, mouseY);//postal code shows up on screen from mouse location
}

void mouseClicked(){
  background(149, 143, 184);//screen resests upon click
}

