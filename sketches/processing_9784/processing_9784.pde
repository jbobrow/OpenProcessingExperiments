
//Sarah Stern
//CMSC 117 
//Keith O'Hara
//5/17/2010

int num = 1;
int[] x = new int[num];
int[] y = new int[num];
int indexPosition = 0;
int b = 0;
int d = 0;

void setup()
{
  size(600, 600);
  background(255);
}

void draw()
{
  if (mousePressed == true)
  {
    //Press any key besides 'q, w, e, r, t, or y" "a, s, d, f, g"
    // to draw w/o the armature
    line(mouseX, mouseY, pmouseX, pmouseY);
    x = append(x, pmouseX);
    y = append(y, pmouseY);

    //Press 'y' to erase
    if (key == 'y')
    {
      stroke(255, 255, 255);
      strokeWeight(100);
    }  

    //Type 'q' to begin structure with the largest gaps 
    //between lines in the color purple
    if (key == 'q' || key == 'a')
    {
      int a = constrain((int)random(x.length - 100, x.length), 0, x.length);
      line(x[a], y[a], b, d);
      b = x[a];
      d = y[a];
      strokeWeight(5.5);
      if (key == 'q')
      {
        stroke(0, 0, 0);
      }
      if (key == 'a')
      {
        stroke(0, 0, 0, 150);
      }
    }

    //Type 'w' to begin structure with medium-to-large gaps 
    //between lines in the color blue
    if (key == 'w' || key == 's')
    {
      int a = constrain((int)random(x.length-50, x.length), 0, x.length);
      line(x[a], y[a], b, d);
      b = x[a];
      d = y[a];
      strokeWeight(4.5);
      if (key == 'w')
      {
        stroke(42, 26, 90);
      }
      if (key == 's')
      {
        stroke(42, 26, 90, 150);
      }
    } 

    //Type 'e' to begin structure with medium gaps 
    //between lines in the color teal
    if (key == 'e' || key == 'd')
    {
      int a = constrain((int)random(x.length-25, x.length), 0, x.length);
      line(x[a], y[a], b, d);
      b = x[a];
      d = y[a];
      strokeWeight(3.5);
      if (key == 'e')
      {
        stroke(75, 165, 157);
      }
      if (key == 'd')
      {
        stroke(75, 165, 157, 150);
      }
    }

    //Type 'r' to begin structure with medium-to-small gaps 
    //between lines in the color green
    if (key == 'r' || key == 'f')
    {
      int a = constrain((int)random(x.length-10, x.length), 0, x.length);
      line(x[a], y[a], b, d);
      b = x[a];
      d = y[a];
      strokeWeight(2.5);
      if (key == 'r')
      {
        stroke(132, 173, 85);
      }
      if (key == 'f')
      {
        stroke(132, 173, 85, 150);
      }
    }
    
    //Type 't' to begin structure with small gaps 
    //between lines in the color yellow
    if (key == 't' || key == 'g')
    {
      int a = constrain((int)random(x.length-5, x.length), 0, x.length);
      line(x[a], y[a], b, d);
      b = x[a];
      d = y[a];
      strokeWeight(1.5);
      if (key == 't')
      {
        stroke(239, 240, 138);
      }
      if (key == 'g')
      {
        stroke(239, 240, 138, 150);
      }
    }
  }
}





