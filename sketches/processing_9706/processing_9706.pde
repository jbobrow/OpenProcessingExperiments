
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;

SineWave[] sine = new SineWave[16];
float[] freq = new float[16];
float[] amp = new float[16];

String[] num = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16" };
String[] letter = { "W", "E", "T", "Y", "U", "A", "S", "D", "F", "G", "H", "J", "K" };

float c = 261.63;
float cs = 277.18;
float d = 293.66;
float ds = 311.13;
float e = 329.63;
float f = 349.23;
float fs = 369.99;
float g = 392.00;
float gs = 415.30;
float a = 440.00;
float as = 466.16;
float b = 493.88;
float cc = 523.25;

float octave = 1;

void setup()
{
  size(660, 320, P2D);
  background(0, 0, 96);
  smooth();
  
  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO);
  textFont(loadFont("Helvetica-Bold-16.vlw"));
 
  //Oscillators
  for(int i = 0; i < 16; i++)
  {
    amp[i] = .1 / (i + 1);
    sine[i] = new SineWave(freq[i], amp[i], 44100);
    out.addSignal(sine[i]);
  }
  
  //Display
  fill(0, 0, 255);
  text("HARMONICS", 15, 160);
  text("KEYBOARD", 170, 305);
  text("TRANSPOSE", 15, 305);
  
  for(int i = 0; i < 9; i++)
  {
    text(num[i], 25 + 40 * i, 140);
  }
  for(int i = 9; i < 16; i++)
  {
    text(num[i], 20 + 40 * i, 140);
  }
  
  text("-24", 20, 225);
  text("-12", 40, 205);
  text("0", 80, 195);
  text("+12", 100, 205);
  text("+24", 120, 225);
  
  stroke(0, 0, 255);
  strokeWeight(2);
  line(122, 300, 155, 300);
  line(270, 300, 640, 300);
  line(120, 155, 640, 155);
  noStroke();
  
  fill(0, 0, 32);
  ellipse(85, 245, 60, 60);
  fill(0, 0, 255);
  ellipse(85, 228, 15, 15);
  noSmooth();
  
  fill(0, 0, 32);
  rect(210, 170, 50, 50);
  rect(270, 170, 50, 50);
  rect(390, 170, 50, 50);
  rect(450, 170, 50, 50);
  rect(510, 170, 50, 50);
  for(int x = 170; x <= 590; x = x + 60)
  {
    rect(x, 230, 50, 50);
  }
  smooth();
  fill(0, 0, 255);
  text("W", 230, 200);
  text("E", 290, 200);
  text("T", 410, 200);
  text("Y", 470, 200);
  text("U", 530, 200);
  for(int i = 5; i < 13; i++)
  {
    text(letter[i], 190 + (i - 5) * 60, 260);
  } 
  noSmooth();
}

//AMPLITUDE

void draw()
{
  for(int i = 0; i < 16; i++)
  {
    if(mouseX >= 20 + i * 40 && mouseX < 40 + i * 40 && mouseY >= 20 && mouseY < 120)
    {
      amp[i] = map(119 - mouseY, 0, 100, 0.0, 0.1);
      sine[i].setAmp(amp[i]);
    }
  }
  
  fill(0, 0, 32);
  
  for(int x = 20; x <= 620; x = x + 40)
  {
    rect(x, 20, 20, 100);
  }
  
  fill(0, 0, 255);
  
  for(int i = 0; i < 16; i++)
  {
    rect(20 + i * 40, 120 - map(amp[i], 0.0, 0.1, 0, 100), 20, map(amp[i], 0.0, 0.1, 0, 100));
  }
}

//TRANSPOSE
  
void mousePressed()
{
  smooth();
    
  //-24
  if(mouseX >= 20 && mouseX <= 45 && mouseY >= 215 && mouseY <= 230)
  {
    octave = .25;  
    fill(0, 0, 32);
    ellipse(85, 245, 60, 60);
    fill(0, 0, 255);
    ellipse(69, 238, 15, 15);
  }
    
  //-12
  if(mouseX >= 40 && mouseX <= 65 && mouseY >= 190 && mouseY <= 210)
  {
    octave = .5;
    fill(0, 0, 32);
    ellipse(85, 245, 60, 60);
    fill(0, 0, 255);
    ellipse(75, 230, 15, 15);
  }
    
  //0
  if(mouseX >= 80 && mouseX <= 95 && mouseY >= 180 && mouseY <= 200)
  {
    octave = 1;
    fill(0, 0, 32);
    ellipse(85, 245, 60, 60);
    fill(0, 0, 255);
    ellipse(85, 228, 15, 15);
  }
    
  //+12
  if(mouseX >= 100 && mouseX <= 130 && mouseY >= 190 && mouseY <= 210)
  {
    octave = 2;
    fill(0, 0, 32);
    ellipse(85, 245, 60, 60);
    fill(0, 0, 255);
    ellipse(95, 230, 15, 15);
  }
    
  //+24  
  if(mouseX >= 120 && mouseX <= 150 && mouseY >= 215 && mouseY <= 230)
  {
    octave = 4;
    fill(0, 0, 32);
    ellipse(85, 245, 60, 60);
    fill(0, 0, 255);
    ellipse(101, 238, 15, 15);
  }  
  
  noSmooth(); 
}
  
//FREQUENCY

void keyPressed()
{
  fill(0, 0, 32);
  rect(210, 170, 50, 50);
  rect(270, 170, 50, 50);
  rect(390, 170, 50, 50);
  rect(450, 170, 50, 50);
  rect(510, 170, 50, 50);
  for(int x = 170; x <= 590; x = x + 60)
  {
    rect(x, 230, 50, 50);
  }
  
  smooth();
  fill(0, 0, 255);
  text("W", 230, 200);
  text("E", 290, 200);
  text("T", 410, 200);
  text("Y", 470, 200);
  text("U", 530, 200); 
  for(int i = 5; i < 13; i++)
  {
    text(letter[i], 190 + (i - 5) * 60, 260);
  } 
  noSmooth();
  
  //c
  if(key == 'a')
  {
    for(int i = 0; i < 16; i++)
    {
      freq[i] = c * (i + 1) * octave;
      sine[i].setFreq(freq[i]);
      sine[i].setAmp(amp[i]);
    }
    
    fill(0, 0, 255);
    rect(170, 230, 50, 50);
  }
  
  //c#
  else if(key == 'w')
  {
    for(int i = 0; i < 16; i++)
    {
      freq[i] = cs * (i + 1) * octave;
      sine[i].setFreq(freq[i]);
      sine[i].setAmp(amp[i]);
    }
    
    fill(0, 0, 255);
    rect(210, 170, 50, 50);
  }

  //d
  else if(key == 's')
  {
    for(int i = 0; i < 16; i++)
    {
      freq[i] = d * (i + 1) * octave;
      sine[i].setFreq(freq[i]);
      sine[i].setAmp(amp[i]);
    }
    
    fill(0, 0, 255);
    rect(230, 230, 50, 50);
  }
  
  //d#
  else if(key == 'e')
  {
    for(int i = 0; i < 16; i++)
    {
      freq[i] = ds * (i + 1) * octave;
      sine[i].setFreq(freq[i]);
      sine[i].setAmp(amp[i]);
    }
    
    fill(0, 0, 255);
    rect(270, 170, 50, 50);
  }
  
  //e
  else if(key == 'd')
  {
    for(int i = 0; i < 16; i++)
    {
      freq[i] = e * (i + 1) * octave;
      sine[i].setFreq(freq[i]);
      sine[i].setAmp(amp[i]);
    }
    
    fill(0, 0, 255);
    rect(290, 230, 50, 50);
  }
  
  //f
  else if(key == 'f')
  {
    for(int i = 0; i < 16; i++)
    {
      freq[i] = f * (i + 1) * octave;
      sine[i].setFreq(freq[i]);
      sine[i].setAmp(amp[i]);
    }
    
    fill(0, 0, 255);
    rect(350, 230, 50, 50);
  }
  
  //f#
  else if(key == 't')
  {
    for(int i = 0; i < 16; i++)
    {
      freq[i] = fs * (i + 1) * octave;
      sine[i].setFreq(freq[i]);
      sine[i].setAmp(amp[i]);
    }
    
    fill(0, 0, 255);
    rect(390, 170, 50, 50);
  }
  
  //g
  else if(key == 'g')
  {
    for(int i = 0; i < 16; i++)
    {
      freq[i] = g * (i + 1) * octave;
      sine[i].setFreq(freq[i]);
      sine[i].setAmp(amp[i]);
    }
    
    fill(0, 0, 255);
    rect(410, 230, 50, 50);
  }

  //g#
  else if(key == 'y')
  {
    for(int i = 0; i < 16; i++)
    {
      freq[i] = gs * (i + 1) * octave;
      sine[i].setFreq(freq[i]);
      sine[i].setAmp(amp[i]);
    }
    
    fill(0, 0, 255);
    rect(450, 170, 50, 50);
  }
  
  //a
  else if(key == 'h')
  {
    for(int i = 0; i < 16; i++)
    {
      freq[i] = a * (i + 1) * octave;
      sine[i].setFreq(freq[i]);
      sine[i].setAmp(amp[i]);
    }
    
    fill(0, 0, 255);
    rect(470, 230, 50, 50);
  }
  
  //a#
  else if(key == 'u')
  {
    for(int i = 0; i < 16; i++)
    {
      freq[i] = as * (i + 1) * octave;
      sine[i].setFreq(freq[i]);
      sine[i].setAmp(amp[i]);
    }
    
    fill(0, 0, 255);
    rect(510, 170, 50, 50);
  }
  
  //b
  else if(key == 'j')
  {
    for(int i = 0; i < 16; i++)
    {
      freq[i] = b * (i + 1) * octave;
      sine[i].setFreq(freq[i]);
      sine[i].setAmp(amp[i]);
    }
    
    fill(0, 0, 255);
    rect(530, 230, 50, 50);
  }
  
  //high c
  else if(key == 'k')
  {
    for(int i = 0; i < 16; i++)
    {
      freq[i] = cc * (i + 1) * octave;
      sine[i].setFreq(freq[i]);
      sine[i].setAmp(amp[i]);
    }
    
    fill(0, 0, 255);
    rect(590, 230, 50, 50);
  }
}

void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}

