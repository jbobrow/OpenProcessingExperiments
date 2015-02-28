
 color color1, color2, color3;
 PFont font;
String seconds = "";
String minutes = "";
String hours = "";

void setup()
{ 
  size(1024, 768);
  smooth();
  font = loadFont("helvetica.vlw");
  noStroke();
  textAlign(CENTER);
}

void draw()
{ 
  background(255, 50);

  int m = minute();
  int s = second();
  int h = hour()%12;
  
  color1 = color(255, 0, 0);
  color2 = color(0, 0, 255);
  color3 = color(255, 255, 0);

  fill(color1);
  arc(width/4, height/2, 200, 200, 1.5*PI, 1.5*PI+map(h, 0, 12, 0, TWO_PI));
  fill(color3);
  arc(width*.75, height/2, 200, 200, 1.5*PI, 1.5*PI+map(s, 0, 60, 0, TWO_PI));
  fill(color2);
  arc(width/2, height/2, 200, 200, 1.5*PI, 1.5*PI+map(m, 0, 60, 0, TWO_PI));
  textFont(font, 40);
  fill(0);
  text(hours, width/4, height*.75);
  text(minutes, width/2, height*.75);
  text(seconds, width*.75, height*.75);
  
  if ( s < 10)
  { 
    seconds = "0" + s;  
}

else 
{seconds = str (s);
}

if (m < 10)
{
  minutes = "0" + m;
}

else 
{ minutes = str (m);
}

if (h == 0)

{ hours = "12";
}

else { hours = str (h);
}


}

