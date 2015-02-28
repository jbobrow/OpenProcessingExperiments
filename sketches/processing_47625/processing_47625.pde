
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer audio;
float SMOOTHING = 1;
float vol = 0;
float trans;
PImage bg;
PImage hongo2;
int a;

void setup()
{
size(700, 486);
bg = loadImage ("trip.jpg"); 


ellipseMode (CENTER);
imageMode (CENTER);
noStroke();
smooth();

minim = new Minim(this);
audio = minim.loadFile("musica.mp3");
audio.loop();
trans= 230;
hongo2 = loadImage ("hongo2.png");
}

void draw() {
background(bg);


fill(42,155,109, trans);


vol = lerp(vol, audio.mix.level(), SMOOTHING);


ellipse(width/2, height, width, height-vol*50);

smooth(); 
image(hongo2,width/2,(height-vol*50)-height/2-30,100,100);
image(hongo2,width/2-90,(height-vol*50)-height/2-15,80,80);
image(hongo2,width/2+90,(height-vol*50)-height/2-15,80,80);
image(hongo2,width/2-180,(height-vol*50)-height/2+10,70,70);
image(hongo2,width/2+180,(height-vol*50)-height/2+10,70,70);
image(hongo2,width/2+240,(height-vol*50)-height/2+50,50,50);
image(hongo2,width/2-240,(height-vol*50)-height/2+50,50,50);
image(hongo2,width/2+280,(height-vol*50)-height/2+80,30,30);
image(hongo2,width/2-280,(height-vol*50)-height/2+80,30,30);
}

