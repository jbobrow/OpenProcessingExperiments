

Nodule[] nodules = new Nodule[1];//nb répétition de la courbe
float inc;
float val;
float speed;
float x;
int dir1;
float ry = 10;
float zinc;

void setup() {
  size(1024,600);     
  colorMode(HSB,100); 
  smooth();
  for (int i = 0; i<= nodules.length-1; i++)
  { 
    nodules[i] = new Nodule();
  }
}

void draw() {
  background(0);
  zinc = .005;   
  ry += zinc;
  if(ry <= 1 || ry >= 30) {
    zinc*=-1;
  }

  //ry += inc;
  frameRate(ry);
  println("ry : "+ry);
  background(10);


  for(int i = 0;i <= nodules.length-1; i++)
  {  
    nodules[i].display();
    //nodules[4].move();
  }
}
class Nodule {  
  //variables centre w, centre h, direction
  int cw = width/2; 
  int ch = height/2;
  float dir1 = .3;
  float dir2 = .2;
  //variable tremble
  float rd = random(-10,10);
  float inc = .05;
  float x = noise(width)*width; 
  float y = noise(height)*height;
  //float xpt1 = random(width/2-100,width/2+100);
  float xpt1 = cw;
  float ypt1 = 50;
  float rep = 1;

  //%%%%%%%%%%
  void display() {
    //balayage haut et bas
    xpt1 -= dir1;
    if(xpt1 <= cw-100 || xpt1 >= cw+100) {
      dir1 *=-1;
    }

    //incrémente épaisseur de trait
    //rep += inc;if (rep > 36 || rep <= .2) {inc*=-1;}
    rep = random(1,8);
    // alpha - quand rep +
    int alph = 80;
    //color c =color(noise(100)*100+inc,alph/2,100,alph);
    color c =color(random(100),100,random(100),alph);


    //TRACÉ
    noFill();
    stroke(c);
    strokeWeight(rep);
    println("rep :" +rep);
    beginShape();
    curveVertex(xpt1+200,height+200);
    curveVertex(xpt1+200,height+200);//bas out
    curveVertex(xpt1-random(10),height-random(100));//cuisses
    //curveVertex(xpt1+rd,height-50);
    curveVertex(x-random(-100,100)-rd,height/2+rd);
    curveVertex(x-random(-100,100)-rd,height/3+rd);
    curveVertex(x-random(-100,100)-rd,height/6+rd);
    //curveVertex(xpt1+rd,50);//point 5
    curveVertex(xpt1+rd,50);//point 5
    //endShape();
    //curveVertex(xpt1+rd,30);
    //beginShape();
    //curveVertex(xpt1,50-rd);//point 1
    curveVertex(xpt1-rd,50-rd);//point 1
    curveVertex(x+random(-100,100)+rd,height/6+rd);//point 2
    curveVertex(x+random(-100,100)+rd,height/3+rd);//point 3
    curveVertex(x+random(-100,100)+rd,height/2+rd);//point 4
    curveVertex(xpt1+random(10),height-random(100));//cuisses
    //curveVertex(xpt1+rd,height-50);//point 5
    curveVertex(xpt1-200-rd,height+200);//bas out
    curveVertex(xpt1-200-rd,height+200);
    endShape();


    //}
    //}
  }
  // void move(){ x++;}
}


