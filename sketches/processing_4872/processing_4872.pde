
int numRings = 1;
Ring[] rings = new Ring[numRings];


int numballs = 8;

void setup(){
  size(400,400);
  background(255,255,255);
  smooth();
  ellipseMode(CENTER);
  
  rings[0] = new Ring(numballs, 200, 200, 150);
}

void draw(){
  background(255,255,255);
  for (int i = 0; i < numRings; i++)
  {
    rings[i].changeN(numballs);
    rings[i].display();
  }

}


void keyPressed(){
 if (keyCode == UP)
 {
   numballs++;
 }
  if (keyCode == DOWN)
  {
   if (numballs > 1)
   {
   numballs--;
   }
  }
  
}



class Ring {
 
 int radius;
 int numballs;
 int xx, yy;
  
 Ring(int n, int centx, int centy, int rad){
  xx = centx;
  yy = centy;
  numballs = n; 
  radius = rad;
 }
  
  void display(){
   float degreeInc = 2.0*(PI / numballs);
   int count = -1;
   int[] pointsx = new int[numballs + 1];
   int[] pointsy = new int[numballs + 1];
   int smallRad = 10;
    for ( float deg = 0; deg < 2*PI; deg = deg + degreeInc)
    {
     int dy = int(radius * sin(deg));
     int dx = int(radius * cos(deg));
     ellipse(xx+dx, yy+dy, smallRad, smallRad);
     count++;
     pointsx[count] = xx+dx;
     pointsy[count] = yy+dy;
    }  
    
    for (int i = 0; i <= count; i++)
    {
      for (int j = i+1; j <= count; j++)
      {
        line(pointsx[i],pointsy[i],pointsx[j],pointsy[j]);
      }
    }
  }
 void changeN(int n)
 {
   numballs = n;
 }
}

