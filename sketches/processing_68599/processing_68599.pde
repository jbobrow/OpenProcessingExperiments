
void setup(){
  size(300,300);
  strokeWeight(3);
  smooth();
}
 
void draw(){
  cursorpos();
}
 
void cursorpos(){   
  background(255,255,255);
  
  // background
  ellipseMode(CENTER);
  int i = 460;
  int filler = 0;
  while(i > 0){
    if (filler == 0){
      filler = 255;
    } else {
      filler = 0;
    }
    fill(filler,100,filler);
    ellipse(150,150,i,i);
    i=i-20;
  }

  
  //body
  fill(0,0,255);
  beginShape();
  curveVertex(125,110);
  curveVertex(125,110);
  curveVertex(200,140);
  curveVertex(170,220);
  curveVertex(110,140);
  curveVertex(110,140);
  endShape(CLOSE);

  //head
  fill(248,250,146);
  ellipse(100,100,115,115);

  //hat
  fill(0,0,0);
  ellipse(40,45,10,10);
  fill(0,255,255);
  arc(68, 66, 75, 60, -4.0, -0.8);
  line(41,92, 118,25);

  // tshirt button
  ellipse(150,150,20,20);

  // right eye
  fill(255,255,255);
  ellipse(110,75,38,35);

  // left eye
  ellipse(85,90,38,35);
  fill(0,0,0);
  ellipse(85,95,4,4);
  ellipse(110,80,4,4);

  // nose
  line(110,100,125,106);
  line(125,106,120,115);

  // mouth
  line(80,118,135,119);
  arc(105, 119, 50, 40, 0, PI);
  
  // eyebrows
  line(110,50,100,50);
  line(70,60,80,50);
  
  // legs
  line(200,140,270,120);
  line(170,220,170,280);
  line(170,120,180,50);
  line(125,164,20,164);

  // tongue
  fill(255,0,0);
  int x = mouseX;
  int y = mouseY;
  float displace;

  if (y > 130){
    displace = 10;
  } else {
    displace = -10;
  }

  beginShape();
  vertex(95, 129);
  vertex(x-10, y);
  vertex(x-5, int(y+displace));
  vertex(x+5, int(y+displace));
  vertex(x+10, y);
  vertex(120,130);
  endShape(CLOSE);
  
  if (displace > 0){
    line(110,130,x,y);
  }
  
}
