

float aS[] = {5,50};
float bS[] = {10,30};
float cS[] = {15,50};
float red[] = {100,255};
float grn[] = {50,255};
float blu[] = {200,255};
int x1 = 50;
int y1 = 50;
int rowNum = 0;
int counter = 0;

Flower[] myFlower = new Flower[25];

void setup() {
background(0);
  size(500,500);
  for (int i = 0; i < myFlower.length; i ++ ) {
    myFlower[i] = new Flower(
      random(aS[0],aS[1]),
      random(bS[0],bS[1]),
      random(cS[0],cS[1]),
      random(red[0],red[1]),
      random(grn[0],grn[1]),
      random(blu[0],blu[1])
    );
}
 background(0);
  for (int i = 0; i < myFlower.length; i ++ ){
    pushMatrix();
    translate(50,0);
    x1 = 100 * counter;
    counter++;
    myFlower[i].run();
    popMatrix();
    if (counter == 5){
      y1 = y1 + 100;
      counter = 0; 
    }
  }
}


class Flower {
  float aS;
  float bS;
  float cS;
  float red;
  float grn;
  float blu;

  Flower(float _aS, float _bS,  float _cS, float _red, float _grn, float _blu){
    aS = _aS;
    bS = _bS;
    cS = _cS;
    red = _red;
    grn = _grn;
    blu = _blu;
  }

  void run() {
    display();
  }

  void display() {
    noStroke();
    
fill(255,230,20);
rectMode(CENTER);
rect(x1,y1,aS,cS);


    fill(90, 240, blu);
    ellipse(x1, y1, bS, aS);

    fill(210, grn, 255);
    ellipse(x1, y1, bS, aS);

fill (10,206,185);
rect(x1,y1,bS,aS);

    //center
    fill(255, 75, blu);
    ellipse(x1, y1, aS, cS);
  }

}


