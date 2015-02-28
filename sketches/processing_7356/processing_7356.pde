
import toxi.geom.*;
import toxi.color.*;
import peasy.*;

// Hilbert curve from "Algorithmic Beauty of Plants"
// Jonathan Feinberg
String gen = "A";
PeasyCam cam;
int[] colors;

void setup()
{
  size(600, 600, P3D);
  cam = new PeasyCam(this, -70,70,-70,250);
  cam.rotateX(PI/5);
  cam.rotateY(PI/5);

  background(0);
  noStroke();
  for (int i = 0; i < 3; i++)
  {
    StringBuilder sb = new StringBuilder();
    for (int n = 0; n < gen.length(); n++)
    {
      char c = gen.charAt(n);
      if (c == 'A')
        sb.append("B-F+CFC+F-D&F^D-F+&&CFC+F+B//");
      else if (c == 'B')
        sb.append("A&F^CFB^F^D^^-F-D^|F^B|FC^F^A//");
      else if (c == 'C')
        sb.append("|D^|F^B-F+C^F^A&&FA&F^C+F+B^F^D//");
      else if (c == 'D')
        sb.append("|CFB-F+B|FA&F^A&&FB-F+B|FC//");
      else
        sb.append(c);
    }
    gen = sb.toString();
  }
  colors = new int[countF()];
  for (int i = 0; i < colors.length; i++)
    colors[i] = TColor.newHSV((float)i/colors.length, 1, 1).toARGB();
}

boolean firstTime = true;

public void draw()
{
  int colorIndex = 0;

  lights();
  directionalLight(128, 128, 128, 0, 0, 1);
  background(15 * abs(sin(frameCount/20.0)),15 * abs(cos(frameCount/41.0)),25 * abs(cos(frameCount/23.0)));
    
  pushMatrix();
  for (int i = 0; i < gen.length(); i++)
  {
    char c = gen.charAt(i);
    if (c == 'F')
    {
      fill(colors[colorIndex]);
      colorIndex++;

      float len = 20;

      // move to box center
      translate(0, 0, -len / 2);
      box(3, 3, len - 1.6f);      
      translate(0, 0, -len / 2);
      box(3, 3, 3);
    }
    else if (c == '-')
      rotateY(HALF_PI);
    else if (c == '+')
      rotateY(-HALF_PI);
    else if (c == '&')
      rotateX(HALF_PI);
    else if (c == '^')
      rotateX(-HALF_PI);
    else if (c == '/')
      rotateZ(HALF_PI);
    else if (c == '|')
      rotateY(PI);
  }
  popMatrix();
  firstTime = false;
}

private int countF()
{
  int c = 0;
  for (int i = 0; i < gen.length(); i++)
    if (gen.charAt(i) == 'F')
      c++;
  return c;
}


