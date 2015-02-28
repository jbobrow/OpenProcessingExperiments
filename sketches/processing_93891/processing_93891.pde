
Molec[] molecs;
float d[];
float moveX[];
float moveY[];
float addx[];
float addy[];
PVector[] mover;
 
 
void createmolec(int amt) {
 
  molecs = new Molec[amt];
 
  for (int i = 0; i < amt; i++) {
 
    molecs[i] = new Molec(random(width), random(height),0,0);
  }
}
 
 
void setup() {
  size(500, 500);
  createmolec(100);
}
 
 
void draw() {
 
  background(255);
 
  for (int i = 0; i < molecs.length; i++) {
    molecs[i].update();
    molecs[i].attract();

    
    for (int j = 0; j < molecs.length; j++) {
      mover[j] = new PVector(0, 0);
    }
  }
}

class Molec
{
  float xPos, yPos, xPos2, yPos2, mox, moy, a, near, near2;
  boolean on2;
  boolean buttonon;
  boolean mmouse;
  float mouseTime = 5;

  Molec(float x, float y, float t, float t2) {
    xPos = x;
    yPos = y;
    near = t;
    near2 = t2;
    a = 10;
  }


  void update() {

    smooth();

    if ((dist(xPos, yPos, mouseX, mouseY)<=10)&&(mousePressed)&&(buttonon==false)&&(mmouse==false)) {
      buttonon=true;
      mmouse= true;
      mouseTime = 5;
    }

    if ((buttonon==true)&&(mousePressed)&&(mmouse==false)) {
      buttonon=false;
       mmouse = true;
       mouseTime = 5;
    }
    
    if (mmouse == true){
      mouseTime -= 1;
    }
      

    if (buttonon==true) {
      fill(0);
      xPos=mouseX;
      yPos=mouseY;
    }
    else {
      noFill();
    }

    strokeWeight(1);
    stroke(0, 0, 0, 100);
    ellipse(xPos, yPos, a, a);
    //    ellipse(xPos, yPos, 100,100);
  }

  void attract() {

    mover = new PVector[molecs.length];
    addx = new float[molecs.length];
    addy = new float[molecs.length];
    moveX = new float[molecs.length];
    moveY = new float[molecs.length];

    for (int i = 0; i < molecs.length; i++) {
      mover[i] = new PVector(0, 0);
      near = dist(xPos, yPos, molecs[i].xPos, molecs[i].yPos);

      if ((near<=100)) {


        moveX[i] = xPos - molecs[i].xPos;
        moveY[i] = yPos - molecs[i].yPos;

        mover[i].set(moveX[i], moveY[i], 0);

        if (mover[i].mag()!=0) {
          if (100/mover[i].mag()<=20){
          strokeWeight(100/mover[i].mag());
          }
          stroke(0, 0, 255, 10);
          line(xPos, yPos, molecs[i].xPos, molecs[i].yPos);
          addx[i] = mover[i].x/mover[i].mag();
          addy[i] = mover[i].y/mover[i].mag();
        }
      }
      if (near>=10) {
        xPos-=addx[i]/100;
        yPos-=addy[i]/100;
      }
      else {
        xPos+=addx[i];
        yPos+=addy[i];
      }
    }
    if (mouseTime <= 0){
     mmouse=false;
    }
  }

 
}



