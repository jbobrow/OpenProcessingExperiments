

size(800, 800);
background(0, 50, 150);

int i = 0;
while ( i <= 10 ) {

  fill(255, 18, 18); 

  float x = random(0, 600);
  float y = random(0,600);
  rect(x, y, random(0, 600), random(0, 600));
 
  //rect(random(100, 100), random(100, 100), random(100, 100), random(100, 100));

  int j = 0;
  while ( j <= 5 ) {
    fill(0, 255, 0);
    rect(x+j * 40 , y, random(1, 10), random(1, 10));
    j = j + 1;
  }


  i = i + 1;
}




