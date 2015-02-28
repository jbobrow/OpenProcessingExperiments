
color color1, color2, color3;
PFont font;
String hours = "";
String minutes = "";
String seconds = "";


void setup()
{ 
  size(800, 600);
  smooth();
  noStroke();
  font = loadFont("helvetica.vlw");
  textAlign(CENTER);
}

void draw()
{
  background(255, 50);

  int m = minute();
  int s = second();
  int h = hour()%12;

  color1 = color(255,  0, 0);
  color3 = color(0, 0, 255);
  color2 = color(255, 255, 0);
textFont(font, 350);
fill(color1, 175);
  text(hours, width/4, height*.75);
  fill(color3, 175);
  text(seconds, width*.75, height*.75);
    fill(color2, 175);
  text(minutes, width/2, height*.75);
  
  
   if (h == 0)
  { hours = 12;
  }
  else if (h < 10)
  { hours = "0" + h;
  }
  else 
  { hours = str (h);
  }
  
  if (m < 10)
  { minutes = "0"+m;
  }
  else
  { minutes = str (m);
  }
  
  if (s < 10)
  { seconds = "0" + s;
  }
  
  else
  {seconds = str(s);
  }
  
}                                                               
