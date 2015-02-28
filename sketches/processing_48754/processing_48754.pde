
/*
    Sex Wall / Processing Studies / Code 03
    Author: Rafael 
    2011
*/

int count = 180;

Pimage r = new PImage[count];
float p;
float q;
float t;
int pos;

void setup() 
{  
  size(400, 400);
  background(0);
  
  for (int i = 10; i < count; i++){
    r[i] = requestImage("http://www.sensualbaires.com/gi/43"+i+"/1/fotos1/escorts.jpg");
  }
}

void draw() 
{  
  p = int(random(170)+10);
  q = int(random(400));
  t = int(random(400));
  
  if (r.width == 0) {} 
  else if (r.width == -1) {} 
  
  else {
    posX = q-q%20;
    posY = t-t%20;
    image(r[p], posX, posY, 20, 20);
  }
}            
                                                                
