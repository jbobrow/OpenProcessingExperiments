
// Import der SoudLib
import pitaru.sonia_v2_9.*;
PFont f;
void setup() {
size(200,600);
f= loadFont("micfont2.vlw");
Sonia.start(this);
// Startet das Input Signal
LiveInput.start();
smooth();
}
void draw() {
background(255,20,147);
fill(255,20,147); 

// Lautstärke verwenden 
float level = LiveInput.getLevel();
fill(200);
noStroke();

rect(0,height,width,level*-3000);
fill(255,20,147);
textFont(f,25);
text("Quiet, you bastard",10,20);
fill(200);
textFont(f,25);
text("Make some noise.",10,580);

}
// Schließen der Sound Engine
public void stop() {
Sonia.stop();
super.stop();

}


