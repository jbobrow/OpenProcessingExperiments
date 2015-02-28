
import ddf.minim.analysis.*;
import ddf.minim.*;
Minim minim1, minim2;
FFT fft1, fft2;
//AudioInput in;
AudioPlayer in;
AudioPlayer radio;
PImage src, stream;
int Buf = 1024;
int dshift = 0;
float r, l;

Date d = new Date();

void setup() {
  colorMode(HSB, 255);
  background(0);
  size(800, 520);
  minim1 = new Minim(this);
  minim2 = new Minim(this);
  // in     = minim1.getLineIn(Minim.STEREO, Buf);//, 11025, 8);
  in     = minim2.loadFile("http://46.165.199.240:80/1", Buf);
  radio  = minim2.loadFile("http://46.165.199.240:80/1", Buf);
  fft1 = new FFT(in.bufferSize(), in.sampleRate());
  fft2 = new FFT(radio.bufferSize(), radio.sampleRate());
  // fft2.window(FFT.HAMMING);
  //println(radio.bufferSize());
  in.play();
  radio.play();
  in.mute();
  radio.mute();
}

void draw() {
  stroke(0);
  line(width-1, 0, width-1, height);
  fft1.forward(in.left);
  fft2.forward(radio.left);

  //println(fft1.getBandWidth());

  for (int i = 0; i < fft1.specSize()/2; i++) {
    r = fft1.getBand(i)*50;
    stroke(r);
    point(width/2, i);
    l = fft2.getBand(i)*50;
    stroke(l);
    point((width/2)+dshift, i+(height/2));
  }

  src     = get(0, 0, width, height/2);
  stream  = get(0, height/2, width, height);
  image(src, -1, 0);
  image(stream, -1+dshift, height/2);

  if (round(frameCount%frameRate)==1) {
    //timer();
  }
}

void timer() {
  long current = d.getTime()/1000;
  println(current);
}

void keyPressed() {
  if (key == 'm') {
    if (radio.isMuted()) {
      radio.unmute();
      println("radio unmuted");
    } 
    else {
      radio.mute();
      println("radio muted");
    }
  }
  if (key == 'q') {
    in.close();
    radio.close();
    minim1.stop();
    minim2.stop();
    super.stop();
    exit();
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      dshift++;
    }
    if (keyCode == LEFT) {
      dshift--;
    }
    println(dshift);
  }
}


