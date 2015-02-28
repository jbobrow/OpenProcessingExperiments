
float v; 
float easing = 0.2;  // Between 0 and 1, higher means sharper movement
float volumeScalar = 500;  // Higher means more movement
boolean sound = true;  // set to false to test with the mouse, true for sound
float mustachewiggle;
float reb; //right eyebrow
float leb; //left eyebrow
float eyes;  //left eye


void setup() {
  size(854, 480);
  smooth();
  noCursor();
  mustachewiggle=0;
  if (sound) setupVolume();
}
void draw() {
  background(255);
  if (sound) getVolume();
  else v = volume; 
  testFace();
}
String name = "J Taylor Devine";
void testFace() {
 
  background(50);
  mustachewiggle=mustachewiggle+v*64;
  pushMatrix();
    translate(width/2,height/2);
//Man's Face    
   fill(255,230,180);
    beginShape();
      //eyesocket indent
      curveVertex(-110,-100);
      curveVertex(-110,-100);
      curveVertex(-108,-85);
      curveVertex(-100,-60);
      curveVertex(-115,-20);
      curveVertex(-115,80);
    //chin point (below)
      curveVertex(0,150);
      curveVertex(115,80);
      curveVertex(115,-20);
    //eyesocket indent
      curveVertex(100,-60);
      curveVertex(108,-85);
      curveVertex(110,-100);
      curveVertex(110,-100);
      endShape();
    //eyes
    fill(255);
    ellipse(-55,-65,45,25+v);  
    ellipse(55,-65,45,25+v);
    fill(0);
    ellipse(-55,-65,7,7);
    ellipse(55,-65,7,7);
    //crown
    fill(255,230,180);
    arc(0,-100,220,220,radians(180),radians(360));
    fill(139,70,6);
    //left eyebrow
    leb=map(v*64,0,480,7,3);
   translate(-5,-10);
   rotate(radians(leb));
   translate(5,13);
    arc(-31,-100,20,20,radians(270),radians(450));
    beginShape();
      curveVertex(-30,-90);
      curveVertex(-30,-90);
      curveVertex(-75,-105+v);
      curveVertex(-120,-85);
      curveVertex(-120,-85);
      curveVertex(-123,-87);
      curveVertex(-75,-125+v);
      curveVertex(-30,-110);
      curveVertex(-30,-110);
    endShape();
   //right eyebrow
   reb=map(v*16,0,480,-9,0);
   translate(50,-60);
   rotate(radians(reb));
   translate(-50,60);
    arc(31,-100,20,20,radians(90),radians(270));
    beginShape();
      curveVertex(30,-90);
      curveVertex(30,-90);
      curveVertex(75,-80-v*2);
      curveVertex(120,-85);
      curveVertex(120,-85);
      curveVertex(123,-87);
      curveVertex(75,-90-v*4);
      curveVertex(30,-110);
      curveVertex(30,-110);
    endShape();
    
    //mustache
 popMatrix();
 
 pushMatrix();
   translate(width/2,height/2);
 //Mustache movement  
   mustachewiggle=map(v*64,0,480,-32,-13);
   rotate(radians(mustachewiggle));
    beginShape();
      arc(0,76,288,150,radians(180),radians(360));
      curveVertex(144,75);
      curveVertex(144,75);
      curveVertex(145,115);   //tip
      curveVertex(133,120);  //first lump
      curveVertex(110,95);
      curveVertex(110,95);
    endShape();
    beginShape();    //second lump
     curveVertex(110,95);
     curveVertex(110,95);
     curveVertex(100,105);
     curveVertex(90,105);
     curveVertex(80,95);
     curveVertex(80,95);
    endShape();
    beginShape();   //third lump
      curveVertex(80,95);
      curveVertex(80,95);
      curveVertex(70,105);
      curveVertex(60,105);
      curveVertex(45,95);
      curveVertex(45,95);
    endShape();
    beginShape(); //last bump
      curveVertex(45,105);
      curveVertex(45,95);
      curveVertex(35,105);
      curveVertex(25,100);
      curveVertex(15,90);
      curveVertex(0,65);
      curveVertex(0,27);
      curveVertex(0,27);
    endShape();
    noStroke();
    quad(144,75,30,75,45,96,110,96);
   stroke(1);
 //Left half
    beginShape();
      curveVertex(-144,75);
      curveVertex(-144,75);
      curveVertex(-145,115);   //tip 2
      curveVertex(-133,120);  //first lump 2
      curveVertex(-110,95);
      curveVertex(-110,95);
    endShape();
    beginShape();    //second lump 2
     curveVertex(-110,95);
     curveVertex(-110,95);
     curveVertex(-100,105);
     curveVertex(-90,105);
     curveVertex(-80,95);
     curveVertex(-80,95);
    endShape();
    beginShape();   //third lump 2
      curveVertex(-80,95);
      curveVertex(-80,95);
      curveVertex(-70,105);
      curveVertex(-60,105);
      curveVertex(-45,95);
      curveVertex(-45,95);
    endShape();
    beginShape(); //last bump 2
      curveVertex(-45,95);
      curveVertex(-45,95);
      curveVertex(-35,105);
      curveVertex(-25,100);
      curveVertex(-15,90);
      curveVertex(0,65);
      curveVertex(0,27);
      curveVertex(0,27);
    endShape();
    noStroke();
    quad(-144,75,-30,75,-45,96,-110,96);
   stroke(1);
  //nose
    fill(255,230,180);
    arc(0,-2,50,40,radians(0),radians(180));
  popMatrix();
  // Credits
  fill(150);
  text(name, -width/2+20, height/2-20);
  fill(255);
 
}
import ddf.minim.*;
Minim minim;
//AudioInput in;
AudioPlayer in;
float s_volume;
float volume;
void setupVolume() {
  minim = new Minim(this);
  //in = minim.getLineIn(Minim.MONO, 512);
  in = minim.loadFile("Memo.wav", 2048);  // your sound filename goes here!
  in.play();
}
void getVolume() {
  s_volume = in.right.level() * volumeScalar;
  // println(s_volume);
  float d_volume = s_volume - volume;
  if (abs(d_volume) > 1) {
    volume += d_volume * easing;
  }
 
  v = volume;
}
void stop() {
  in.close();
  minim.stop();
  super.stop();
}


