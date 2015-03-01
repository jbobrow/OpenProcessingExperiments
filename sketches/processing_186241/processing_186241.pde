
//TWEEKED CODE ASSIGNMENT
//ASSIGNMENT WEEK 3
//RECTANGLE WITH COLOR

int b;
int r;
int x = 0;
int y = 0;

void setup() {
  size(500, 280);
  background(0);
}

void draw() {
b = random(0,255);
r = random(0,255);
y = random(0,255);
fill(b,r,y);
rect(x,y,50,50);
x = x+1;
x = x%500;

    if(x<=250){
    y = y+1;
    }else{
    y = y-1;
    }
 y = y%500;
}
