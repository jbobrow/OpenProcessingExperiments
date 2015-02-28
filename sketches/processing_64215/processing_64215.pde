

float x;
float y;
float speed = 200;
int nInitFires = 50;
float spreadProb = 0.44; //.. the probability of fire

int burning = 42;
int w = 400;
int h = 400;
int controlH = 30;
int controlPanelColor = 40;
int[] state = new int[w*h];  //.. store the state of each cells

int nFiresMax = 100000;
int nFires = 0;
//.. store the positions of fires in current state
int[] fireX = new int[nFiresMax];
int[] fireY = new int[nFiresMax];

int nNewFires = 0;
//.. store the positions of fires in next state
int[] fireNewX = new int[nFiresMax];
int[] fireNewY = new int[nFiresMax];


// Controls
boolean autoPilot = true;
Slider pSlider;
Slider tSlider;
Button autoPilotBtn;



//  Setup() *****************
void setup()
{
  // .. setting up the environment
  size(w, h+controlH);
  x = width/2;
  y = height/2;
  frameRate(30);
  randomSeed(0);
  background(0);
  
  fill(0);
  noStroke();
  strokeWeight(2);
  rect(0,0,w,h);
  fill(controlPanelColor);
  rect(0,h,w,controlH);


  
  stroke(255);
  strokeWeight(1);
  smooth();
  //.. fire initialization
  for (int i = 0; i < w*h; i++)
  {
    state[i] = 0;
  }
  
  // Lightning strike; randomly pick some points for starting the fire
  // Initializing the fire in 50 points on the forest
  nFires = nInitFires; //nInitFires = 50;
  for (int i = 0; i < nInitFires; i++)
  {
    int x = int(random(0, w));
    int y = int(random(0, h));
    fireX[i] = x;
    fireY[i] = y;
    point(x,y);
  }
  
  
  drawControls();
}


// drawControls() *****************
void drawControls()
{
  int textY = h+19;
  
  // Auto Pilot Button
  autoPilotBtn = new Button(5, h + 5, 55, 20, "Auto");

  // Probability Slider
  fill(200);
  text("P:  ",73,textY);
  pSlider = new Slider(127, h+14, spreadProb, 0, 1, 50, 35);
  
  // Probability Slider
  fill(200);
  text("T:  ",195,textY);
  tSlider = new Slider(235, h+14, burning, 10, 100, 50, 22);
  tSlider.valInt = true;
  //tSlider.valFormatL = 3;
  //tSlider.valBoxWidth = 25;
}



//  draw() *****************
void draw()
{
  int offset;
  
  //drawControls();
  /*
  if (mouseX > 0)
    spreadProb = map(mouseX, 0, width, 0.3, 1);
  if (mouseY > 0)
    burning = int(map(mouseY, 0, height, 3, 100));
    */
    
  if (autoPilot)
  {
    setAutoParameters();
    pSlider.update(spreadProb);
    tSlider.update(burning);
  }
    
   
  // Fade
  fill(0, 10);
  noStroke();
  rect(0,0,w,h);


  int nf = 0;  //.. it count the number of new burning tree in each step
  
  int x;
  int y;
  for (int i = 0; i < nFires; i++)
  {
    // .. setting fire points in the forest
    x = fireX[i];
    y = fireY[i];
    offset = y * w + x;
    
    // println(x+"   "+y+"   "+state[offset]+"   "+state[offset+1]+"  "+state[offset+2]);
    // color c = pixels[x+1 + y*width];

    if(x < w-1) // In the middle of the domain
    {
      if (state[offset+1] == 0)  //.. in each step check the new cell if it is fired yet or not. If not, it check the probabilities to fire it or not.
      //if ((c & 0xFF) == 0)
      {
        if (random(1) < spreadProb)
        {
          //println("right");
          point(x+1,y);
          state[offset+1] = burning;
          fireNewX[nf] = x+1;  // Saving newly fired tree
          fireNewY[nf++] = y;
        }
        else
        {
          stroke(255, 128);
          point(x+1,y);
          stroke(255);
        }
      }
    }

    if(x > 0)
    {
      if (state[offset-1] == 0)
      {
        if (random(1) < spreadProb)
        {
          point(x-1,y);
          state[offset-1] = burning;
          fireNewX[nf] = x-1;
          fireNewY[nf++] = y;
          //nNewFires++;
        }
        else
        {
          stroke(255, 128);
          point(x-1,y);
          stroke(255);
        }

      }
    }

    if (y < h-1)
    {
      if (state[offset+w] == 0)
      {
        if (random(1) < spreadProb)
        {
          point(x,y+1);
          state[offset+w] = burning;
          fireNewX[nf] = x;
          fireNewY[nf++] = y+1;
          //nNewFires++;
        }
        else
        {
          stroke(255, 128);
          point(x,y+1);
          stroke(255);
        }

      }
    }

    if (y > 0)
    {
      if (state[offset-w] == 0)
      {
        if (random(1) < spreadProb)
        {
          point(x,y-1);
          state[offset-w] = burning;
          fireNewX[nf] = x;
          fireNewY[nf++] = y-1;
          //nNewFires++;
        }
        else
        {
          stroke(255, 128);
          point(x,y-1);
          stroke(255);
        }

      }
    }

  }
  
  if (mousePressed == true && mouseX >= 0 && mouseX < w && mouseY >= 0 && mouseY < h)
  {
    println("mouse pressed over display");
    point(mouseX, mouseY);
    offset = mouseX * w + mouseY;
    if (state[offset] != burning)
    {
      state[offset] = burning;
      fireNewX[nf] = mouseX;
      fireNewY[nf++] = mouseY;
    }
  }
  

  //println("fireNew  "+fireNewX.length);
  //updatePixels();
  nFires = nf;
  arraycopy(fireNewX, 0, fireX, 0, nFires);
  arraycopy(fireNewY, 0, fireY, 0, nFires); 
  for (int i = 0; i < w*h; i++)
  {
    if (state[i] > 0)
      state[i] -= 1;
  }
  

  
}


// setAutoParameters ***************
void setAutoParameters()
{
  float maxFrac = 0.02;
  float maxNum = maxFrac * w * h;
  
  // in the case that all trees burnt, 
  // algorithm will decide to burn some random tree in the forest
  if (nFires == 0)
  {
    nFires = nInitFires;
    for (int i = 0; i < nInitFires; i++)
    {
      int x = int(random(0, w));
      int y = int(random(0, h));
      fireX[i] = x;
      fireY[i] = y;
      point(x,y);
    }

  }

  // in this case, algorithm increase the spreadProb and decrease the burning duration
  if (nFires < 20  || random(1) < 0.004)
  {
    spreadProb = random(0.52, 0.65);
    burning = 10;
  }
  //else if (nFires < 200)
  //  spreadProb = .47;
  else if (nFires > maxNum || random(1) < 0.002) //.. algorithm increase the burning duration and 
  {
    burning = 99;
    spreadProb = .55;
  }
  else if (random(1) < 0.003)
  {
    burning = int(random(20,60));
    spreadProb = random(0.45,0.7);
  }
}






void mousePressed()
{
  if (autoPilotBtn.mouseOver() == true)
  {
    println("mouse click auto before "+ autoPilotBtn.state+" "+ autoPilot);
    autoPilotBtn.toggle();
    autoPilot = !autoPilot;
        println("mouse click auto new "+ autoPilotBtn.state +" "+ autoPilot);
  }
  

  if (pSlider.mouseOver() == true)
  {
    spreadProb = pSlider.setSlider();
    autoPilot = false;
    autoPilotBtn.setOff();
  }
  
  if (tSlider.mouseOver() == true)
  {
    burning = int(tSlider.setSlider());
    autoPilot = false;
    autoPilotBtn.setOff();
  }
}



void mouseDragged()
{
  if (pSlider.mouseOver() == true)
  {
    spreadProb = pSlider.setSlider();
    autoPilot = false;
    autoPilotBtn.setOff();
  }
  
  if (tSlider.mouseOver() == true)
  {
    burning = int(tSlider.setSlider());
    autoPilot = false;
    autoPilotBtn.setOff();
  }
}


//
// ************************************************************ slider class ***************
//
class Slider {
  int x0;
  int y0;
  int length = 80;
  int thickness = 4;
  float min;
  float max;
  float val;
  int valFormatL = 0;
  int valFormatR = 2;
  boolean valInt = false;
  int x;
  int sliderX;
  int sliderDX = 5;
  int sliderDY = 10;
  boolean displayVal = true;
  int valBoxWidth = 35;
  

  
  Slider(int x0v, int y0v, float initVal, float minV, float maxV, int bl, int vl)
  {
    x0 = x0v;
    y0 = y0v;
    val = initVal;
    min = minV;
    max = maxV;
    length = bl;
    valBoxWidth = vl;
    
   if (displayVal == false)
     valBoxWidth = 0;
      
    update(val);
    /*if (displayVal == true)
      renderValue();
    renderBar();
    renderSlider();
    */
  }
  
  
  
  void renderValue()
  {
    fill(255);
    if (valInt == true)
      text(nf(int(val),valFormatL),x0 - valBoxWidth, y0+5);   
    else 
      text(nf(val,valFormatL,valFormatR),x0 - valBoxWidth, y0+5);
  }

  void renderBar()
  {
    fill(130);
    stroke(160);
    rect(x0, y0-thickness/2, length, thickness);
    fill(100,240,240);
    stroke(160);
    rect(x0, y0-thickness/2, sliderX-x0, thickness);

  }
  
  float setSlider()
  {
    update((mouseX - x0) / float(length) * (max - min) + min);
    return val;
  }
  
  void setSliderX()
  {
    if (val > max)
      sliderX = x0 + length;
    else if (val < min)
      sliderX = x0;
    else
      sliderX = int((val - min) / (max - min) * length + x0);
  }

  
  void renderSlider()
  {
    fill(180);
    stroke(230);
    rect(sliderX - sliderDX * 0.5, y0 - sliderDY * 0.5, sliderDX, sliderDY);
  }
  
  void update(float v)
  {
    val = v;
    
    fill(controlPanelColor);
    noStroke();
    rect(x0-sliderDX * 0.5 -valBoxWidth, y0 - sliderDY * 0.5, length +sliderDX+ valBoxWidth, sliderDY+1);
    setSliderX();
    renderValue();
    renderBar();
    renderSlider();
  }
  
  boolean mouseOver()
  {
    boolean test = false;
    if (mouseX >= x0 && mouseX < x0 + length && mouseY >= y0 - sliderDY * 0.5 && mouseY < y0 + sliderDY * 0.5)
      test = true;
    return test;
  }
}
  

   
class Button {
  int x0;
  int y0;
  int width;
  int height;
  String txt;
  boolean state = true;
  
  Button(int x0v, int y0v, int bw, int bh, String txtv)
  {
    x0 = x0v;
    y0 = y0v;
    width = bw;
    height = bh;
    txt = txtv;
    
    renderButton();
  }
  
  void renderButton()
  {
    fill(30);
    stroke(60);
    rect(x0, y0, width, height);
    
    PFont font;
    font = loadFont("SegoeUI-Light-11.vlw");
    textFont(font);
    fill(200);
    text(txt,x0+5,y0+height-5);
    
    renderOn();
  }
  
  void toggle()
  {
    if (state == true)
    {
      state = false;
      renderOff();
    }
    else
    {
      state = true;
      renderOn();
    }
  }
  
  void setOn()
  {
    state = true;
    renderOn();
  }
  
  void setOff()
  {
    state = false;
    renderOff();
  }
  
  void renderOn()
  {
    fill(0,255,0);
    stroke(128,255,128);
    ellipse(x0 + width - height/2,y0 + height/2,8,8);
  }
 
  void renderOff()
  {
    fill(255,0,0);
    stroke(255,128,128);
    ellipse(x0 + width - height/2,y0 + height/2,8,8);
  }
  
 
  boolean mouseOver()
  {
    boolean test = false;
    if (mouseX >= x0 && mouseX < x0 + width && mouseY >= y0  && mouseY < y0 + height)
      test = true;
    return test;
  }
}
  

    

 



