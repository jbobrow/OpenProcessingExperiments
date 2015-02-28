
void setup() {
  size (400,300);
  smooth();
  
}

void draw(){
  stroke(170,162,155);
  strokeWeight(5);
  line(180,140,190,160);
  line(180,170,190,160);
  noStroke();
  fill(142,136,109);
  rect(130,0,50,300);//tree
  //treering1
  stroke(198,188,164);
  noFill();
  smooth();
  strokeWeight(8);
  for (int i = 10; i < 300; i+=70) {
    arc(134,i,38,38,PI+HALF_PI,TWO_PI+HALF_PI);
  }
  //treering1 ends here
  //treering2 
  fill(108,96,69);
  smooth();
  noStroke();
  for (int i = 10; i < 300; i+=70) {
    arc(131,i,13,13,PI+HALF_PI,TWO_PI+HALF_PI);
  }
  //treering2ends here
  noStroke();
  fill(255);
  triangle(250,65,305,72,250,100);//feather 2
  fill(114,118,137);
  ellipse(250,140,80,110);//body
  ellipse(250,73,60,50);//head
  fill(255);
  fill(170,162,155);
  quad(180,55,222,61,238,78,223,80);//beak
  fill(255);
  triangle(238,190,278,180,200,280);//tail 1
  fill(114,118,137);
  triangle(238,189,279,179,240,245);//tail 2
  triangle(188,160,230,145,235,185);//thigh
  fill(255,129,131);
  triangle(250,47,310,60,280,72);//feather
  fill(240,255,129);
  ellipse(242,71,15,15);//eyewhite
  fill(119,109,149);
  ellipse(241,70,9,9);//iris
  fill(255,129,131);
  triangle(245,135,291,135,270,208);//wing3
  fill(255);
  triangle(250,135,291,135,280,210);//wing1
  fill(114,118,137);
  ellipse(268,136,46,85);//wing2
 
  
}


