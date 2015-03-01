
import ddf.minim.*;  

Minim minim;
AudioPlayer player;

int _waveH = 300;  //波形の高さ
int _fluctuationDepth = 100; //ゆらぎ大きさ
float _noiseSeed;
float _rotateSeed;
float _rotateSpeed = 0.3;
int _alpha = 7;
float _colorTransion = 0.03;
float _initRadius =25;

void setup()
{
  size(854, 480);
  colorMode(HSB, 360, 100, 100, 255);
  background(#000000);
  minim = new Minim(this);
  player = minim.loadFile("oneChordv4.mp3", 1024);
  player.loop();
}

void draw()
{
  scrRefresh();
  _noiseSeed += 0.01;

  translate(width/2, height/2);
  _rotateSeed += noise(_noiseSeed);
  rotate(radians(_rotateSeed*_rotateSpeed));
  pushMatrix();
  float xnoise = _fluctuationDepth*(noise(_noiseSeed)-0.5);
  float ynoise = _fluctuationDepth*(noise(_noiseSeed)-0.5);    
  translate(xnoise-player.left.size()/2, ynoise);
  for (int i=0; i< player.left.size()-1; i+=random(10,40)) {
    noStroke();
    fill((frameCount*_colorTransion+80*(1-abs(player.mix.get(i)))-20)%360, 100, 70, 255);
    float radius = random(0, 10)+_initRadius*player.mix.get(i);
    ellipse(i, player.left.get(i)*_waveH, radius, radius);
  }
  popMatrix();
}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}

void scrRefresh() {
  fill(0, 0, 0, _alpha);
  noStroke();
  rect(0, 0, width, height);
}


