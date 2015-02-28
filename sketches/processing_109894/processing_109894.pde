
import gifAnimation.*;

PShape packet;
PShape bpacket;
PFont font;
PImage[] animation;
Gif loopingGif;
boolean pause = false;

public void setup() {
  size(810,810);
  frameRate(400);
  packet = loadShape("packet.svg");
  bpacket = loadShape("b-packet.svg");
  font = loadFont("Geneva-48.vlw");

  println("gifAnimation " + Gif.version());
  // create the GifAnimation object for playback
  loopingGif = new Gif(this, "animated-trex.gif");
  loopingGif.loop();
  animation = Gif.getPImages(this, "animated-trex.gif");
}

void draw() {

  bpacket.setVisible(mousePressed);
  if (!bpacket.isVisible() == false) {  // Or use: "if (!s.isVisible)"
  shape(bpacket, width/4, height / 2 - loopingGif.height/3, 400, 200); 
   
  }
  else{
  shape(packet, width/3, height / 2 - loopingGif.height/3, 300, 200);     
  textFont(font, 48);
  text("Click",  (width/3)+100, (height / 2 - loopingGif.height/3)+120);
  fill(0);
  }
  
   if (mousePressed == true) {
  image(loopingGif, 10, height / 2 - loopingGif.height/3);
  }
}



