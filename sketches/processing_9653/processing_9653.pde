
import ddf.minim.*;

Minim minim;
AudioInput in;
//AudioPlayer player;

void setup() {

  size(400, 300);
  smooth();
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  //player = minim.loadFile("jingle.mp3", 2048);
  //player.loop();

}

void draw() {

  background(255);
    
  //float w = mouseY/10;
  float vol = in.mix.level();
  //float w = player.mix.level() * 100;
  
  fill(255, 0, 0);
  stroke(255, 0, 0);

  float r = 100 + vol*100;
  ellipse(200, 150, r, r);
  
  
//  beginShape();
//  vertex(80+random(w)-w/2, 50+random(w)-w/2);
//  vertex(150+random(w)-w/2, 50+random(w)-w/2);
//  vertex(220+random(w)-w/2, 250+random(w)-w/2);
//  vertex(180+random(w)-w/2, 250+random(w)-w/2);
//  vertex(150+random(w)-w/2, 190+random(w)-w/2);
//  vertex(100+random(w)-w/2, 190+random(w)-w/2);
//  vertex(80+random(w)-w/2, 250+random(w)-w/2);
//  vertex(25+random(w)-w/2, 250+random(w)-w/2);
//  endShape(CLOSE);

}



