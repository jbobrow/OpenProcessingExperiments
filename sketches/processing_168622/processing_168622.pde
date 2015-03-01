
float a = 0;
int b = 0;
float c = 0;

void setup() {
  size(500, 500);
  background(200);
}

void draw(){
noFill();
stroke(255, a, 0);
a=a+5;
line(85, a, a, 10);
stroke(0, 0, 0);
line(a, a, 15, 80);
stroke(0, 0, 0);
a=a+5;
a++;
bezier(85, a, 10, 10, a, 90, 15, 80);


noFill();
stroke(255, a, a);
a=a+5;
line(250, a, a, 10);
stroke(100, a, a);
line(a, a, 15, 250);
stroke(15, 50, a);
a=a+5;
a++;
bezier(85, a, 10, 10, a, 90, 250, 80);

}


