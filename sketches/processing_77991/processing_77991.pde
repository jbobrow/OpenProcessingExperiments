
PFont outterFont;
PFont innerFont;
String[] Names; 
String[] Responses;

String s;
String t;
int i;
int l;

int outter;
int outterRadius;
int outterLength;
int inner;
int innerRadius;
int innerLength;

int rColor;
int bColor;
int gColor;
int rColorTarget;
int bColorTarget;
int gColorTarget;

boolean test;

void setup()
{
  int i = 0;
  frameRate(30);
  size (600, 500);
  test = false;

  String[] Names = new String[6];
  String[] Responses = new String[7];
  String s = " ";
  String t = " ";

  rColor = 125;
  bColor = 155;
  gColor = 110;

  rColorTarget =255;
  rColorTarget =250;
  rColorTarget =250;

  outter = 0;
  outterRadius = 200;
  innerRadius = 75;
  inner = 0;

  Names[0] = "I am funny, a comedian. I am funny, a comedian.";
  Names[1] = "I am brilliant, a future leader. I am brilliant, a future leader.";
  Names[2] = "I am handsome, a total flirt. I am handsome, a total flirt.";
  Names[3] = "I am awkward, a character. I am awkward, a character.";
  Names[4] = "I am facinating, a master of conversation. I am facinating, a master of conversation.";
  Names[5] = " ";

  Responses[0] = "Help me. Help me. Help me. Help me.";
  Responses[1] = "He lies. He lies. He lies. He lies.";
  Responses[2] = "Who am I. Who. Who am I. Who.";
  Responses[3] = "Don't listen to it. Don't listen to it.";
  Responses[4] = "I can feel death. I can feel death.";
  Responses[5] = "I'm so alone. So... I'm so alone. So...";
  Responses[6] = " ";
}

void draw()
{
  smooth();
  background(10);
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      outter ++;
      rColorTarget = (int) random(200) + 55;
      gColorTarget = (int) random(200) + 55;
      bColorTarget = (int) random(200) + 55;
    }
    if (mouseButton == RIGHT)
    {
      outter--;
    }
  }

  if (rColor < rColorTarget)
  {
    rColor++;
  }
  if (gColor < gColorTarget)
  {
    gColor++;
  }
  if (bColor < bColorTarget)
  {
    bColor++;
  }
  if (rColor > rColorTarget)
  {
    rColor--;
  }
  if (gColor > gColorTarget)
  {
    gColor--;
  }
  if (bColor > bColorTarget)
  {
    bColor--;
  }

  if (frameCount % 120 == 0 && outter !=4)
  {
    outter++;
    rColorTarget = (int) random(200) + 55;
    gColorTarget = (int) random(200) + 55;
    bColorTarget = (int) random(200) + 55;
  }

  if (outter == 5)
  {
    outter=0;
  }

  if (frameCount % 210 == 0 && inner != 6)
  {
    inner++;
  }

  if (inner == 6)
  {
    inner = 0;
  }

  fill (255);
  ellipse(300, 250, 700, 500);

  fill(rColor, gColor, bColor);
  ellipse(300, 250, 500, 500);

  fill (0);
  ellipse(300, 250, 200, 200);
  
  stroke(255, i);
  fill(255);
  if (i < 105 && test == false)
  {
    i ++;
  }
  if(i == 105)
  {
    test = true;
  }
  if (test == true)
  {
    i--;
  }
  if(i == 0)
  {
    test = false;
  }

  if (outter == 1)
  {
    textFont(loadFont("ArialMT-32.vlw"));
    s="I am funny, a comedian. I am funny, a comedian.";
    int l=s.length();
    for (int i=0;i<l;i++) 
    {
      float x=sin(-TWO_PI/l*i+PI)*200;
      float y=cos(-TWO_PI/l*i+PI)*200;   
      pushMatrix();
      translate(x+width/2, y+height/2);
      rotate(TWO_PI/l*i);
      char c=s.charAt(i);
      text(c, 0, 0);
      popMatrix();
    }
  }
  
  if (outter == 2)
  {
    textFont(loadFont("ArialMT-32.vlw"));
    s="I am brilliant, a future leader. I am brilliant, a future leader.";
    int l=s.length();
    for (int i=0;i<l;i++) 
    {
      float x=sin(-TWO_PI/l*i+PI)*200;
      float y=cos(-TWO_PI/l*i+PI)*200;   
      pushMatrix();
      translate(x+width/2, y+height/2);
      rotate(TWO_PI/l*i);
      char c=s.charAt(i);
      text(c, 0, 0);
      popMatrix();
    }
  }
  if (outter == 3)
  {
    textFont(loadFont("ArialMT-32.vlw"));
    s="I am handsome, a total flirt. I am handsome, a total flirt.";
    int l=s.length();
    for (int i=0;i<l;i++) 
    {
      float x=sin(-TWO_PI/l*i+PI)*200;
      float y=cos(-TWO_PI/l*i+PI)*200;   
      pushMatrix();
      translate(x+width/2, y+height/2);
      rotate(TWO_PI/l*i);
      char c=s.charAt(i);
      text(c, 0, 0);
      popMatrix();
    }
  }
  if (outter == 4)
  {
    textFont(loadFont("ArialMT-32.vlw"));
    s="I am awkward, a character. I am awkward, a character.";
    int l=s.length();
    for (int i=0;i<l;i++) 
    {
      float x=sin(-TWO_PI/l*i+PI)*200;
      float y=cos(-TWO_PI/l*i+PI)*200;   
      pushMatrix();
      translate(x+width/2, y+height/2);
      rotate(TWO_PI/l*i);
      char c=s.charAt(i);
      text(c, 0, 0);
      popMatrix();
    }
  }
  if (outter == 0)
  {
    textFont(loadFont("ArialMT-32.vlw"));
    s="I am facinating, a good talk. I am facinating, a good talk.";
    int l=s.length();
    for (int i=0;i<l;i++) 
    {
      float x=sin(-TWO_PI/l*i+PI)*200;
      float y=cos(-TWO_PI/l*i+PI)*200;   
      pushMatrix();
      translate(x+width/2, y+height/2);
      rotate(TWO_PI/l*i);
      char c=s.charAt(i);
      text(c, 0, 0);
      popMatrix();
    }
  }
  
  fill(255, i);
  
  if (inner == 0)
  {
    textFont(loadFont("ArialMT-16.vlw"));
    s="I'm so alone. So... I'm so alone. So...";
    int l=s.length();
    for (int i=0;i<l;i++) 
    {
      float x=sin(-TWO_PI/l*i+PI)*84;
      float y=cos(-TWO_PI/l*i+PI)*84;   
      pushMatrix();
      translate(x+width/2, y+height/2);
      rotate(TWO_PI/l*i);
      char c=s.charAt(i);
      text(c, 0, 0);
      popMatrix();
    }
  }
  if (inner == 1)
  {
    textFont(loadFont("ArialMT-16.vlw"));
    s="Help me. Help me. Help me. Help me.";
    int l=s.length();
    for (int i=0;i<l;i++) 
    {
      float x=sin(-TWO_PI/l*i+PI)*84;
      float y=cos(-TWO_PI/l*i+PI)*84;   
      pushMatrix();
      translate(x+width/2, y+height/2);
      rotate(TWO_PI/l*i);
      char c=s.charAt(i);
      text(c, 0, 0);
      popMatrix();
    }
  }
  if (inner == 2)
  {
   textFont(loadFont("ArialMT-16.vlw"));
    s="He lies. He lies. He lies. He lies.";
    int l=s.length();
    for (int i=0;i<l;i++) 
    {
      float x=sin(-TWO_PI/l*i+PI)*84;
      float y=cos(-TWO_PI/l*i+PI)*84;   
      pushMatrix();
      translate(x+width/2, y+height/2);
      rotate(TWO_PI/l*i);
      char c=s.charAt(i);
      text(c, 0, 0);
      popMatrix();
    }
  }
  if (inner == 3)
  {
    textFont(loadFont("ArialMT-16.vlw"));
    s="Who am I. Who. Who am I. Who.";
    int l=s.length();
    for (int i=0;i<l;i++) 
    {
      float x=sin(-TWO_PI/l*i+PI)*84;
      float y=cos(-TWO_PI/l*i+PI)*84;   
      pushMatrix();
      translate(x+width/2, y+height/2);
      rotate(TWO_PI/l*i);
      char c=s.charAt(i);
      text(c, 0, 0);
      popMatrix();}
  }
  if (inner == 4)
  {
    textFont(loadFont("ArialMT-16.vlw"));
    s="Don't listen to it. Don't listen to it.";
    int l=s.length();
    for (int i=0;i<l;i++) 
    {
      float x=sin(-TWO_PI/l*i+PI)*84;
      float y=cos(-TWO_PI/l*i+PI)*84;   
      pushMatrix();
      translate(x+width/2, y+height/2);
      rotate(TWO_PI/l*i);
      char c=s.charAt(i);
      text(c, 0, 0);
      popMatrix();}
  }
  if (inner == 5)
  {
    textFont(loadFont("ArialMT-16.vlw"));
    s="I can feel death. I can feel death.";
    int l=s.length();
    for (int i=0;i<l;i++) 
    {
      float x=sin(-TWO_PI/l*i+PI)*84;
      float y=cos(-TWO_PI/l*i+PI)*84;   
      pushMatrix();
      translate(x+width/2, y+height/2);
      rotate(TWO_PI/l*i);
      char c=s.charAt(i);
      text(c, 0, 0);
      popMatrix();}
  }
  
}









