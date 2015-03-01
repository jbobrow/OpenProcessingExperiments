
int x = 500;
int y = 500;
int a = 10;

void setup(){
size (x, y);

background(0, 20);

}


void draw(){
  
stroke(0, random(0, 255), 0);
line(a, random(a, y/2 - a/2), x/2 - a/2, random(a, y/2 - a/2)); 

stroke(random(0, 255), 0, 0);
line (x/2 + a/2, random(a, y/2 - a/2), x - a, random(a, y/2 - a/2));

stroke(0, 0, random(0, 255));
line(a, random(y/2 + a/2, y - a), x/2 - a/2, random(y/2 + a/2, y - a));

stroke(255, random(0, 255), 0);
line(x/2 + a/2, random(y/2 + a/2, y - a), x - a, random(y/2 + a/2, y - a));

}
