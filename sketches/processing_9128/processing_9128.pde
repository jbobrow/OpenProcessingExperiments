
/*void setup()
{*/
  size(800,800);
  smooth();
/*}

void draw()
{*/
  noStroke();
  fill(255,255,255,40);
  translate (200,200);
  
  
  for (int i =0; i<=50; i++) {
  
  
  rotate(radians(360/50)); //180/3=60 ou rotate(radians(60));
  rect(0,0,100,100);
  }
/*}*/

stroke(100);
  fill(255,255,255,0);
  translate (300,300);
  
  
  for (int i =0; i<=200; i++) {
  
  
  rotate(radians(360/50)); //180/3=60 ou rotate(radians(60));
  rect(0,0,100,100-i*2);
  }

