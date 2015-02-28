
void setup() {
  size(854,480);
  smooth();
  background(125);
  ellipseMode(CENTER);
  rectMode(CENTER);
}

void draw() {
  noFill();
  ellipse(225,height/2+10,125,75);
  ellipse(630,height/2+10,125,75);
  noStroke();
  fill(125);
  rect(255,height/2+90,130,80);
  rect(600,height/2+90,130,80);
  noFill();
  stroke(0);
  arc(427,214,400,300,radians(180),radians(360));
  //ellipse(width/2,height/2,400,300);
  fill(125);
  arc(427,250,470,325,0,PI*1);
  noFill();
  arc(325,206,130,60,radians(180),radians(360));
  arc(525,206,130,60,radians(180),radians(360));
  arc(325,210,130,40,radians(180),radians(360));
  arc(525,210,130,40,radians(180),radians(360));
  fill(0);
  ellipse(320,183,15,15);
  ellipse(315,183,15,15);
  ellipse(325,183,15,15);
  ellipse(532,183,15,15);
  ellipse(527,183,15,15);
  ellipse(537,183,15,15);
  noFill();
  arc(285,125,60,60,radians(0),radians(90));
  arc(565,125,60,60,radians(90),radians(180));
  noFill
  ();
  arc(427,330,30,10,radians(180),radians(360));
  //ellipse(325,180,120,50);
  noStroke();
  fill(125);
  rect(305,height/2+25,130,80);
  rect(550,height/2+25,130,80);
  stroke(0);
  noFill();
  arc(250,270,50,50,radians(180),radians(270));
  arc(605,270,50,50,radians(270),radians(360));
  arc(427,260,360,70,0,PI*1);
  arc(width/2,height/2,50,30,radians(0),radians(180)); 
  arc(386,240,30,10,radians(0),radians(180));
  arc(468,240,30,10,radians(0),radians(180));
  
  
}


