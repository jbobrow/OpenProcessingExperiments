
PFont font;
int SIZE = 205;
Dot [] dots = new Dot [SIZE];
int showing = -1;

void setup()
{
  // set up window
  size(600,400);
  font = createFont("Ariel", 14, true);
  
  // read in file
  String [] stuff = loadStrings("memories2.csv");
  String [] data;
  int [] rgb;
  
  smooth();
  for (int i=0; i<dots.length; i++)
  {
    data = split(stuff[i], '\t');
    rgb = getColor(data[5]);
    dots[i] = new Dot(i, width/2, height/2, random(25), random(-1,1), random(-1,1), rgb , data[3]);
  }
  background(0);
  strokeWeight(2);
   
  noStroke();
  fill(255,75);
}

int [] getColor(String emotion)
{
  // yellow
  if (emotion.equals("happiness"))
  {
    int [] rgb = {255, 255, 0};
    return rgb;
  }
  // blue
  else if (emotion.equals("sadness"))
  {
    int [] rgb = {0, 255, 255};
    return rgb;
  }
  // red
  else if (emotion.equals("anger"))
  {
    int [] rgb = {255, 0, 0};
    return rgb;
  }
  // orange
  else if (emotion.equals("fear"))
  {
    int [] rgb = {255, 122, 0};
    return rgb;
  }
  // purple
  else if (emotion.equals("surprise"))
  {
    int [] rgb = {122, 0, 255};
    return rgb;
  }
  // green
  else if (emotion.equals("disgust"))
  {
    int [] rgb = {0, 255, 0};
    return rgb;
  }
  else
  {
    int [] rgb = {255, 255, 255};
    return rgb;
  }  
      
}

void draw()
{
  background(0);
  for (int i=0; i<dots.length; i++)
  {
    dots[i].move();
    dots[i].display();    
  }
}

class Dot
{
  int id;
  float x, y;
  float diameter;
  float vx, vy;
  int [] rgb;
  String memory;
  
  Dot(int id, float x, float y, float diameter, float vx, float vy, int[] rgb, String memory)
  {
    this.id = id;
    this.x = x;
    this.y = y; 
    this.diameter = diameter;
    this.vx = vx;
    this.vy = vy;
    this.rgb = rgb;
    this.memory = memory;
  }
  
  void showText()
  {
    textFont(font);
    fill(255, 255);
    float w = textWidth(memory);
    if (x > width-w)
    {
      textAlign(RIGHT);
      text(memory, x, y);
    } 
    else
    {
      textAlign(LEFT);
      text(memory, x, y);
    }
  }
  
  void move()
  {
    float dist = sqrt(sq(mouseX-x)+sq(mouseY-y));
    if(dist < diameter)
    {
      if(showing == id)
      {
        showText();
        return;
      }
      else if(showing == -1)
      {
        showing = id;
        showText();
        return;
      }
    }
    if(showing == id)
    {
      showing = -1;
    }
    if((y>height) || (y<0 ))
    {
      vy *= -1;
    }
    
    if((x>width) || (x<0))
    {
      vx *= -1;
    }
    
    y += vy;
    x += vx; 
  }
  
  void display()
  {
    fill(rgb[0], rgb[1], rgb[2], 180);
    ellipse(x, y, diameter, diameter);
  }
  
}


