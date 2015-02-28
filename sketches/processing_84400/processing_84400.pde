

import processing.serial.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
FFT fftLin;
Minim minim;
AudioInput in;

static int wX0 = 30;
static int wX1 = 390;
static int wY0 = 70;
static int wY1 = 70;
static int buf = 1;

String[] step_char = { 
  "64", "128", "256", "512", "1K", "2K", "4K", "8K"
};
int[] step_freq = {
  32, 128, 256, 512, 1024, 2048, 4096, 8192
};
int[] step_scale = {
  1, 1, 2, 3, 8, 12, 16, 30
};
int[] step_val = {
  0, 0, 0, 0, 0, 0, 0, 0
};
int step_len = 0;
int step_slider = 166;
int[] step_buf = {
  0, 0, 0, 0, 0, 0, 0, 0
};


char[] out_char = { 
  'W', 'R', 'G', 'B'
};
int[] out_fill = { 
  200, 200, 220, 140, 110, 110, 110, 140, 110, 110, 110, 140
};
int[] out_val = {
  0, 0, 0, 0
};
int[] out_select = {
  1, 2, 4, 6
};
int[] out_slider = {
  25, 50, 100, 200
};


Serial port; // The serial port we will be using

void setup()
{
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  size(720, 310);
  println(Serial.list()); // List COM-ports available
  //select com-port from the list (COM3 for my device)
  // You will want to change the [1] to select second option
  // Remember the list starts at [0] for the first option.
  port = new Serial(this, Serial.list()[0], 57600);
  update(0, 'X');
}

void draw()
{
  if (port.available() > 0) {
    print( char(port.read()));
  }

  background(250, 250, 255);

  fftLin = new FFT( in.bufferSize(), in.sampleRate() );
  fftLin.forward(in.mix);
  //fftLog = new FFT( in.bufferSize(), in.sampleRate() );
  //fftLog.forward(in.mix);

  // TEXT HEADERS
  fill(0, 150);
  textSize(30);
  text("Visualizer", wX0, wY0-15);
  text("Output", wX1, wY1-15);
  textSize(10);
  // RED SLIDER
  stroke(255, 0, 0,150);
  line(wX0+step_slider+25, wY0, wX0+step_slider+25, wY0+200);
  text((100*step_slider/255) + "%", wX0+/*step_slider*/+30+225, wY0+200);
  // x0 <-> x10
  stroke(0);
  for (int i=0; i<4; i++)
  {
    line(wX1+out_slider[i]+25, wY1 +(i*50), wX1+out_slider[i]+25, wY1 +32+(i*50));
    text("x" + out_slider[i]/25, wX1+out_slider[i]+30, wY1 +32+(i*50));
  }
  noStroke();


  //MOUSE
  //Select visualiser window
  if (range(mouseX, wX0+15, wX0+290, mouseY, wY0, wY0+200)) {
    {
      //Drag sliders
      if (mousePressed) {
        if (mouseX < wX0+280)
          step_slider = mouseX -wX0-25;
        if (mouseX > wX0+280)
          step_slider = 255;
        if (mouseX < wX0+25)
          step_slider = 0;
      }
    }
  }
  //Select Output window
  if (range(mouseX, wX1+15, wX1+290, mouseY, wY1, wY1+32+200));
  {
    //Drag sliders
    if (mousePressed) {
      for (int i=0; i<4; i++) {
        if (range(mouseY, wY1+i*50, wY1+32+i*50)) {
          if (mouseX > wX1+280)
            out_slider[i] = 255;
          if (mouseX < wX1+280 & mouseX > wX1+25)
            out_slider[i] = mouseX -wX1-25;
          if (mouseX < wX1+25) {
            out_select[i] += 1;
            out_select[i] = out_select[i]%8;
            delay (100);
          }
        }
      }
    }
  }


  //AUTO
  //int e = bufcount(step_buf);
  //if  (e>2 & step_slider < 99)
    //step_slider  += 5;
  //if  (e<2 & step_slider > 3)
    //step_slider -= 5;

  // STEP ANALYSIS 

  for (int i=0; i<8; i++)
  {
    fill(200, 100);
    step_val[i] = int(fftLin.getFreq(step_freq[i]));
    step_len = step_val[i]*step_scale[i];
    if (step_len > step_slider)
    {
      if (step_buf[i] == 0)
        step_buf[i] = buf;
      if (step_len > 255)
        step_len = 255;
    }
    else
      if (step_buf[i]>0)
        step_buf[i] -= 1;

    // BAR COLOR
    if (step_buf[i]>0)
    {
      fill(255, 0, 0, 255-30*bufcount(step_buf));
    }


    rect(wX0, wY0+i*25, 25 + step_len, 16);
    fill(0);
    text(step_char[i], wX0+4, wY0+12+i*25);
  }

  //CHANNEL SETTINGS
  for (int i=0; i<4; i++) {
    out_val[i] = step_val[out_select[i]]*out_slider[i]/25;
  }


  //W
  if (out_val[0] < 70)
    out_val[0] = 0;
  if (out_val[0] > 70)
    out_val[0] -= 70;

  //R
  if (out_val[1]>100)
    if (out_val[1] < 50)
      out_val[1] = 0;

  //G  
  if (out_val[2] > 100)
    out_val[2] = 255;
  if (out_val[2] < 50)
    out_val[2] = 0;

  //B  
  if (out_val[3] > 200)
    out_val[3] = 255;
  if (out_val[3] < 25)
    out_val[3] = 0;


  // CHANNEL ANALYSIS

  for (int i=0; i<4; i++)
  {
    if (out_val[i]> 255)
      out_val[i] = 255;
    fill(out_fill[i*3], out_fill[i*3+1], out_fill[i*3+2], 50);  
    rect(wX1, wY1+i*50, 25 + out_val[i], 32);
    fill(0, 150);

    text(out_char[i], wX1+4, wY1+14+i*50);
    text(step_char[out_select[i]], wX1+4, wY1+28+i*50);
    update(out_val[i], out_char[i]);
  }
}


//FUNCTIONS

int bufcount(int[] x)
{
  int count = 0;
  for (int i=0; i<8;i++)
  {
    if (x[i]>0)
      count++;
  }
  return count;
}


void update(int x, char y)
{
  if (x>255)
    x=255;
  port.write(x+""+char(y));
}

boolean range (int x, int x_min, int x_max)
{
  return x > x_min && x < x_max;
}

boolean range (int x, int x_min, int x_max, int y, int y_min, int y_max)
{
  return x > x_min && x < x_max && y > y_min && y < y_max;
}



