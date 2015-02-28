

int cursorx = 0, cursory = 0;
int n = 1000;
int s = 500;
int t = 250;
int v = 600;
void setup()
{
  
  size(600,400);
  background(0);

}

void draw()
{
  
  int x = mouseX;
  int y = mouseY;
  
 
  if (mousePressed == true)
  {
   
    background(0);
  
  }

  if (cursorx != x && cursory != y)
  {
    
    int point1 =  int(random(v) );
    int point2 = int( random(v) );
    int point3 = int( random(t) );
    int point4 = int( random(n) );
    int point5 = int( random(t) );
    int point6 = int( random(s) );
    
    int fill1 = int( random(255) );
    int fill2 = int( random(255) );
    int fill3 = int( random(255) );
    int fill4 = int( random(255) );
    
    int stroke1 = int( random(255) );
    int stroke2 = int( random(255) );
    int stroke3 = int( random(255) );
    int stroke4 = int( random(255) );
    
  
    triangle(point1, point2, point3, point4, point5, point6);
    fill(fill1, fill1, fill3, fill4);
    stroke(stroke1, stroke2, stroke3, stroke4);
    
  }
  
  cursorx = x;
  cursory = y;
  
}

