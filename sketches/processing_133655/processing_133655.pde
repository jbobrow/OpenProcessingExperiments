
void setup(){
  size(600,400);
  //pink background
  background(233,156,245);
  //separate areas into functions
  bgarea();
  castle();
  roof();
  detail();
  save("peachCastle.jpg");
}
void bgarea(){
  stroke(26,152,11);
  fill(24,170,17);
  //hills in background
  arc(100,height,500,300,PI,2*PI);
  arc(500,height,500,300,PI,2*PI);
  //grass in front
  rect(0,height-10,width,10);
  //path
  stroke(180,242,39);
  fill(227,229,104);
  rect(0,height-30,width,20);
  //fence
  stroke(193,163,105);
  fill(209,164,80);
  rect(0,height-40,width,10);
  //moat
  stroke(48,65,129);
  fill(72,91,162);
  rect(0,height-60,width,20);
}
void castle(){
  //core of castle
  stroke(175,175,175);
  fill(206,206,206);
  rect(120,height-220,350,160);
  rect(250,height-60,80,20);
  rect(250,30,80,100);
  //different fills to show depth
  fill(188,188,188);
  rect(100,height-240,80,180);
  rect(400,height-240,80,180);
  rect(250,height-120,80,60);
  rect(230,height-320,120,100);
}
void roof(){
  //red parts of the roof
  stroke(195,31,0);
  fill(227,74,23);
  triangle(100,height-240,140,height-280,180,height-240);
  triangle(400,height-240,440,height-280,480,height-240);
  triangle(250,30,290,0,330,30);
  rect(180,height-240,220,50);
  quad(230,height-320,250,height-330,330,height-330,350,height-320);
  quad(200,height-240,230,height-260,350,height-260,380,height-240);
  //gray area in front
  stroke(175,175,175);
  fill(188,188,188);
  rect(260,height-210,60,50);
  triangle(260,height-210,290,height-250,320,height-210);
}
void detail(){
  //portrait on front of castle
  stroke(229,109,189);
  fill(237,165,213);
  ellipse(290,height-190,40,50);
  //front door
  stroke(152,73,8);
  fill(188,92,13);
  rect(280,height-80,20,20);
  //windows
  stroke(193,163,105);
  fill(209,164,80);
  rect(130,height-190,20,20);
  rect(190,height-170,20,20);
  rect(230,height-170,20,20);
  rect(330,height-170,20,20);
  rect(370,height-170,20,20);
  rect(430,height-190,20,20);
  rect(190,height-120,20,20);
  rect(370,height-120,20,20);
  rect(280,100,20,20);
  rect(280,40,20,20);
  //flags at peaks
  stroke(209,0,0);
  fill(252,0,0);
  rect(140,height-290,20,10);
  rect(440,height-290,20,10);
}


