

//nested for loop grid

void setup() {
size(400,400);
noStroke ();
}


void draw ()  {
  background (255);
  for (int x =10; x<390; x+=20) { 
    for (int y =10; y<390; y+=20) { 
      fill (x,y,200,100);
      ellipse(x,y,x/10,y/10);
    }
  
  }
}



/*
for (int y = 10; y <= 85; y += 10)
{
for (int x = 10; x <= 85; x += 10)
  {
  if (x <= 50) {
    line(x-10, y-10, x-3, y-3);
    } else {
    fill(90,30,50,50);
    ellipse(x, y, x-30, y-30);
  }
 
  }
}
*/



