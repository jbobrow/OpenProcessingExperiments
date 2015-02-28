
Maxim maxim;
AudioPlayer player;
boolean mouseFlag=false;
float x=400;
float y=400;
float shakeReducer=0.4;
float iter;

void setup() {


  size(800, 800);
  background(0);
  smooth();
  noFill();
  noStroke();

  maxim=new Maxim(this);
  player=maxim.loadFile("bells.wav");
  player.setLooping(true);
  player.volume(0.9);
  player.play();
}


void draw() {

  fill(0, 10);
  strokeWeight(0);
  stroke(0, 0, 0, 0);
  rect(-5, -5, width+10, height+10);



  //  first
  strokeWeight(1);
  beginShape();
  for (int i=0;i<360;i+=40) {
    stroke(random(200)+55, 100, 0);
    vertex((mouseX)+(random(10*shakeReducer)+5)*cos(radians(i)), (mouseY)+(random(10*shakeReducer)+5)*sin(radians(i)));
  } 
  endShape(CLOSE);
  beginShape();
  for (int i=0;i<360;i+=30) {
    stroke(random(100)+155, 0, 0);
    vertex(mouseX+(random(20*shakeReducer)+5)*cos(radians(i)), mouseY+(random(20*shakeReducer)+5)*sin(radians(i)));
  } 
  endShape(CLOSE);
  //strokeWeight(1);

  beginShape();
  for (int i=0;i<360;i+=20) {

    stroke(200, 200, 0);
    vertex(mouseX+(random(40*shakeReducer)+15*shakeReducer)*cos(radians(i)), mouseY+(random(40*shakeReducer)+15*shakeReducer)*sin(radians(i)));
  } 

  endShape(CLOSE);
  beginShape();
  stroke(150, 75, 0, 50);
  for (int i=0;i<360;i+=50) {

    vertex(mouseX+(random(20*shakeReducer)+20*shakeReducer)*cos(radians(i)), mouseY+(random(20*shakeReducer)+20*shakeReducer)*sin(radians(i)));
  } 
  endShape(CLOSE);



  //  second


  strokeWeight(1);
  beginShape();
  for (int i=0;i<360;i+=40) {
    stroke(random(200)+55, 100, 0);
    vertex((width-mouseX)+(random(10*shakeReducer)+5)*cos(radians(i)), (height-mouseY)+(random(10*shakeReducer)+5)*sin(radians(i)));
  } 
  endShape(CLOSE);

  beginShape();
  for (int i=0;i<360;i+=30) {
    stroke(random(100)+155, 0, 0);
    vertex((width-mouseX)+(random(20*shakeReducer)+5)*cos(radians(i)), mouseY+(random(20*shakeReducer)+5)*sin(radians(i)));
  } 
  endShape(CLOSE);
  //strokeWeight(1);
  beginShape();
  stroke(150, 75, 0, 50);
  for (int i=0;i<360;i+=50) {

    vertex((width-mouseX)+(random(20*shakeReducer)+20*shakeReducer)*cos(radians(i)), mouseY+(random(20*shakeReducer)+20*shakeReducer)*sin(radians(i)));
  } 
  endShape(CLOSE);
  beginShape();
  for (int i=0;i<360;i+=20) {

    stroke(10, 200, 200);
    vertex((width-mouseX)+(random(40*shakeReducer)+20*shakeReducer)*cos(radians(i)), mouseY+(random(40*shakeReducer)+20*shakeReducer)*sin(radians(i)));
  } 

  endShape(CLOSE);



  //  third


  strokeWeight(1);
  beginShape();
  for (int i=0;i<360;i+=40) {
    stroke(random(200)+55, 100, 0);
    vertex((width-mouseX)+(random(10*shakeReducer)+5)*cos(radians(i)), (height-mouseY)+(random(10*shakeReducer)+5)*sin(radians(i)));
  } 
  endShape(CLOSE);


  beginShape();
  for (int i=0;i<360;i+=30) {
    stroke(random(100)+155, 0, 0);
    vertex((width-mouseX)+(random(20*shakeReducer)+5)*cos(radians(i)), (height-mouseY)+(random(20*shakeReducer)+5)*sin(radians(i)));
  } 
  endShape(CLOSE);


  beginShape();
  stroke(150, 75, 0, 50);
  for (int i=0;i<360;i+=50) {
    vertex((width-mouseX)+(random(20*shakeReducer)+20*shakeReducer)*cos(radians(i)), (height-mouseY)+(random(20*shakeReducer)+20*shakeReducer)*sin(radians(i)));
  } 
  endShape(CLOSE);

  beginShape();
  for (int i=0;i<360;i+=20) {
    stroke(100, 0, 150);
    vertex((width-mouseX)+(random(40*shakeReducer)+20*shakeReducer)*cos(radians(i)), (height-mouseY)+(random(40*shakeReducer)+20*shakeReducer)*sin(radians(i)));
  } 
  endShape(CLOSE);









  //  fourth


  strokeWeight(1);
  beginShape();
  for (int i=0;i<360;i+=40) {
    stroke(random(200)+55, 100, 0);
    vertex((width-mouseX)+(random(10*shakeReducer)+5)*cos(radians(i)), (height-mouseY)+(random(10*shakeReducer)+5)*sin(radians(i)));
  } 
  endShape(CLOSE);
  beginShape();
  for (int i=0;i<360;i+=30) {
    stroke(random(100)+155, 0, 0);
    vertex((mouseX)+(random(20*shakeReducer)+5)*cos(radians(i)), (height-mouseY)+(random(20*shakeReducer)+5)*sin(radians(i)));
  } 
  endShape(CLOSE);
  beginShape();
  stroke(150, 100, 0, 50);
  for (int i=0;i<360;i+=50) {

    vertex((mouseX)+(random(20*shakeReducer)+20*shakeReducer)*cos(radians(i)), (height-mouseY)+(random(20*shakeReducer)+20*shakeReducer)*sin(radians(i)));
  } 
  endShape(CLOSE);
  beginShape();
  for (int i=0;i<360;i+=20) {

    stroke(0, 200, 50);
    vertex((mouseX)+(random(40*shakeReducer)+20*shakeReducer)*cos(radians(i)), (height-mouseY)+(random(40*shakeReducer)+20*shakeReducer)*sin(radians(i)));
  } 

  endShape(CLOSE);


  float alf = dist(mouseX, mouseY, width/2, height/2);


  for (int i=0;i<5;i++) {
    strokeWeight(random(9));
    stroke(255-i*10, 200+i*10, random(100), 255-alf);
    point(width/2+(i*7+50)*cos(radians(iter+i*5)), height/2+(i*7+50)*sin(radians(iter+i*5)));
    iter+=2;
  }



  if (mouseFlag==true) {
    if (shakeReducer>0) {
      shakeReducer*=.99;
    }
  } 
  else {
    if (shakeReducer<0.6) {
      shakeReducer*=1.1;
    }
  }
  float  vol = map(mouseX, 0, width, 0, 0.9);
  player.volume(vol);
  player.speed((float) mouseX/width/2);
}



void mousePressed() {
  mouseFlag=true;
}

void mouseReleased() {
  mouseFlag=false;
}



