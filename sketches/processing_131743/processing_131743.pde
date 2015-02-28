
size(400,600);

//line
size(800,500);
background(5,5,5);

int d; 
d=11;
if (d<15) {
  stroke(255);
  line(15,20,350,450);
}

//triangle
if (d>50) {
  line(100,100,30,45);
}
else
{
  for(int i = 10; i <= 200; i += 10){
  for (int j = 10; j <= 200; j += 10){
    float r = random(0,400);
    float n = random (0,400);
    stroke(40,240,160,150);
    line(i*4,j*2,j,i);
  }
}

for(int i = 10; i <= 100; i += 10){
  for (int j = 10; j <= 100; j += 10){
    float r = random(250,500);
    float n = random (400);
    stroke(176,23,31);
    fill(230,40,67,60);
    ellipse(r,n,i,j);
  }
}
}


