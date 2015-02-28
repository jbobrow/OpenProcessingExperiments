
Car[] traffic = new Car[100];

void setup(){
//  background(20);
  size(1600,300);
  for(float i=0;i<10;i++){
    for(float j=0;j<10;j++){
      traffic[int(i)+int(j)*10]= new Car(20+100*j, i*30+5, floor(random(3))+i+1, 1, color(random(200)+55,random(200)+55,random(200)+55));
    }  
  }
}

void draw(){
  background(20);
  for(int i=0;i<100;i++){
    traffic[i].drive();
  }
}

class Car {
  float xPos, yPos;
  float xVol, yVol;
  float size;
  color c;
  Car(float iniX, float iniY, float iniSpeed, float iniSize, color iniC){
    xPos=iniX;
    yPos=iniY;
    xVol=iniSpeed;
    size=iniSize;
    c=iniC;
  }
  void drive(){
    fill(c);
    xPos=xVol+xPos;
    rect(xPos,yPos,40*size,20*size);
    if(xPos>width){
      xPos=0;
    }
  }
}
