
boolean x = false;

size(200, 200);
background(0);
stroke(0);

for (int i = 1; i < width; i += 4) 
{
  if (i < width/2) {
    x = true;
  } else {
    x = false;
  }
  
  if (x) {
    stroke(255);
    rect(i, 5, i, height-1);
  }
  
  if (!x) {
    stroke(126);
    ellipse(width/2 , i, width-2, i);
  }
}

