
int x=0;//variable 1
int dir=1;//variable 2
int lr=10;//variable 3

void setup(){//start setup
  size(600,250);//size
  noStroke();//no stroke
}//end setup
void draw(){//start draw
  background(0);//black
  fill(200, 167, 231);// purple
  rect(50+x, 100, 10, 100);//line 1
  rect(60+x, 70, 10, 140);//line 2
  rect(70+x, 60, 10, 150);//line 3
  rect(80+x, 50, 10, 150);//line 4
  rect(90+x, 50, 10, 140);//line 5
  rect(100+x, 40, 10, 160);//line 6
  rect(110+x, 40, 10, 170);//line 7
  rect(120+x, 40, 10, 170);//line 8
  rect(130+x, 40, 10, 160);//line 9
  rect(140+x, 50, 10, 140);//line 10
  rect(150+x, 50, 10, 150);//line 11
  rect(160+x, 60, 10, 150);//line 12
  rect(170+x, 70, 10, 140);//line 13
  rect(180+x, 100, 10, 100);//line 14
  //eyes
  fill(255);//white
  rect(80+x, 70, 20, 50);//part 1a
  rect(70+x, 80, 40, 30);// part 2a
  rect(140+x, 70, 20, 50);//part 1b
  rect(130+x, 80, 40, 30);//part 2b
  //pupils
  fill(0,0,255);//blue
  rect(lr+80+x, 90, 20, 20);// rect 1
  rect(lr+140+x, 90, 20, 20);//rect 2
  x=x+dir;//move
}//end draw

void mousePressed(){//when mouse click
  dir=0-dir;//direction change
  lr=0-lr;//pupil move
}//end mouse

