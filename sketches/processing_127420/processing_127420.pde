
int counter;

void setup() {  //setup function called initially, only once
  size(500,700);
  //head
  rect(125,75,200,100);
  fill(203,0,0);
  ellipse(200,115,30,30);
  ellipse(250,115,30,30);
  fill(247,237,22);
  ellipse(228,150,70,15);
  fill(0);
  line(192,150,263,150);
  
  //neck
  fill(255,255,255);
  rect(200,175,50,45);
  
  //body
  rect(130,210,190,165);
  fill(47,170,0);
  ellipse(150,235,15,15);
  fill(100,100,245);
  ellipse(175,235,15,15);
  fill(200,167,50);
  ellipse(164,252,15,15);
  fill(255,0,0);
  rect(250,235,10,10);
  rect(270,235,10,10);
  rect(250,255,10,10);
  rect(270,255,10,10);
  rect(260,245,10,10);
  fill(237,100,106);
  rect(260,235,10,10);
  rect(250,245,10,10);
  rect(270,245,10,10);
  rect(260,255,10,10);
  fill(78,100,248);
  ellipse(155,355,15,15);
  fill(250,68,115);
  rect(285,349,13,13);
  fill(0,0,255);
  ellipse(228,305,75,75);
  fill(208,53,106);
  ellipse(228,305,68,68);
  fill(156,50,206);
  arc(228,305,50,50,PI,HALF_PI);
  
  //arm
  fill(0);
  strokeWeight(8);
  line(130,286,60,150);
  line(322,286,385,150);
  
  //skirt
  strokeWeight(1);
  fill(150,54,208);
  quad(130,375,100,465,350,465,322,375);
  
  //legs
  strokeWeight(9);
  line(205,466,205,550);
  line(255,466,255,550);
  strokeWeight(1);
  
 //Antenna 
 strokeWeight(2);
 line(200,75,175,40);
 line(260,75,285,40);
 fill(255,255,255);
 ellipse(175,40,10,10);
 ellipse(285,40,10,10);
 //noStroke();
 fill(0,0,255);
 line(180,40,190,50);
 line(190,50,200,40);
 line(200,40,210,50);
 line(210,50,220,40);
 line(220,40,230,50);
 line(230,50,240,40);
 line(240,40,250,50);
 line(250,50,260,40);
 line(260,40,270,50);
 line(270,50,280,40);
 
 
  
  
  
}
