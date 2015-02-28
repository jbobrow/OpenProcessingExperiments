
PFont font;
int SIZE = 205;
Dot [] dots = new Dot [SIZE];
int showing = -1;
int interval = 0;

void setup()
{
  // set up window
  size(1200,800);
  font = createFont("Ariel", 13, true);
  
  // read in file
  String [] stuff = loadStrings("memories2.csv");
  String [] data;
  int [] rgb;
  String gender = "O";
  int age;
  String bio;
  int mage;
  int maxmage = 0;
  
  smooth();
  for (int i=0; i<dots.length; i++)
  {
    data = split(stuff[i], '\t');
    rgb = getColor(data[5]);
    if (data[8].equals("female"))
      gender = "F";
    else if (data[8].equals("male"))
      gender = "M";
    age = int(data[7]);
    bio = age + " " + gender + " " + data[10];
    mage = int(data[2]);
    if (mage > maxmage)
      maxmage = mage;
    dots[i] = new Dot(i, width/15*mage, height/2, age, random(-2,2), random(-2,2), rgb , data[3], bio, mage);
  }
  background(0);   
  noStroke();
  
  interval = width/maxmage;  
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
  if (showing != -1)
    dots[showing].showText();
}

class Dot
{
  int id;
  float x, y;
  float diameter;
  float vx, vy;
  int [] rgb;
  String memory;
  String bio = "anonymous";
  int mage;
  
  Dot(int id, float x, float y, float diameter, float vx, float vy, int[] rgb, String memory, String bio, int mage)
  {
    this.id = id;
    this.x = x;
    this.y = y; 
    this.diameter = diameter;
    this.vx = vx;
    this.vy = vy;
    this.rgb = rgb;
    this.memory = memory;
    this.bio = bio;
    this.mage = mage;
  }
  
  void showText()
  {
    textFont(font);
    ArrayList t = wordWrap(memory, 200);
    int lines = t.size();
    fill(33, 200); 
    
    textAlign(LEFT);
    if (x > width/2)
    {
      rect(x-200, y-2*lines, 200, (lines+2)*15, 7);
      fill(255, 255);
      for (int i = 0; i < lines; i++)
        text(t.get(i).toString(), x-200, y + i*15);
      textAlign(RIGHT);
      text(bio, x, y + lines*15);
    } 
    else
    {
      rect(x, y-2*lines, 200, (lines+2)*15, 7);
      fill(255, 255);
      for (int i = 0; i < lines; i++)
        text(t.get(i).toString(), x, y + i*15);
      textAlign(RIGHT);
      text(bio, x+200, y + lines*15);
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
    
    if((x > width) || (x < 0) || (x < mage * interval - interval) || (x > mage * interval + interval))
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

// Function to return an ArrayList of Strings (maybe redo to just make simple array?)
// Arguments: String to be wrapped, maximum width in pixels of each line
ArrayList wordWrap(String s, int maxWidth) {
  // Make an empty ArrayList
  ArrayList a = new ArrayList();
  float w = 0;    // Accumulate width of chars
  int i = 0;      // Count through chars
  int rememberSpace = 0; // Remember where the last space was
  // As long as we are not at the end of the String
  while (i < s.length()) {
    // Current char
    char c = s.charAt(i);
    w += textWidth(c); // accumulate width
    if (c == ' ') rememberSpace = i; // Are we a blank space?
    if (w > maxWidth) {  // Have we reached the end of a line?
      String sub = s.substring(0,rememberSpace); // Make a substring
      // Chop off space at beginning
      if (sub.length() > 0 && sub.charAt(0) == ' ') sub = sub.substring(1,sub.length());
      // Add substring to the list
      a.add(sub);
      // Reset everything
      s = s.substring(rememberSpace,s.length());
      i = 0;
      w = 0;
    } 
    else {
      i++;  // Keep going!
    }
  }
 
  // Take care of the last remaining line
  if (s.length() > 0 && s.charAt(0) == ' ') s = s.substring(1,s.length());
  a.add(s);
 
  return a;
}


