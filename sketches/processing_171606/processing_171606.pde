
PImage background;
PImage[] frames = new PImage [8];
  
void setup()
{
  print(key);
   size(800,800);
   smooth();
   noStroke();
   frameRate(20);
   background = loadImage("back.jpeg");
   marsh = loadImage("player-1.png");
     for (int i=0; i < frames.length; i++) {
    String filename = "player-" + i + ".png";
    frames[i] = loadImage(filename);
    println("Loading " + filename);
  }

}
   
void draw()
{
  image(background,0,0);
  image(marsh, mouseX, mouseY);
}


