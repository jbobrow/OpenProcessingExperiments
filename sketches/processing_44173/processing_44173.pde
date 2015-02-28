
Wave waveA;
Wave waveB;
Wave waveC;
void setup(){
  size(500,400);
  waveA=new Wave(10,300,6,0,50);
  waveB=new Wave(90,200,6,-10,100);
  waveC=new Wave(300,100,6,10,70);
  
}

void draw(){
  background(0);
  waveA.move();
  waveA.bounce();
  waveA.display();
  waveB.move();
  waveB.bounce();
  waveB.display();
  waveC.move();
  waveC.bounce();
  waveC.display();

}


  
  

