
PFont font;
String fontChange;
String s[] = new String[4];
int colors[] = new int[3];

void setup ()
{
  size(500,500);
  smooth();
  fontChange = "font.vlw";
  font = loadFont(fontChange);
  reset();
}

void draw()
{
  background(150);
  font = loadFont(fontChange);
  
  strokeWeight(1);

  draws();
  
//Reset Button
  if(hover(395,470,100,25))
  {
    strokeWeight(3);
    rect(395,470,100,25);
    fill(0);
    text(s[3],425,485);
    
    if(mousePressed)
    {
      reset(); 
    }
  }
  else
  {
    strokeWeight(1);
    rect(395,470,100,25); 
    fill(0);
    text(s[3],425,485);
  }



//Caps Button
fill(175);

if(hover(150,250,50,50))
{
    strokeWeight(3);
    rect(150,250,50,50);
    fill(0);
    
    if(mousePressed)
    {
      strokeWeight(1);
      caps();
      draws();
    }
}
else
  {
    strokeWeight(1);
    rect(150,250,50,50); 
    draws();
  }
  
//Color Button
fill(175);

if(hover(250,250,50,50))
{
  strokeWeight(3);
  fill(colors[0],colors[1],colors[2]);
  rect(250,250,50,50);
  fill(0);
  text(s[1],255,280);
  
  if(mousePressed)
    {
      colors[0] = int(random(255));
      colors[1] = int(random(255));
      colors[2] = int(random(255));
      draws();
    }
}
else
  {
    strokeWeight(1);
    fill(175);
    rect(250,250,50,50); 
    draws();
  }
  
  
}
boolean hover(int x, int y, int w, int h)
{
 if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h)
 {
    return true;
 } 
 else
 {
    return false; 
 }
}

void draws()
{
    fill(colors[0],colors[1],colors[2]);
    rect(395,470,100,25);
    rect(250,250,50,50); 
    rect(150,250,50,50);
    
    fill(0);
    text(s[0],170,150);
    text(s[1],255,280);
    text(s[2],152,280);
    text(s[3],425,485);
}

void reset()
{
 colors[0] = 150;
 colors[1] = 150;
 colors[2] = 150; 
 
 s[0] = "Buttons that do things!";
 s[1] = "Color";
 s[2] = "Words";
 s[3] = "Reset";
}

void caps()
{
   s[0] = s[0].toUpperCase();
   s[1] = s[1].toUpperCase();
   s[2] = s[2].toUpperCase();
   s[3] = s[3].toUpperCase();
}

