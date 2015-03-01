
import ddf.minim.*;

Minim minim;
AudioPlayer radio;

void setup()
{
  size(512, 200);
  minim = new Minim(this);
  textFont(loadFont("SempliceRegular-8.vlw"),8);
  radio = minim.loadFile("http://giss.tv:8000/kof.mp3", 512);
  radio.play();
}

void draw()
{
  background(0);
  fill(255);
  text("Kof's TAZ radio",10,12);
  
  
  if(radio.isPlaying()){
  fill(0,(sin(millis()/100.0)+1.0)*128.0,0);
  text("LIVE!",10,22);
  }else{
  fill((sin(millis()/100.0)+1.0)*128.0,0,0);
  text("Connecting ...",10,22);
    try{
    radio = minim.loadFile("http://giss.tv:8000/kof.mp3", 512);
    radio.play();
    }catch(Exception e){;}
  }
  
  stroke(255);
  for(int i = 0; i < radio.bufferSize()-1; i++)
  {
    float x1 = map(i, 0, radio.bufferSize(), 0, width);
    float x2 = map(i+1, 0, radio.bufferSize(), 0, width);
    line(x1, 50 + radio.left.get(i)*50, x2, 50 + radio.left.get(i+1)*50);
    line(x1, 150 + radio.right.get(i)*50, x2, 150 + radio.right.get(i+1)*50);
  }
}

void stop()
{
  radio.close();
  minim.stop();

  super.stop();
}

