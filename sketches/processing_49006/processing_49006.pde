
//全域變數
int nPetal = 5;  //花辦數
int numP = 10;    //子辦數
float tt = 0.0;  //旋轉角度值
float deltaT = 0.02; //>0 順時針轉
int nflower = 5;//畫五朵花 
float[] x = { 50, 150, 200, 300, 450 };
float[] y = { 400, 500, 550, 300, 150 };

void setup(){
 size(400,400); 
 
 frameRate(20);
 noFill();
 stroke(230);
}

void petal(){    //單位形
  pushMatrix();
  for (int i=0; i<numP; i++){
    float s = map(i,0,numP,2,5);//比例
    beginShape();
    vertex(0,0);
    bezierVertex(5*s,   8*s, 5*s, 40*s, 10*s,   8*s);
    bezierVertex(5*s, 15*s, 40*s,  8*s, 20*s,   2*s );
    bezierVertex(5*s,  8*s, 40*s, -10*s, 20*s,  -5*s);
    bezierVertex(4*s, -8*s, 15*s,-15*s, 10*s,  -3*s);
    bezierVertex(1*s, -30*s, 5*s, -20*s,    0,     0);
    endShape();
  }
  popMatrix(); 
}

void oneflower(float xx,float yy){
  pushMatrix();
  translate(xx, yy);
  for (int i=0; i<nflower; i++){
     //stroke(map(i,0,nPetal, 0,255), 125,0);
     float theda=map(i,0,nPetal,0,TWO_PI);
     pushMatrix(); 
     rotate(theda+tt);
     petal();
     popMatrix();
  }
  popMatrix();
  tt += deltaT;
}

void draw(){       //整體造型
  background(21,100,150);
  line(10, 400,10,100);
  line(60, 500,60,200);
  line(100, 600,100,60);
  line(110, 600,110,335);
  line(30, 280,30,400);
    line(210, 500,210,200);
      line(382, 400,382,100);
      line(350, 350,350,400);
      line(330, 250,330,400);
       line(230, 310,230,400);
      ellipse(400,10,80,80);
       ellipse(400,10,90,90);
      ellipse(330,30,70,70);
      ellipse(50,300,50,50);
      ellipse(355,350,40,40);
      ellipse(100,90,30,30);
      ellipse(30,30,20,20);
       ellipse(250,30,5,5);
        ellipse(280,380,5,5);
         ellipse(335,340,15,15);
       ellipse(280,80,10,10);
  for (int i=0; i<nflower; i++){
    pushMatrix();
    float ss = map(i,0,nflower, 0.25, 1);
    scale(ss);
    oneflower(x[i],y[i]);
    popMatrix();
  }
}


