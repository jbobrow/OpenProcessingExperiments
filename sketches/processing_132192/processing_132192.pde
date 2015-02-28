
void setup() {
  size (400,300);
}

void draw(){
  stroke(170,162,155);
  strokeWeight(5);
  line(180,140,190,160);
  line(180,170,190,160);
  noStroke();
  fill(142,136,109);
  rect(130,0,50,300);//tree
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
 
  
}


