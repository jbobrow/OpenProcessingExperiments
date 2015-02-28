
int a;
int r;
int g;
int b;
int x;
int y;

int[] x_positions = new int[15];
int[] y_positions = new int[15];

void setup() 
{ size(1000,500); 
  for (int i=0;i<15;i++)
  { x_positions[i] = int(random(0,1000));
    y_positions[i] = int(random(0,500));
  } 
  smooth();
}

 void draw()
{ for(int i=0;i<15;i++)
  { biene(x_positions[i], y_positions[i],100);
  }
  
}


void biene(int x, int y, int size)
{  if(mouseX>x && mouseX<(x+size) && mouseY>y && mouseY<(y+size))
  {  background (r,g,b);
  
  }
   
   a=int(random(0,255));
   
// Flügel
  stroke(0);
  fill(a);
  ellipse(x-50,y-30,80,80);
  ellipse(x+50,y-30,80,80);
// Körper
  stroke(0);
  fill(x,y,0);
  ellipse(x,y,100,100);
// Kopf
  stroke(0);
  fill(255);
  ellipse(x,y-30,60,60);
// Augen
  fill(0);
  ellipse(x-19,y-30,15,10);
  ellipse(x+19,y-30,15,10);
//Nase
    fill(mouseX, 0, mouseY);
    ellipse(x,y-20,10,5);
//Arme  
  stroke (0);
  line(x-10,y,x-10,y+10);
  line(x+10,y,x+10,y+10);
//Arme mitte 
  stroke (0);
  line(x-10,y+25,x-10,y+35);
  line(x+10,y+25,x+10,y+35);
// Beine
  stroke(0);
  line(x-10,y+50,x-10,y+60);
  line(x+10,y+50,x+10,y+60);
}

void mousePressed() {
    r=int(random(0,255));
    g=int(random(0,255));
    b=int(random(0,255));
}

