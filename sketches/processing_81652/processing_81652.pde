
/* @pjs font="FuturaStd-Medium.otf", "ACaslonPro-Italic.otf"; */

import gifAnimation.*;

PFont futura1 = createFont("FuturaStd-Medium",random(100));
PFont futura2 = createFont("FuturaStd-Medium",random(100));
PFont futura3 = createFont("FuturaStd-Medium",random(100));

PFont caslon1 = createFont("ACaslonPro-Italic",random(100));
PFont caslon2 = createFont("ACaslonPro-Italic",random(100));
PFont caslon3 = createFont("ACaslonPro-Italic",random(100));

PImage[] animation;
Gif loopingGif;

void setup() {
   size(500, 375);
   frameRate(2);
   loopingGif = new Gif(this, "cookiestopmotion.gif");
   loopingGif.loop();
}

void draw() {
  background(255);
  image(loopingGif, 0, 0);
  fill(0);
  textFont(futura1);
  text("OM", random(600), random(400));
   textFont(futura2);
  text("NOM", random(600), random(400));
  textFont(futura3);
  text("NOM", random(600), random(400));
  textFont(caslon1);
  text("om", random(600), random(400));
  textFont(caslon2);
  text("nom", random(600), random(400));
  textFont(caslon3);
  text("nom", random(600), random(400));
}






