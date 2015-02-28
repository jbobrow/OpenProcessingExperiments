
float angle= 0.0;
float speed= 0.5;
float radA =100.0;
float radB =50.0;


void setup(){
size (800,800);
smooth();

background(255,0,0);
}

void draw(){
  println(frameCount);
  //background(255,0,0);
  //if(mousePressed=
  //translate(1,1);
  angle += speed;
  float sinval = sin(angle);
  float cosval = cos(angle);
  float x = 10*(cosval*radB);
  float y = 10*(sinval*radB);
    if(x>100){
    x--;}
    if(y>100){
    y--;}
  line(mouseX,mouseY,mouseX+(random(50)),mouseY+(random(50)));
  line(mouseX,mouseY,mouseX-(random(50)),mouseY-(random(50)));
  line(mouseX,mouseY,mouseX+(random(50)),mouseY-(random(50)));
  line(mouseX,mouseY,mouseX-(random(50)),mouseY+(random(50)));
  //line(mouseX,mouseY,x,y);
  radB=(radB-2);
  


  //rotateY(PI/3.0);
  //line(mouseX,mouseY,mouseX+(random(50)),mouseY+(random(50)));
  //line(mouseX,mouseY,mouseX-(random(50)),mouseY-(random(50)));
  //line(mouseX,mouseY,mouseX+(random(50)),mouseY-(random(50)));
  //line(mouseX,mouseY,mouseX-(random(50)),mouseY+(random(50)));
}

