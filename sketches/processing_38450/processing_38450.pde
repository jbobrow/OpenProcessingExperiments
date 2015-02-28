
//Project One: Variation of Retrospective by Sol LeWitt
//Melissa Diamond

void setup () {
  size(500, 500);
  smooth();
  noStroke();
  background(0);
  
  noFill();                          //controls initial rectangle outline
  stroke(50);
  rect(20,20,200,200);
  rect(20,260,200,200);
  rect(250,20,40,440);
  rect(320,20,160,440);
}
  
void draw () {
}

void mousePressed() {                 //controls the color-changing rectabgles
  background(0);
  noStroke();
  
  for(int x=20;x<220;x+=40){          //top left square
    randomColor();
    rect(x,20,40,200);
  }
  for(int y=20;y<440;y+=440){          //slim middle rectangle
    randomColor();
    rect(250,y,40,440);
  }
  for(int z=260;z<430;z+=40){         //bottom left square
    randomColor();
    rect(20,z,200,40);
  }
  for(int a=320;a<480;a+=40){         //controls right rectangle 
    randomColor();
    rect(a,20,40,440);
  }
}

void randomColor() {
  int randomNum = floor(random(1,6));
  
  if(randomNum == 1){
    fill(245,60,50);                //red
  }; 
  if(randomNum == 2) {
    fill(230,175,105);              //orange
  }; 
  if(randomNum == 3) {
    fill(100,125,170);              //blue
  };
  if(randomNum == 4) {
    fill(145,167,100);              //green
  };
  if(randomNum == 5){
    fill(155,140,130);              //brown
  };
  if(randomNum == 6){
    fill(250,250,130);              //yellow
  };
}


