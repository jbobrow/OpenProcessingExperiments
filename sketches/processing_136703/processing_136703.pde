
import ddf.minim.*;

PImage fractal;
Minim minim;
AudioPlayer theme;

void setup() {
  minim = new Minim(this);
  theme = minim.loadFile("tencentsadance.mp3");
  theme.play();  
  size(800, 600);
  fractal = loadImage("London Shard tip.jpg");
}

void draw() {
  image(fractal, 0, 0, 800, 600);  
}


