
int hue_;
int seed;
PImage pattern;
boolean info;


/*------------------------------*/


void setup()
{
  size(630, 630, P2D);
  colorMode(HSB, 360, 100, 100);
  seed = 0;
  pattern = createImage(628, 628, RGB);
  begin();  //show instructions at the beginning 
}


/*------------------------------*/


void draw()
{  
  if (seed !=0) showPattern();
  if (info) showSeed();
}


/*------------------------------*/


void mouseReleased()
{
  newPattern();
}


/*------------------------------*/


void keyPressed()
{
  if (key == 's' || key == 'S')
  {
    save("pattern-" + seed + ".png");  //save an screenshot
  }
  else if (key == 'b' || key == 'B')
  {
    pattern.save("patternHD-" + seed + ".png");  //save an unity with bigger size and no AA
  }
  else if (key == ' ')  //show information about the pattern (noiseSeed and hue)
  {
    info = !info; 
  }
}


/*------------------------------*/


void newPattern()  
{
  hue_ = (int) random(360);
  seed = (int) random(1, 0xFFFFFF);
  noiseSeed(seed);
  fill(0);

  pattern.loadPixels();  
    float dx = 0;
    for (int x = 0; x < pattern.width; x++)
    {
      float dy = 0;
      for (int y = 0; y < pattern.height; y++)
      {
        float n = noise(abs(cos(dx)), abs(cos(dy)));
        n = map(n, 0.3, 0.6, 0, 100);
        pattern.pixels[x + y*pattern.width] = chooseColor(n);        
  
        dy += 0.005;
      }
      dx += 0.005;
    }  
  pattern.updatePixels();
}


/*------------------------------*/


void showPattern()
{ 
  for (int x = 0; x < 3; x++)
  {
    for (int y = 0; y < 3; y++)
    {           
      copy(pattern,   0, 0, pattern.width, pattern.height,   210*x, 210*y, 210, 210);  //resize the pattern and repeat it
    }
  }
}


/*------------------------------*/


color chooseColor(float n)
{
  color cor;
  if (n < 20) { cor = color(hue_, 5, 95); }
  else if (n < 40) { cor = color(hue_, 35, 90); } 
  else if (n < 60) { cor = color(hue_, 60, 80); }
  else if (n < 80) { cor = color(hue_, 65, 65); }
  else { cor = color(hue_, 75, 45); }
  return cor;
}


/*------------------------------*/


void showSeed()
{
  pushMatrix();
  translate(300, height - 100);
    
    //show background
    noStroke();
    fill(0, 140);
    rect(0, 0, 300, 75);
    
    //show headers
    fill(320);    
    text("noiseSeed:", 50, 25); 
    text("hue:", 200, 25);
    
    //show variables
    fill(360);
    text(seed, 50, 50);
    text(hue_ , 200, 50);
   
    
  popMatrix();
}


/*------------------------------*/


void begin()
{
  background(360);
  fill(0);
  textAlign(CENTER);
  
  int Ypos = 200;
  int interval = 20;
  
  text("Instructions:", width/2, Ypos);  
  text("Mouse click to generate a new pattern", width/2, Ypos + 2*interval); 
  text("Press 'space' to show/hide information about the pattern", width/2, Ypos + 3*interval);  
  text("Press 's' to save a screenshot", width/2, Ypos + 4*interval ); 
  text("Press 'b' to save one unity on bigger size and without anti aliasing", width/2, Ypos + 5*interval);  
  
  text("Click on the screen to start", width/2, Ypos + 10*interval);  
}


