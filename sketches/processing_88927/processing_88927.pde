
PImage img;
PImage img2;
import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup() {
  size(300, 600, P3D);
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  player = minim.loadFile("cali.mp3");
  
   
   
   
  textFont(createFont("Firecat Medium", 24));
  img = loadImage("slash.jpg");
  img2 = loadImage("slash2.jpg");
  noCursor();
}

void draw () {
  background(75, 75, 75);
  // Displays the image at its actual size at point (0,0)
  imageMode(CORNERS);
  tint(255, 255);
  image(img, 0, mouseY, 300, 300);
  image(img2, 0, mouseX, 300, 300);
  // Displays the image at point (0, height/2) at half of its size
  imageMode(CENTER);
  tint(240, 126, 240);  // Apply transparency without changing color
  filter(BLUR, 2);
  image(img, mouseX, mouseY, img.width/2, img.height/2);
  image(img2, mouseY, mouseY, img.width/2, img.height/2);
  noStroke();
  fill(0, 0, 0);
  rect(20, 20, 260, 40);
  strokeWeight(5);
  stroke(255, 255, 255);
  ellipse(width/2, height/2, 100, 100);
  if (mouseX>width/2-50 && mouseY>height/2-50 && mouseX< width/2+50 && mouseY < height/2+50) {
    fill(255, 0, 0);
    text("PLAY", width/2-45, height/2+10);
    player.play();
  }
  else { fill(0, 0, 0);
   player.pause();
   player.rewind();

  fill(255, 255, 255);
  text("Boom", 100, 55);
}
}


