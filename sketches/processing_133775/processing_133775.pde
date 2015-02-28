
import ddf.minim.*;
Minim minim;
AudioSample pad1;
AudioSample pad2;
AudioSample pad3;
AudioSample pad4;

AudioSample pad5;
AudioSample pad6;
AudioSample pad7;
AudioSample pad8;

AudioSample pad9;
AudioSample pad10;
AudioSample pad11;
AudioSample pad12;

AudioSample pad13;
AudioSample pad14;
AudioSample pad15;
AudioSample pad16;

void setup()
{
  size(800, 400, P3D);
  minim = new Minim(this);
  
  pad1 = minim.loadSample("KILLER_K.WAV", 512); if ( pad1 == null ) println("Didn't get pad1");
  pad2 = minim.loadSample("Scsnr65.wav", 512); if ( pad2 == null ) println("Didn't get pad2");
  pad3 = minim.loadSample("tight_ass_hat_6.wav", 512); if ( pad3 == null ) println("Didn't get pad3");
  pad4 = minim.loadSample("tight_ass_hat_7.wav", 512); if ( pad4 == null ) println("Didn't get pad4");
  
  pad5 = minim.loadSample("crunkkixboom2.wav", 512); if ( pad5 == null ) println("Didn't get pad5");
  pad6 = minim.loadSample("Dirty_clb.wav", 512); if ( pad6 == null ) println("Didn't get pad6");
  pad7 = minim.loadSample("Rim_1b.wav", 512); if ( pad7 == null ) println("Didn't get pad7");
  pad8 = minim.loadSample("Bell.wav", 512); if ( pad8 == null ) println("Didn't get pad8");
  
  pad9 = minim.loadSample("bassandjuve2.wav", 512); if ( pad9 == null ) println("Didn't get pad9");
  pad10 = minim.loadSample("bassandjuve3.wav", 512); if ( pad10 == null ) println("Didn't get pad10");
  pad11 = minim.loadSample("cw_stab03.wav", 512); if ( pad11 == null ) println("Didn't get pad11");
  pad12 = minim.loadSample("cw_stab04.wav", 512); if ( pad12 == null ) println("Didn't get pad12");
  
  pad13 = minim.loadSample("cw_electrohit43.wav", 512); if ( pad13 == null ) println("Didn't get pad13");
  pad14 = minim.loadSample("soul.wav", 512); if ( pad14 == null ) println("Didn't get pad14");
  pad15 = minim.loadSample("cw_outerchord10.wav", 512); if ( pad15 == null ) println("Didn't get pad15");
  pad16 = minim.loadSample("cw_outerchord01.wav", 512); if ( pad16 == null ) println("Didn't get pad16");  
  
}

void draw()
{
  background(#FF6B6B);
   stroke(#4ECDC4);
  
  // use the mix buffer to draw the waveforms.
  for (int i = 0; i < pad1.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, pad1.bufferSize(), 0, width);
    float x2 = map(i+1, 0, pad1.bufferSize(), 0, width);
    line(x1, 50 - pad1.mix.get(i)*50, x2, 50 - pad1.mix.get(i+1)*50);
    line(x1, 150 - pad2.mix.get(i)*50, x2, 150 - pad2.mix.get(i+1)*50);
    line(x1, 250 - pad3.mix.get(i)*50, x2, 250 - pad3.mix.get(i+1)*50);
    line(x1, 350 - pad4.mix.get(i)*50, x2, 350 - pad4.mix.get(i+1)*50);
    line(x1, 45 - pad5.mix.get(i)*50, x2, 45 - pad5.mix.get(i+1)*50);
    line(x1, 145 - pad6.mix.get(i)*50, x2, 145 - pad6.mix.get(i+1)*50);
    line(x1, 245 - pad7.mix.get(i)*50, x2, 245 - pad7.mix.get(i+1)*50);
    line(x1, 345 - pad8.mix.get(i)*50, x2, 345 - pad8.mix.get(i+1)*50);
    
    
  }
}

void keyPressed() 
{
  if ( key == 'z' ) pad1.trigger();
  if ( key == 'x' ) pad2.trigger();
  if ( key == 'c' ) pad3.trigger();
  if ( key == 'v' ) pad4.trigger();
  
  if ( key == 'a' ) pad5.trigger();
  if ( key == 's' ) pad6.trigger();
  if ( key == 'd' ) pad7.trigger();
  if ( key == 'f' ) pad8.trigger();
  
  if ( key == 'q' ) pad9.trigger();
  if ( key == 'w' ) pad10.trigger();
  if ( key == 'e' ) pad11.trigger();
  if ( key == 'r' ) pad12.trigger();
  
  if ( key == '1' ) pad13.trigger();
  if ( key == '2' ) pad14.trigger();
  if ( key == '3' ) pad15.trigger();
  if ( key == '4' ) pad16.trigger();
}

