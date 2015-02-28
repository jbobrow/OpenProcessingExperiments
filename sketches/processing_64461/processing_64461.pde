

size (500,500);
background(0);
stroke(255,0,0);
line(0, 50, width, 50);
line(0, 150, width, 150);
line(0, 250, width, 250);

stroke(255);

float x = 0;
while(x<width) {
  point(x,50+random(-10,10));  //between-10,10
  point(x,150+20*noise(x/100));//between 0,1
  point(x,250+20*sin(x/100)); //number between -1 and 1
  
  x=x+1;
}

