
void setup(){
  size(500,400);
  background(255,255,255);
}

void draw(){
  strokeWeight(10);
  noFill();
//  round 1
  stroke(0,122,201);//blue
  arc(100,100,120,120,0,TWO_PI);
  stroke(255,161,0);//yellow
  arc(100+64+5,100+60,120,120,0,TWO_PI);
  stroke(0,0,0);//black
  arc(100+128+15,100,120,120,0,TWO_PI);
  stroke(0,155,58);//green
  arc(100+192+20,100+60,120,120,0,TWO_PI);
  stroke(225,14,73);//red
  arc(100+256+30,100,120,120,0,TWO_PI);
//  round 2
  stroke(0,122,201);//blue
  arc(100,100,120,120,-PI/3,PI/3);
  stroke(255,161,0);//yellow
  arc(100+64+5,100+60,120,120,PI-PI/6,PI+PI/3);
  arc(100+64+5,100+60,120,120,PI+PI/2,PI+PI/2+PI/3);
  stroke(0,0,0);//black
  arc(100+128+15,100,120,120,PI/2,PI/2+PI/3);
  arc(100+128+15,100,120,120,-PI/6,PI/3);
  stroke(0,155,58);//green
  arc(100+192+20,100+60,120,120,PI-PI/6,PI+PI/3);
  arc(100+192+20,100+60,120,120,PI+PI/2,PI+PI/2+PI/3);
  stroke(225,14,73);//red
  arc(100+256+30,100,120,120,PI/2-PI/6,PI/2+PI/3);
}



