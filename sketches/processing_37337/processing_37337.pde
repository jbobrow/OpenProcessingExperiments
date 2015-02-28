

int distance = 30;
size(500, 500);
background(255, 255, 255);


for (int i=1; i<=width; i++)
{ 
  noStroke();
  ellipse(distance*i, i*distance, 10*i, 10*i);
  for (int j=0; j<=width; j++) {
    fill(random(256), random(256), 255, 5*i);
    ellipse((distance*i)-(i*i*j), i*distance, i*10, i*10);
    ellipse(i*distance, (distance*i)-(i*i*j), 10*i, 10*i);
  }
}                
                
