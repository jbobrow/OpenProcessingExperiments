
ArrayList lst;
void setup()
{
  lst = new ArrayList();
   
  for(int y = 0; y < 25; y++)
    addLine();
   
  size(300, 300);
  smooth();
 // textFont(loadFont("Courier-48.vlw"));
   
  frameRate(1);
}
 
void addLine()
{
  String s = "";
   
  for(int c = 0; c < 100; c++)
    if(int(random(25)) == 1 )
      s += "a";
    else if(int(random(25)) == 2 )
      s += "b";
    else if(int(random(25)) == 3 )
      s+= "c";
      else if(int(random(25)) == 4 )
      s+= "d";
      else if(int(random(25)) == 5 )
      s+= "e";
      else if(int(random(25)) == 6 )
      s+= "f";
      else if(int(random(25)) == 7 )
      s+= "g";
      else if(int(random(25)) == 8 )
      s+= "h";
      else if(int(random(25)) == 9 )
      s+= "i";
      else if(int(random(25)) == 10 )
      s+= "j";
      else if(int(random(25)) == 11 )
      s+= "k";
      else if(int(random(25)) == 12 )
      s+= "l";
      else if(int(random(25)) == 13)
      s+= "m";
      else if(int(random(25)) == 14 )
      s+= "n";
      else if(int(random(25)) == 15 )
      s+= "o";
      else if(int(random(25)) == 16 )
      s+= "p";
      else if(int(random(25)) == 17 )
      s+= "q";
      else if(int(random(25)) == 18 )
      s+= "r";
      else if(int(random(25)) == 19 )
      s+= "s";
      else if(int(random(25)) == 20 )
      s+= "t";
      else if(int(random(25)) == 21 )
      s+= "u";
      else if(int(random(25)) == 22 )
      s+= "v";
      else if(int(random(25)) == 23 )
      s+= "w";
      else if(int(random(25)) == 24 )
      s+= "x";
      else if(int(random(25)) == 25 )
      s+= "y";
      else if(int(random(25)) == 26 )
      s+= "z";
  lst.add(s);
}
void removeLine()
{
  lst.remove(0);
}
 
void draw()
{
  addLine();
  removeLine();
     int height=20;
  int width=20;
  background(0);
  fill(random(255), random(255), random(255));
  
  textSize(random(60));
  for(int y = 0; y < lst.size(); y++)
    text((String)lst.get(y), 0, y*textAscent() - 3);
     float xPos;
  float yPos;
     xPos = random(mouseX);
     yPos = random(mouseX);
    
     
}

