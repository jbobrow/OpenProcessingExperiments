
size(200,200); 

int side = 10;
int space = 5;
int x = side/2;
rectMode(CENTER);
  
for (int s = 0; s < 20; s++) { 
  
  if (x < width/2) { 
    side += 3;
  }
  else { 
    side -= 3;
  }
  x += space;
  rect(x,height/2,side,side);
  x = x + side;
}

