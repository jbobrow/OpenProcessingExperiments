
float x = 33; 
float y = 60;
PImage img;
PImage a;

void setup() {
  size (400,533);
  img = loadImage ("100_0555.jpg");
   a = loadImage ("clock.png");
  background (img);
}

void draw() {
  
  if ((mouseX >= x) && (mouseY <= x+55) && 
  (mouseX >= y-24) && (mouseY <= y )) {
    x += random (-5,5);
    y += random (-5,5);
  }
  image (a, x, y);
   
}

void keyReleased() {
  if(keyCode == DELETE || keyCode == BACKSPACE) {
    image(img,0,0);
  }
  if(key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

