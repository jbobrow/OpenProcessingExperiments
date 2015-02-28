
int x=0;
int y=175;
int jump=15;
int speed=10;


void setup() {
  size(400,400);
  background(#04346C);
  noStroke();
}


void draw() {
  frameRate(30);
  fish();
  bubbles();
}


void fish() {
  background(#04346C);
  fill(#37DB79);
  ellipse(x,270,70,30);
  x=x+speed;
  triangle(x-55,250,x-55,290,x-25,270);
  ellipse(x-7,260,35,20);
  if(x>450){
    x=0;
  }
}

void bubbles() {
float p=random(250);
float r=random(400);
float n=random(30);
  fill(255);
  ellipse(x,y,n,n);
  y=y-jump;
  if(y<175){
    y=220;
  }
}
  

