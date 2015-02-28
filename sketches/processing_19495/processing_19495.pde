
//开发进度：sinwave让四个角荡起来
float amplitude = 30;
float period = 5;
float now = 0;
int distA, distB, distC, distD, distE;

void setup(){
  size(600,600,P3D);
  frameRate(30);
  smooth();
}

void draw(){

camera(1000,1000,300,0,0,0,1,1,0);
  rotateZ(map(mouseX, 0, width, 0, -PI));

  background(255);
	
lights();

  stroke(0);
  fill(192,192,192,128);
  preVertex(1);
  drawOcta();
}

void preVertex(int mfConcen){
//BCDE
distA = int(sin(now/2)*amplitude);
distB = int(sin(now)*amplitude);
distC = int(sin(now+0.7)*amplitude);
distD = int(sin(now+1.4)*amplitude);
distE = int(sin(now+2.1)*amplitude);
if (int(now) > 90){now = 0;}else{now = now +(1/period);}
}

void drawOcta(){ //倒入BCI的concentration值
  beginShape(TRIANGLE_FAN);
    vertex(0,0,495 + distA);   //a
    vertex(350 + distB,350 + distB,0);   //b
    vertex(350 + distC,-350 - distC,0);   //c
    vertex(-350 -distD,-350 - distD,0);   //d
    vertex(-350 - distE ,350 + distE,0);   //e
    vertex(350 + distB,350 + distB,0);   //b
  endShape();
  beginShape(TRIANGLE_FAN);
    vertex(0,0,-495);   //f
    vertex(350 + distB ,350 + distB,0);    //b
    vertex(350 + distC ,-350 - distC,0);    //c
    vertex(-350 - distD ,-350 - distD,0);   //d
    vertex(-350 - distE ,350 + distE,0);   //e
    vertex(350 + distB ,350 + distB,0);    //b
  endShape();
}

