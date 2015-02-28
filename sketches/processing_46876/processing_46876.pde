
Molec[] molecs;
float d[];
float moveX[];
float moveY[];
float addx[];
float addy[];
PVector[] mover;


void createmolec(int amt) {

  molecs = new Molec[amt];
  d = new float[amt];
  moveX = new float[amt];
  moveY = new float[amt];

  for (int i = 0; i < amt; i++) {

    molecs[i] = new Molec(random(width), random(height));
  }
}


void setup() {
  size(500, 500);
  createmolec(1000);
}


void draw() {

  background(255);

  for (int i = 0; i < molecs.length; i++) { 
    molecs[i].isnear();
    mover = new PVector[molecs.length];
    addx = new float[molecs.length];
    addy = new float[molecs.length];


    for (int j = 0; j < molecs.length; j++) {
      mover[j] = new PVector(0, 0);
      d[j] = dist(molecs[i].xPos, molecs[i].yPos, molecs[j].xPos, molecs[j].yPos);


//if ((d[j]<=100)&&(d[j]>=21)) {
//  
//  strokeWeight(0.1);
//        stroke(255, 0, 0, 100);
//        line(molecs[i].xPos, molecs[i].yPos, molecs[j].xPos, molecs[j].yPos);
//        
//}
      if ((d[j]<=100)) {
        

        moveX[j] = molecs[i].xPos - molecs[j].xPos;
        moveY[j] = molecs[i].yPos - molecs[j].yPos;

        mover[j].set(moveX[j], moveY[j], 0);

        if (mover[j].mag()!=0) {

          addx[j] = mover[j].x/mover[j].mag();
          addy[j] = mover[j].y/mover[j].mag();
        }
      }
      if (d[j]>=10) {
        molecs[i].xPos-=addx[j]/100;
        molecs[i].yPos-=addy[j]/100;
      }
      else {
        molecs[i].xPos+=addx[j];
        molecs[i].yPos+=addy[j];
      }
    }
  }
}


