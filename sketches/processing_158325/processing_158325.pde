
import geomerative.*;
import ddf.minim.*;
import ddf.minim.ugens.*;

Minim       minim;
AudioOutput out;
Oscil       wave;
 
RFont font;
PFont p;
RGroup grp;
RPoint[] pnts;
float [] iniPntxs;
float [] iniPntys;
float [] iniPntxsT;
float [] iniPntysT;
char [] targetKeys = {
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
  'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
  'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
  'y', 'z'
};
float xOffset, yOffset;
 

void setup()
{
  //background(234,154,175);
  size(680, 480);
  RG.init(this);
  p = loadFont("Value-Sans-48.vlw");
  font = new RFont( "Value-Sans.ttf",250, RFont.CENTER);
  frameRate(30);
  xOffset = width/2;
  yOffset = height/4*3;
  grp = font.toGroup("c");
  RCommand.setSegmentLength(1);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  grp = grp.toPolygonGroup();
  pnts = grp.getPoints();
  iniPntxsT = new float[pnts.length];
  iniPntysT = new float[pnts.length];
  iniPntxs = new float[pnts.length];
  iniPntys = new float[pnts.length];
  for ( int i = 0; i < pnts.length; i++ )
  {
    iniPntxsT[i] = pnts[i].x+xOffset;
    iniPntysT[i] = pnts[i].y+yOffset;
    iniPntxs[i] = iniPntxsT[i]*1.1+random(-50, 50);
    iniPntys[i] = iniPntysT[i]*1.1+random(-50, 50);
  }
  smooth();
  
  minim = new Minim(this);
  
  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut();
  
  // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
  wave = new Oscil( 123, 0.5f, Waves.SINE );
  // patch the Oscil to the output
  wave.patch( out );  
}

void mouseMoved()
{
  // usually when setting the amplitude and frequency of an Oscil
  // you will want to patch something to the amplitude and frequency inputs
  // but this is a quick and easy way to turn the screen into
  // an x-y control for them.
  
  // this crap makes the y noise connect to the amplitude of the sound
  float amp = map( mouseX, 0, height, 1, 0 );
  
  //wave.setAmplitude( amp );
  wave.setAmplitude( amp );
  
 
  float freq = map( mouseY, 0, width, 361, 848 );
  //float freq = 300;
  wave.setFrequency( freq );
  println("mouse x:"+mouseX,"mouse y:"+ mouseY);
}
 
void draw()
{
  noStroke();
  fill(220,240,185);
  rect(0,0,width,height);
  strokeWeight(1.0);
  stroke(0);
  fill(255,20);
  beginShape();
  for ( int i = 0; i < pnts.length; i++ )
  {
    iniPntxs[i] += (iniPntxsT[i]-iniPntxs[i])/5;
    iniPntys[i] += (iniPntysT[i]-iniPntys[i])/5;
    float x0 = pnts[i].x;
    float y0 = pnts[i].y;
    float a = mouseX-x0;
    float b = mouseY-y0;
    float r = sqrt(a*a+b*b);
    float quer_fugir_x = pnts[i].x-(a/r)*200/r;
    float quer_fugir_y = pnts[i].y-(b/r)*200/r;
    float quer_voltar_x = (iniPntxs[i]-x0)/3;
    float quer_voltar_y = (iniPntys[i]-y0)/3;
    pnts[i].x = quer_fugir_x+quer_voltar_x;
    pnts[i].y = quer_fugir_y+quer_voltar_y;
    curveVertex(pnts[i].x, pnts[i].y);
  }
  endShape();

}
 
void keyPressed() {
  for (int i=0;i<targetKeys.length;i++) {
    testKey(targetKeys[i]);
  }
}
 
void testKey(char keyInput_) {
  if (key == keyInput_) {
    String targetLetter = str(keyInput_);
    grp = font.toGroup(targetLetter);
    RCommand.setSegmentLength(1);
    RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
    grp = grp.toPolygonGroup();
    pnts = grp.getPoints();
    iniPntxsT = new float[pnts.length];
    iniPntysT = new float[pnts.length];
    iniPntxs = new float[pnts.length];
    iniPntys = new float[pnts.length];
    for ( int i = 0; i < pnts.length; i++ )
    {
      iniPntxsT[i] = pnts[i].x+xOffset;
      iniPntysT[i] = pnts[i].y+yOffset;
      iniPntxs[i] = iniPntxsT[i]*1.1+random(-50, 50);
      iniPntys[i] = iniPntysT[i]*1.1+random(-50, 50);
    }
  }
  
  switch( key )
  {
    case 'a': 
      println("the a key has been pressed");
      break;
     
    case '2':
      wave.setWaveform( Waves.TRIANGLE );
      break;
     
    case '3':
      wave.setWaveform( Waves.SAW );
      break;
    
    case '4':
      wave.setWaveform( Waves.SQUARE );
      break;
      
    case '5':
      wave.setWaveform( Waves.QUARTERPULSE );
      break;
     
    default: break; 
  }
  
}


