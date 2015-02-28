
float angle= 0.0;
float speed= 0.5;
float radA =100.0;
float radB =50.0;
float colorA =(0);
float colorB =(250);
float colorC =(255);

void setup(){
size (800,800);
smooth();
//frameRate(1);
background(255,205,0);
}

void mouseClicked(){
 for(int j=0; j<750; j+=30){
   noFill();
   stroke(colorA,colorB,colorC);
   strokeWeight(.5);
   ellipse(525,450,j+2,j+2);
  
  }
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
    y--;}  rotateY(PI/3.0);
    
  line(mouseX,mouseY,mouseX+(random(50)),mouseY+(random(50)));
  line(mouseX,mouseY,mouseX-(random(50)),mouseY-(random(50)));
  line(mouseX,mouseY,mouseX+(random(50)),mouseY-(random(50)));
  line(mouseX,mouseY,mouseX-(random(50)),mouseY+(random(50)));
    
  //line(mouseX,mouseY,mouseX+(random(50)),mouseY+(random(50)));
  //line(mouseX,mouseY,mouseX-(random(50)),mouseY-(random(50)));
  //line(mouseX,mouseY,mouseX+(random(50)),mouseY-(random(50)));
  //line(mouseX,mouseY,mouseX-(random(50)),mouseY+(random(50)));
  line(mouseX,mouseY,x,y);
  radB=(radB-2);
  
  if (frameCount>=700&&frameCount<=999){
   colorA=(colorA+254);
   colorB=(colorB-250);
  }
  if (frameCount>700){
   colorA=(colorA+1);
   colorB=(colorB+205);
  }

  }
  
  void keyPressed(){
  if(key == 'a'){
  background(255,205,0);
  }else if(key =='s'){
  background(255,249,198);
}

  } 

