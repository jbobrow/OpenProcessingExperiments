
int x = 0;
int y = 0;


void setup () {
  size (800, 600);
  background (0);
  fill (150, 0, 0);
  noStroke();
  smooth ();
}

void draw (){
  background (0);
//  ellipse (x, y, 50, 50);
//  x++;
//  y+=2;

  rect (10, y, 10, 50);
  x++;
  y-=1;
  
  ellipse (50, y, 20, 20);
  x++;
  y-=1;

 rect (80, y, 50, 70);
  x++;
  y+=1;

  ellipse (175, y, 50, 100);
  x++;
  y-=1;

   rect (210, y, 20, 100);
  x++;
  y+=1;
  
  ellipse (275, y, 50, 20);
  x++;
  y+=1;
  
  rect (310, y, 20, 100);
  x++;
  y+=1;
  
  rect (350, y, 10, 100);
  x++;
  y+=1;
  
  rect (380, y, 10, 10);
  x++;
  y+=1;
  
  rect (400, y, 10, 40);
  x++;
    y+=1;
  
  rect (425, y, 10, 75);
  x++;
  y+=1;
  
  ellipse (470, y, 50, 100);
  x++;
  y+=1;
 
  ellipse (520, y, 10, 100);
  x++;
  y+=1; 
  
   rect (545, y, 10, 200);
  x++;
  y-=1;
  
  rect (555, y, 10, 200);
  x++;
  y+=1;
  
   ellipse (600, y, 10, 100);
  x++;
  y-=1;
  
  rect (620, y, 10, 200);
  x++;
  y-=1;

  rect (640, y, 10, 200);
  x++;
  y-=1;

  ellipse (660, y, 10, 10);
  x++;
  y-=1;
  
  rect (670, y, 10, 200);
  x++;
  y+=1;

  ellipse (700, y, 20, 50);
  x++;
  y-=1;
  
   ellipse (720, y, 10, 10);
  x++;
  y+=1;
  
  rect (740, y, 10, 200);
  x++;
  y+=1;

  ellipse (770, y, 20, 20);
  x++;
  y-=1;


}



