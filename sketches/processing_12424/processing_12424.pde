
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
FFT fft;
int BTune=40; //background tune
int RTune=4; //Rate Tune for spec size
PShape dys;
void setup()
{
size(600,480,P3D);
background(0);
noCursor();
frameRate(12);
minim = new Minim(this);
jingle = minim.loadFile("06 Weber.wav", 512);
jingle.loop();
fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
dys = loadShape("dys.svg");
key='q';

}

void draw(){


  if(key=='q'){
    colorMode(HSB,width,width,height);
background(width-mouseX,mouseY-mouseX,height-mouseY);
//colorMode(RGB,255,255,255);
stroke(255);

// perform a forward FFT on the samples in jingle's left buffer
// note that if jingle were a MONO file, 
// this would be the same as using jingle.right or jingle.left
fft.forward(jingle.mix);
for(int i = 0; i < fft.specSize(); i++)
{
// draw the line for frequency band i, scaling it by 4 so we can see it a bit better
strokeWeight(random(0,mouseY/30)+ fft.getBand(i));
//stroke(i+random(-50,50),255-i+random(-50,50),255-i+random(-50,50));
//stroke(fft.getBand(i)*20,512-fft.getBand(i)*100,255-fft.getBand(i)*100+i*random(-1,1)); 
stroke(fft.getBand(i)*20*(mouseX),width,mouseY-fft.getBand(i)*100+i*random(-4,4));    //  Saturation mouseX-fft.getBand(i)*100
line(i+width/2 + random(-width/20,width/20), height/2 + random(-mouseX/2+i/2.5,mouseX/2-i/2.5), i*2+width/2, height/2 - fft.getBand(i)*100);
line(width/2-i + random(-width/20,width/20), height/2 + random(-mouseX/2+i/2.5,mouseX/2-i/2.5), width/2-i*2, height/2 - fft.getBand(i)*100);
line(i+width/2 + random(-width/20,width/20), height/2 + random(-mouseX/2+i/2.5,mouseX/2-i/2.5), i*2+width/2, height/2 + fft.getBand(i)*100);
line(width/2-i + random(-width/20,width/20), height/2 + random(-mouseX/2+i/2.5,mouseX/2-i/2.5), width/2-i*2, height/2 + fft.getBand(i)*100);
//line(i, height, i*2, height - fft.getBand(i)*40);
}
  }
if(key=='w'){
    colorMode(HSB,width,width,height);
background(random(0,width),width,height);
//background(width-mouseX,mouseY-mouseX,height-mouseY);
//colorMode(RGB,255,255,255);
stroke(255);

fft.forward(jingle.mix);
for(int i = 0; i < fft.specSize(); i++)
{
// draw the line for frequency band i, scaling it by 4 so we can see it a bit better
strokeWeight(1+random(0,mouseY/30)+ fft.getBand(i));
//stroke(i+random(-50,50),255-i+random(-50,50),255-i+random(-50,50));
//stroke(fft.getBand(i)*20,512-fft.getBand(i)*100,255-fft.getBand(i)*100+i*random(-1,1)); 
stroke(fft.getBand(i)*20*(mouseX),width,mouseY-fft.getBand(i)*100+i*random(-4,4));    //  Saturation mouseX-fft.getBand(i)*100
line(i+width/2 + random(-width/20,width/20), height/2 + random(-mouseX/2+i/2.5,mouseX/2-i/2.5), i*2+width/2, height/2 - fft.getBand(i)*100);
line(width/2-i + random(-width/20,width/20), height/2 + random(-mouseX/2+i/2.5,mouseX/2-i/2.5), width/2-i*2, height/2 - fft.getBand(i)*100);
line(i+width/2 + random(-width/20,width/20), height/2 + random(-mouseX/2+i/2.5,mouseX/2-i/2.5), i*2+width/2, height/2 + fft.getBand(i)*100);
line(width/2-i + random(-width/20,width/20), height/2 + random(-mouseX/2+i/2.5,mouseX/2-i/2.5), width/2-i*2, height/2 + fft.getBand(i)*100);
//line(i, height, i*2, height - fft.getBand(i)*40);
}
}
if(key=='e'){
  
    colorMode(HSB,width,width,height);
background(0);
//background(width-mouseX,mouseY-mouseX,height-mouseY);
//colorMode(RGB,255,255,255);
stroke(255);

fft.forward(jingle.mix);
for(int i = 0; i < fft.specSize(); i++)
{
// draw the line for frequency band i, scaling it by 4 so we can see it a bit better
strokeWeight(1+random(0,mouseY/30)+ fft.getBand(i));
//stroke(i+random(-50,50),255-i+random(-50,50),255-i+random(-50,50));
//stroke(fft.getBand(i)*20,512-fft.getBand(i)*100,255-fft.getBand(i)*100+i*random(-1,1)); 
stroke(fft.getBand(i)*20*(mouseX),width,mouseY-fft.getBand(i)*100+i*random(-4,4));    //  Saturation mouseX-fft.getBand(i)*100
line(i+width/2 + random(-width/20,width/20), height/2 + random(-mouseX/2+i/2.5,mouseX/2-i/2.5), i*2+width/2, height/2 - fft.getBand(i)*100);
line(width/2-i + random(-width/20,width/20), height/2 + random(-mouseX/2+i/2.5,mouseX/2-i/2.5), width/2-i*2, height/2 - fft.getBand(i)*100);
line(i+width/2 + random(-width/20,width/20), height/2 + random(-mouseX/2+i/2.5,mouseX/2-i/2.5), i*2+width/2, height/2 + fft.getBand(i)*100);
line(width/2-i + random(-width/20,width/20), height/2 + random(-mouseX/2+i/2.5,mouseX/2-i/2.5), width/2-i*2, height/2 + fft.getBand(i)*100);
//line(i, height, i*2, height - fft.getBand(i)*40);
}
  
}
if(key=='r'){
 
    colorMode(HSB,width,width,height);


fft.forward(jingle.mix);
for(int i = 0; i < fft.specSize(); i++)
{
// draw the line for frequency band i, scaling it by 4 so we can see it a bit better
strokeWeight(1+random(0,mouseY/30)+ fft.getBand(i));
//stroke(i+random(-50,50),255-i+random(-50,50),255-i+random(-50,50));
//stroke(fft.getBand(i)*20,512-fft.getBand(i)*100,255-fft.getBand(i)*100+i*random(-1,1)); 
stroke(fft.getBand(i)*20*(mouseX),width,mouseY-fft.getBand(i)*100+i*random(-4,4));    //  Saturation mouseX-fft.getBand(i)*100
line(i+width/2 + random(-width/20,width/20), height/2 + random(-mouseX/2+i/2.5,mouseX/2-i/2.5), i*2+width/2, height/2 - fft.getBand(i)*100);
line(width/2-i + random(-width/20,width/20), height/2 + random(-mouseX/2+i/2.5,mouseX/2-i/2.5), width/2-i*2, height/2 - fft.getBand(i)*100);
line(i+width/2 + random(-width/20,width/20), height/2 + random(-mouseX/2+i/2.5,mouseX/2-i/2.5), i*2+width/2, height/2 + fft.getBand(i)*100);
line(width/2-i + random(-width/20,width/20), height/2 + random(-mouseX/2+i/2.5,mouseX/2-i/2.5), width/2-i*2, height/2 + fft.getBand(i)*100);
//line(i, height, i*2, height - fft.getBand(i)*40);
}
}
if(key=='t'){
  colorMode(RGB,width,width,height);
background(width-mouseX,mouseY-mouseX,height-mouseY);
colorMode(RGB,255,255,255);
stroke(255);

// perform a forward FFT on the samples in jingle's left buffer
// note that if jingle were a MONO file, 
// this would be the same as using jingle.right or jingle.left
fft.forward(jingle.mix);
for(int i = 0; i < fft.specSize(); i++)
{
// draw the line for frequency band i, scaling it by 4 so we can see it a bit better
strokeWeight(random(0,mouseX/50)+ fft.getBand(i));
//stroke(i+random(-50,50),255-i+random(-50,50),255-i+random(-50,50));
stroke(fft.getBand(i)*20,512-fft.getBand(i)*100,255-fft.getBand(i)*100+i*random(-1,1));
stroke(fft.getBand(i)*20,mouseX-fft.getBand(i)*100,mouseY-fft.getBand(i)*100+i*random(-1,1));
line(i+width/2 + random(-width/20,width/20), height/2 + random(-width/5+i/2.5,width/5-i/2.5), i*2+width/2, height/2 - fft.getBand(i)*100);
line(width/2-i + random(-width/20,width/20), height/2 + random(-width/5+i/2.5,width/5-i/2.5), width/2-i*2, height/2 - fft.getBand(i)*100);
line(i+width/2 + random(-width/20,width/20), height/2 + random(-width/5+i/2.5,width/5-i/2.5), i*2+width/2, height/2 + fft.getBand(i)*100);
line(width/2-i + random(-width/20,width/20), height/2 + random(-width/5+i/2.5,width/5-i/2.5), width/2-i*2, height/2 + fft.getBand(i)*100);
//line(i, height, i*2, height - fft.getBand(i)*40);
}
}
if(key=='y'){
  background(0);
  colorMode(RGB,255,255,255);
   fft.forward(jingle.mix);
  for(int i = 0; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
    strokeWeight(3+i/40);
      //stroke(i+random(-50,50),255-i+random(-50,50),255-i+random(-50,50));
      stroke(fft.getBand(i)*100,512-fft.getBand(i)*100,255-fft.getBand(i)*100+i*random(-1,1));
    stroke(fft.getBand(i)*100,mouseX-fft.getBand(i)*100,mouseY-fft.getBand(i)*100+i*random(-1,1));
   line(2*i+width/2, height/2, i*4+width/2, height/2 - fft.getBand(i)*100);
    line(width/2-2*i, height/2, width/2-i*4, height/2 - fft.getBand(i)*100);
     line(i*2+width/2, height/2, i*4+width/2,  height/2 + fft.getBand(i)*100);
    line(width/2-2*i, height/2, width/2-i*4,  height/2 + fft.getBand(i)*100);
     //line(i, height, i*2, height - fft.getBand(i)*40);
  }
}
if(key=='u'){
   background(0);
  stroke(255);
  colorMode(HSB,width,height,255);
  fill (mouseX+random(-width/4,width/4),mouseY,255 );
  // perform a forward FFT on the samples in jingle's left buffer
  // note that if jingle were a MONO file, 
  // this would be the same as using jingle.right or jingle.left
  fft.forward(jingle.mix);
  for(int i = 0; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
    strokeWeight(3+i/40);
      //stroke(i+random(-50,50),255-i+random(-50,50),255-i+random(-50,50));
     // stroke(fft.getBand(i)*100,512-fft.getBand(i)*100,255-fft.getBand(i)*100+i*random(-1,1));
    stroke(fft.getBand(i)*100,mouseX-fft.getBand(i)*100,mouseY-fft.getBand(i)*100+i*random(-1,1));
  
   rect(width/2+20*i, height/2, width/2+10+i,  fft.getBand(i)*20);
    rect(width/2+20*i, height/2, width/2+10+i,  -fft.getBand(i)*20);
     rect(width/2-20*i, height/2, width/2+10-i,  fft.getBand(i)*20);
      rect(width/2-20*i, height/2, width/2+10-i,  -fft.getBand(i)*20);
  }
}
if(key=='i'){
  background(0);
  stroke(255);

  // perform a forward FFT on the samples in jingle's left buffer
  // note that if jingle were a MONO file, 
  // this would be the same as using jingle.right or jingle.left
  fft.forward(jingle.mix);
  for(int i = 0; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
    strokeWeight(6+fft.getBand(i)*(i/4));
      //stroke(i+random(-50,50),255-i+random(-50,50),255-i+random(-50,50));
      //stroke(fft.getBand(i)*100,512-fft.getBand(i)*100,255-fft.getBand(i)*100+i*random(-1,1));
    colorMode(HSB,width,255,255);
    stroke(mouseX-fft.getBand(i)*random(-100,100),255,155+fft.getBand(i)*100);
    //stroke(fft.getBand(i)*100,mouseX-fft.getBand(i)*100,mouseY-fft.getBand(i)*100+i*random(-1,1));
   line(2*i+mouseX, mouseY, i*4+mouseX, mouseY - fft.getBand(i)*100);
    line(mouseX-i*2, mouseY, mouseX-i*4, mouseY - fft.getBand(i)*100);
     line(2*i+mouseX, mouseY, i*4+mouseX,  mouseY + fft.getBand(i)*100);
    line(mouseX-i*2, mouseY, mouseX-i*4,  mouseY + fft.getBand(i)*100);
     //line(i, height, i*2, height - fft.getBand(i)*40);
  }
}
if(key=='o'){
  background(0);
  stroke(255);

  // perform a forward FFT on the samples in jingle's left buffer
  // note that if jingle were a MONO file, 
  // this would be the same as using jingle.right or jingle.left
  fft.forward(jingle.mix);
  for(int i = 0; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
    strokeWeight(6);
      //stroke(i+random(-50,50),255-i+random(-50,50),255-i+random(-50,50));
      //stroke(fft.getBand(i)*100,512-fft.getBand(i)*100,255-fft.getBand(i)*100+i*random(-1,1));
    colorMode(HSB,width,255,255);
    stroke(mouseX-fft.getBand(i)*random(-100,100),255,155+fft.getBand(i)*100);
    //stroke(fft.getBand(i)*100,mouseX-fft.getBand(i)*100,mouseY-fft.getBand(i)*100+i*random(-1,1));
   line(2*i+mouseX, mouseY, i*4+mouseX, mouseY - fft.getBand(i)*100);
    line(mouseX-i*2, mouseY, mouseX-i*4, mouseY - fft.getBand(i)*100);
     line(2*i+mouseX, mouseY, i*4+mouseX,  mouseY + fft.getBand(i)*100);
    line(mouseX-i*2, mouseY, mouseX-i*4,  mouseY + fft.getBand(i)*100);
     //line(i, height, i*2, height - fft.getBand(i)*40);
  }
}
if(key=='p'){
    background(0);
  stroke(255);
noFill();
  // perform a forward FFT on the samples in jingle's left buffer
  // note that if jingle were a MONO file, 
  // this would be the same as using jingle.right or jingle.left
  fft.forward(jingle.mix);
  for(int i = 0; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
    strokeWeight(3+i/40);
      //stroke(i+random(-50,50),255-i+random(-50,50),255-i+random(-50,50));
      //stroke(fft.getBand(i)*100,512-fft.getBand(i)*100,255-fft.getBand(i)*100+i*random(-1,1));
    colorMode(HSB,width,255,255);
    stroke(mouseX-fft.getBand(i)*random(-100,100),255,155+fft.getBand(i)*100);
    //stroke(fft.getBand(i)*100,mouseX-fft.getBand(i)*100,mouseY-fft.getBand(i)*100+i*random(-1,1));
   rect(i+mouseX, mouseY, i*2+mouseX, mouseY - fft.getBand(i)*100);
    rect(mouseX-i, mouseY, mouseX-i*2, mouseY - fft.getBand(i)*100);
     rect(i+mouseX, mouseY, i*2+mouseX,  mouseY + fft.getBand(i)*100);
    rect(mouseX-i, mouseY, mouseX-i*2,  mouseY + fft.getBand(i)*100);
     //line(i, height, i*2, height - fft.getBand(i)*40);
  }
}
}
void stop()
{
// always close Minim audio classes when you finish with them
jingle.close();
minim.stop();

super.stop();
}





