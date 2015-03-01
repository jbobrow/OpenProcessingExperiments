


import ddf.minim.*;
//define samples
Minim minim;
AudioSample c;
AudioSample d;
AudioSample e;
AudioSample g;
AudioSample a;
AudioSample c4;



void setup()
{
  size(1000, 1000, P3D);
  minim = new Minim(this);

//load samples
  c = minim.loadSample("c.wav", 512);
  d = minim.loadSample("d.wav", 512);
  e = minim.loadSample("e.wav", 512);
  g = minim.loadSample("g.wav", 512);
  a = minim.loadSample("a.wav", 512);
  c4 = minim.loadSample("c4.wav", 512);
}

void draw()
{
  background(255);
  //measurement
  //text(("X:" + mouseX), 100, 10);
  //text(("Y:" + mouseY), 100, 30);


  // use the mix buffer to draw the waveforms.
  for (int i = 0; i < c.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, c.bufferSize(), 0, width);
    float x2 = map(i+1, 0, c.bufferSize(), 0, width);
    //    line(x1, 50 - c.mix.get(i)*50, x2, 50 - c.mix.get(i+1)*50);
    //    line(x1, 150 - d.mix.get(i)*50, x2, 150 - d.mix.get(i+1)*50);
    //    line(x1, 250 - e.mix.get(i)*50, x2, 250 - e.mix.get(i+1)*50);
    //    line(x1, 350 - g.mix.get(i)*50, x2, 350 - g.mix.get(i+1)*50);
    rectMode(CENTER);
    noFill();
    stroke(173, 255, 247);
    rect(width/2 - c.mix.get(i)*100, height/2 - c.mix.get(i)*100, 900 - c.mix.get(i)*100, 900 - c.mix.get(i+1)*100);
    noFill();
    stroke(178, 255, 173);
    rect(width/2- d.mix.get(i)*100, height/2 - d.mix.get(i)*100, 700 - d.mix.get(i)*100, 700 - d.mix.get(i+1)*100);
    noFill();
    stroke(255, 173, 173);
    rect(width/2 - e.mix.get(i)*100, height/2 - e.mix.get(i)*100, 500 - e.mix.get(i)*100, 500 - e.mix.get(i+1)*100);
    noFill();
    stroke(255, 155, 244);
    rect(width/2 - g.mix.get(i)*100, height/2 - g.mix.get(i)*100, 300 - g.mix.get(i+1)*100, 300 - g.mix.get(i)*100);
    noFill();
    stroke(255, 255, 82);
    rect(width/2 - a.mix.get(i)*100, height/2 - a.mix.get(i)*100, 150 - a.mix.get(i)*100, 150 - a.mix.get(i+1)*100);
    noFill();
    stroke(106, 126, 255);
    rect(width/2 - c4.mix.get(i)*100, height/2 - c4.mix.get(i+1)*100, 50 - c4.mix.get(i+1)*100, 50 - c4.mix.get(i+1)*100);
  }
}

void keyPressed() 
{
  if ( key == 'a' ) c.trigger();
  if ( key == 's' ) d.trigger();
  if ( key == 'd' ) e.trigger();
  if ( key == 'f' ) g.trigger();
  if ( key == 'g' ) a.trigger();
  if ( key == 'h' ) c4.trigger();
}



