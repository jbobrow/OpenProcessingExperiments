
void setup(){
size(400,400);
frameRate(2);
}

void draw(){
background(0);
int r=(int)random(255);
int g=(int)random(255);
int b=(int)random(255);
int r1=(int)random(255);
int g1=(int)random(255);
int b1=(int)random(255);
int r2=(int)random(255);
int g2=(int)random(255);
int b2=(int)random(255);
int count=0;
while(count<=100){
  int a=(int)random(0,4);
  if (a==0){
    fill(r,g,b);
    ellipse((int)random(400),(int)random(400),(int)random(20,80),(int)random(20,80));}
  if(a==1){
    fill(r1,g1,b1);
    rect((int)random(400),(int)random(400),(int)random(20,80),(int)random(20,80));}
  if(a==3){
    fill(r2,g2,b2);
    quad((int)random(400),(int)random(400),(int)random(400),(int)random(400),(int)random(400),(int)random(400),(int)random(400),(int)random(400));}
  count=count+1;
}
}



