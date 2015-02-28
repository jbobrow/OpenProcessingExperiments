
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


PImage img; 

Minim minim;


AudioOutput au_out;
SquareWave sqw ;
LowPassSP lpass ;

int detail=20;
color c;

void setup()
{
 size(400,400) ;
 minim = new Minim(this) ;
 au_out = minim.getLineOut() ;
 // create a SquareWave with a frequency of 440 Hz, 
 // an amplitude of 1 and the same sample rate as out
 sqw = new SquareWave(440, 1, 44100);
 // create a LowPassSP ﬁlter with a cutoff frequency of 200 Hz 
 // that expects audio with the same sample rate as out
 lpass = new LowPassSP(200, 44100);
 // now we can attach the square wave and the ﬁlter to our output
 au_out.addSignal(sqw);
 au_out.addEffect(lpass);

img =loadImage("sillydan.jpg");

}
void stop()
{
 super.stop() ;
}
void draw() 
{
 for(int i=0;i<width;i+=detail){
for(int j=0;j<height;j+=detail){
c=img.get(i+ (int)detail/2,j+ (int)detail/2);
noStroke();
fill(c);
rect(i,j,detail,detail);
saveFrame();
int b = abs(c);
int a = b/10000;
println(a);

  
 sqw.setFreq(a) ;

}
} 
  

}
void keyPressed()
{
 if ( key == 'm' )
 {
 if ( au_out.isMuted() )
 {
 au_out.unmute();
 }
else
 {
 au_out.mute();
 }
 }
}


