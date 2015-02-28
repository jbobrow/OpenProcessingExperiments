

ArrayList flowerList;



class Flower {

  float posX, posY;
  int numPetals;
  float controlX, controlY;
  float spin, spinRate;
  color flowerCol;
  float centreSize;


  Flower() {

    posX=random(width);
    posY=-100;
    numPetals=int(random(4, 8));
    controlY=random(-90, -20);
    controlX=random(-30, -10);
    if (controlX<controlY/2) controlX=controlY/2;
    if (controlX>-10) controlX=-10;
    spin=0;

    
    do {
      spinRate=random(-0.015, 0.015);
    }
    while (abs (spinRate)<0.005);
    flowerCol=color(100+random(150), 100 + random(150), 100+random(150));
    centreSize=random(10,20);
  } 

  void drawFlower() {

    // centre drawing 
    translate(posX, posY);
    fill(flowerCol, 200);
    for (int i=0;i<numPetals;i++) { 

      pushMatrix();
      rotate(radians(i*360/numPetals));
      rotate(spin);
      bezier(0, -100, controlX, controlY, controlX, controlY, 0, 0);    
      bezier(0, -100, -controlX, controlY, -controlX, controlY, 0, 0); 
      popMatrix();
    }
    fill(180, 180, 80, 255);
    stroke(150, 150, 60);
    ellipse(0, 0, centreSize, centreSize);
    noStroke();
    //reset
    translate(-posX, -posY);
  }
  

  void updateFlower() {
    spin+=spinRate;
    posY+=1;
    if (posY>height+100) {
      posY=-100;
      posX=random(width);
      do {
        spinRate=random(-0.015, 0.015);
      }
      while (abs (spinRate)<0.005);
    }
    if(abs(mouseX-posX)<10 && abs(mouseY-posY)<10 && abs(spinRate)<0.05) spinRate*=1.025;
    
  }
}//end class





void setup() {

  size(800, 600); 

  noStroke();

  //init list with one item  
  flowerList=new ArrayList();
  flowerList.add(new Flower());
}



void draw() {


  background(0);

  //draw and update all in list 
  for (int i=0; i<flowerList.size(); i++) {
    Flower temp=(Flower)flowerList.get(i);
    temp.updateFlower();
    temp.drawFlower();
  }

  if (random(1)>0.988 && flowerList.size()<20)flowerList.add(new Flower());
}



