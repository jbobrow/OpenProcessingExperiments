
import pitaru.sonia_v2_9.*;

ParticleSystem ps = new ParticleSystem();

PImage loaded;

void setup(){
  size(468,60,P2D);
  background(255);
  frameRate(60);
  smooth();
  noStroke();
  Sonia.start(this);
  LiveInput.start();
  loaded = loadImage("img.png");
  imageMode(CENTER);
}

void draw(){
  float level = LiveInput.getLevel();
  fill(255);
  rect(0,0,width,height);
  
  if(level > .05){
    fill(180,20,230);
    noStroke();
    ellipse(random(width),random(height),level*400,level*400);
    fill(100,230,20);
    ellipse(random(width),random(height),level*200,level*200);
    ellipse(random(width),random(height),level*200,level*200);
    ellipse(random(width),random(height),level*200,level*200);
    if(level > .10){

      //ps.add(new Particle(random(0,width),random(0,height)));
      //ps.run();
    }
  }
  image(loaded,width/2,height/2,loaded.width/10*(level*10),loaded.height/10*(level*10));
  if(frameCount%3 == 0){
    image(loaded,random(width),random(height),loaded.width/10*(level*5),loaded.height/10*(level*5));
  }
  if(frameCount%10 == 0){
    image(loaded,random(width),random(height),loaded.width/10*(level*8),loaded.height/10*(level*8));
  }
}

public void stop() {
  Sonia.stop();
  super.stop();
}


