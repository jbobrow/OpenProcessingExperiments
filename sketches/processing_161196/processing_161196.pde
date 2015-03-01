
int positionX=0;
int positionY=200;
float cerclebleu=150;
float cerclerouge=130;
float cerclevert=110;

void setup(){
  size(200,200);
  //noLoop();
}

void draw(){
  background(255);
  stroke(0);
  strokeWeight(1);
  line(positionX,0,100,100);
  line(positionX,10,100,100);
  line(positionX,20,100,100);
  line(positionX,30,100,100);
  line(positionX,40,100,100);
  line(positionX,50,100,100);
  line(positionX,60,100,100);
  line(positionX,70,100,100);
  line(positionX,80,100,100);
  line(positionX,90,100,100);
  line(positionX,100,100,100);
  line(positionX,110,100,100);
  line(positionX,120,100,100);
  line(positionX,130,100,100);
  line(positionX,140,100,100);
  line(positionX,150,100,100);
  line(positionX,160,100,100);
  line(positionX,170,100,100);
  line(positionX,180,100,100);
  line(positionX,190,100,100);
  line(positionX,200,100,100);
  line(100,100,positionY,200);
  line(100,100,positionY,190);
  line(100,100,positionY,180);
  line(100,100,positionY,170);
  line(100,100,positionY,160);
  line(100,100,positionY,150);
  line(100,100,positionY,140);
  line(100,100,positionY,130);
  line(100,100,positionY,120);
  line(100,100,positionY,110);
  line(100,100,positionY,100);
  line(100,100,positionY,90);
  line(100,100,positionY,80);
  line(100,100,positionY,70);
  line(100,100,positionY,60);
  line(100,100,positionY,50);
  line(100,100,positionY,40);
  line(100,100,positionY,30);
  line(100,100,positionY,20);
  line(100,100,positionY,10);
  line(100,100,positionY,0);

  fill(255,255,255,100);
  stroke(0,0,255);//cercle bleu
  strokeWeight(3);
  ellipse(100,100,cerclebleu,cerclebleu);

  fill(255,255,255,100);
  stroke(255,0,0);//cercle rouge
  strokeWeight(3);
  ellipse(100,100,cerclerouge,cerclerouge);

  fill(255,255,255,100);
  stroke(0,255,0);//cercle vert
  strokeWeight(3);
  ellipse(100,100,cerclevert,cerclevert);
  
  positionX = positionX+1;
  positionY = positionY-1;
  cerclebleu = cerclebleu-1;
  cerclerouge = cerclerouge-1;
  cerclevert = cerclevert-1;
}


