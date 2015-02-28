
int a = 400;
int b = 200;
int c = 450;
int d = 150;
void setup(){
size(600,600);
background (255);
}

void draw(){
  while(d>0){
 stroke(75,255,210);
line(400,0,d,600);
d=d-2;
}
while(a<600){
  stroke(255,75,210);
line(150,600,a,0);
a = a +2;
}
while(b>0){
 stroke(75,210,255);
line(450,600,b,0);
b = b-2;
}
while(c<600){
stroke(210,255,75);
line(200,0,c,600);
c = c +2;
}
}


