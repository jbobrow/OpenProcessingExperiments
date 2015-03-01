
PVector pos;
float rot;
float timer;
void setup() {
  frameRate(100);
  size(600, 600);
  pos = new PVector(width/2,height/2);
  background(150);
  timer =  0;
}

void draw() {
  timer = timer+1;
  //println(timer);
  if(timer == 100){
    timer = 0;
   // println(timer);
  }
    
  //fill(175, rot/5, 255,1);
  noStroke();
  //ellipse(100, 100, 100, 100);

  pushMatrix();
  translate(pos.x, pos.y);
  rotate(radians(rot*10));
  rot = second();
  
  rectMode(CENTER);
   fill(map(rot,0,60,0,255), map(timer,0,100,0,255), map(rot,0,60,0,120),2);
  rect(0+rot/10,0 + rot/10,hour()*2,hour()*2);
  popMatrix();

pos.x = map(second(),0,60,10,590);//+random(-2,2);
pos.y = map(minute(),0,60,10,590);//+random(-10,2);


}
