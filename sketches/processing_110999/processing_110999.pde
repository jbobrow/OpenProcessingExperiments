
float x ,y ;
float angle = 500;
float r = 20;
float diff = 1;

void setup() {
  

  size(600,600);
  background(0);
   
}

void draw(){
x = r * cos(angle);
y = r * sin(angle);

fill(random(0,255),random(0,255),random(0,255));
noStroke();

translate(300,300);


rect(x, y, x,y);
rect(-y, -x, -y,-x);
rect(y, x, y,x);
rect(-x,-y,-x,-y);

angle = angle + 300;
r = r-diff;



}
