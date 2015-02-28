
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: LIM HYUNSEUNG
// ID: 201420104
import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
 
float x= 0;
float y= 0;
boolean onOff = true;

void setup () {
  size (800, 800);
  background(21, 0, 59);
  smooth();

  minim = new Minim (this);
  song = minim.loadFile("a.mp3");
  song.play ();
}
 
void draw () {
//CENTER LINE
stroke(0);
for(int y =400;y>0;y-=5){
  for(int x =400;x>0;x-=4){
    if(x<700&&y<700){
      line(x*2,y*2,x-10,y-10);
      
    }
  }
}
  float d = song.mix.level() * 250;
 


//LEFT UP LINE CIRCLE
noFill();
stroke(3, 92, 106);
for(int x=150;x<800;x+=8){
  strokeWeight(x%0.5);
  ellipse(x,x,x*2,x*2);
}

//RIGHT UP LINE CIRCLE
noFill();
stroke(148, 0, 43);
for(int x=60;x<800; x+=5){
  strokeWeight(x%1);
  ellipse(width,x,x*2,x*2);
}
}

void keyPressed() {
  if (key=='s') saveFrame("frames/frame_#####.jpg");
  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();

}
 
void title() {
  textAlign(LEFT);
  text("S = saveFrame / Tab = Change Color / Space = On/Off", 50, height-20);
  textAlign(RIGHT);
  text("LIMHYUNSEUNG, Spider web, Dynamic Media, 2014", width-50, height-20);
}

