
String userInput = "", pass = "password";
boolean matched = false;
int x, y, a, b, j, k;
int v;

void setup()
{
  size(500, 500);
  x = a = j = width/2;
  y = height/2;
  b = height/4;
  k = height/4 * 3;
  v = 1;
  frameRate(200);
}

void shapes()
{
     fill(255);
     ellipse(x, y, 100, 100);
     ellipse(a, b, 100, 100);
     ellipse(j, k, 100, 100);
     fill(0);
     if(x > width || x < 0)
        {
          v = v * -1;
        }
     x = x + v;
     if(a > width || a < 0)
        {
          a = a * -1;
        }
     a = a - v;
     if(j > width || j < 0)
        {
          v = v * -1;
        }
     j = j + v*2;
}




void draw()
{
  background(0);
  text("Enter Password:" + userInput, 0, height/2 + 10);
  text("Result:" + matched, 0, height - 10); 
  if(userInput.equalsIgnoreCase(pass))
  {
   shapes();
  }
}
 


void keyPressed()
{
  if(key != CODED)
  {
    userInput += key;
  }
  if (userInput.equalsIgnoreCase(pass))
  {
    matched = true;
  }
}
