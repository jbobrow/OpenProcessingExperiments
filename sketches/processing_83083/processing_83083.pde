
import ddf.minim.*;

Minim minim;
AudioInput in;

int x = 30;
PFont fontA;

void setup()
{
  size(1366, 726, P2D);


  minim = new Minim(this);
  minim.debugOn();
  

  in = minim.getLineIn(Minim.STEREO, 1366);
  
  fontA = loadFont("FranklinGothic-DemiCond-48.vlw");
  text("YOU WON CARLING!!!", x, 50);;
  textFont(fontA, 50);




}

void draw()
{
  background(0);
  stroke(244,245,136);
  strokeWeight(50);
  line(0,425,1366,425);
  stroke(252,252,38);
  line(0,375,1366,375);
  stroke(255,201,23);
  line(0,325,1366,325);
  stroke(255,163,13);
  line(0,275,1366,275);
  stroke(255,133,3);
  line(0,225,1366,225);
  stroke(255,85,0);
  line(0,175,1366,175);
  stroke(255,9,0);
  line(0,125,1366,125);
  
  
  stroke(255);
  strokeWeight(3);
  
 
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    line(i, 500 + in.left.get(i)*500, i+1, 500 + in.left.get(i+1)*500);
      if(in.left.get(i)*425 > 400){
  fill(250);
  text("YOU WON CARLING!!!", x, 40);

      }
      
    
  } 
}


void stop()
{
  
  in.close();
  minim.stop();
  
  super.stop();
}

