
int Score = 0;

float ZoneCenterX, ZoneSpeed, OuterZoneWidth, InnerZoneWidth;

color clr = color(186,186,115);
color clr2 = color(46,118,56);

void setup(){

  size(540,200);
  
  smooth();
  frameRate(60);
  
  ZoneCenterX = 0;
  ZoneSpeed = 1.5;
  InnerZoneWidth = width/50;
  OuterZoneWidth = width/15.0;

}

void draw(){

  ZoneCenterX += ZoneSpeed;
  
  if(ZoneCenterX > width)
    ZoneCenterX = 0;
    
  background(255,255,255);
  noStroke();
  fill(clr);
  rect(ZoneCenterX - OuterZoneWidth/2, 0, OuterZoneWidth , height);
  fill(clr2);
  rect(ZoneCenterX - InnerZoneWidth/2,0,InnerZoneWidth,height);

}

void mousePressed(){

  float distance = ZoneCenterX - mouseX;
  //if(distance < 0) distance = -distance;
  
  distance = abs(distance);
  
  if(distance < InnerZoneWidth /2){
  
    Score += 20;
    clr2 = color(random(0,255),random(0,255),random(0,255));
    
 //   println("BULLS EYE! ");
  }else if(distance < OuterZoneWidth/2){
    Score += 5;
    clr = color(random(0,255),random(0,255),random(0,255));
  }else{
  //  println("oops");
    Score -= 5;
  }
  
//  println(Score);
}
