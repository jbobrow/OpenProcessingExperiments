


PFont akkmono;
String j = "J";
String u = "U";
String g = "G";
String g2 = "G";
String l = "L";
String e = "E";
float angle= 0;





void setup ()
{
  size (400, 400);
  smooth();
  noStroke();
  akkmono = loadFont ("Akkurat-Mono-36.vlw");
  textFont(akkmono);
  

  
}

void draw ()
{
 background (0);
 
 translate(width/2, height/2);

 float x = cos(angle) * 100;
 float y= sin(angle) * 100;
 
 fill(23, 194, 39);
 text (j, x, y);
 fill(200, 4, 100);
 text(u, 0, y);
 fill(79, 4, 200);
 text(g, x*1.3, y*0.5);
 fill(200, 4, 100);
 text(g2, x/1.5, y);
 fill(23, 194, 39);
 text(l, x+5, y/2);
 fill(79, 4, 200);
 text(e, x*1.2, y/0.6);
 
angle += 0.04;
 
 
}
 
 

  

  


