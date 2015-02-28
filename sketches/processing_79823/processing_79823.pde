
void setup() {
size(600,400);
frameRate(500);
fill(229,39,52);
}
int a=0;
void draw(){
  background(random(25),random(188),random(219));
  fill(181,196,94);
  triangle(a, 18, 18, 360, a, 380);;
  a=a+20;
  if(a>2000){
    fill(229,39,52);
    rect(0,0,600,600);
    a=0;
  }
}



