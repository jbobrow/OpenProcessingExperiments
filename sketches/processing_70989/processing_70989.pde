
// Oliver Haimson
// Copyright 2012
// a modification of the movie poster for "The Nomi Song"

void setup()
{
  size(400,540);
  smooth();
}

void draw()
{
  drawBackground();
  drawFace();
}

void drawBackground()
// create fading color effect
{
  for (int y=1; y<270; y+=1)
  {
    stroke(255-y*.5,0,y*.5);
    line(0,y,400,y);
  }
  for (int y=270; y<540; y+=1)
  {
    stroke(121+((y-269)*.5),(y-269)*.5,134-((y-269)*.5));
    line(0,y,400,y);
  }
}

void drawFace()
{

  // background circles
  noFill();
  strokeWeight(13);
  stroke(0);
  arc(200,270,250,250,PI-1,PI+1);
  arc(200,270,250,250,TWO_PI-1,TWO_PI);
  arc(200,270,250,250,0,1.2);
  
  strokeWeight(19);
  ellipse(200,270,350,350);
  strokeWeight(25);
  ellipse(200,270,450,450);
  
  // head
  fill(240);
  noStroke();
  ellipse(200,250,190,300);
  
  // neck and collar
  fill(25);
  triangle(270,355,234,388,234,416);
  quad(234,388,234,416,159,450,163,388);
  triangle(129,351,164,388,159,450);
  fill(50);
  triangle(129,351,78,385,160,449);
  quad(269,356,274,346,310,385,272,443);
  
  // bottom lip
  fill(98,95,90);
  ellipse(200,341,45,20);
  fill(240);
  triangle(200,335,195,330,205,330);
  
  // top lip
  fill(33);
  triangle(200,335,210,325,225,340);
  triangle(200,335,190,325,175,340);
  triangle(200,334,225,338,175,338);
  
  // eyebrows
  stroke(100);
  strokeWeight(6);
  curve(134,201,140,210,183,227,202,235);
  curve(260,220,250,215,217,227,198,235);
  
  // sunglasses
  fill(25);
  noStroke();
  beginShape();
  curveVertex(87,247);
  curveVertex(108,214);
  curveVertex(200,227);
  curveVertex(292,214);
  curveVertex(272,256);
  curveVertex(253,266);
  curveVertex(223,264);
  curveVertex(200,235);
  curveVertex(177,264);
  curveVertex(147,266);
  curveVertex(128,256);
  curveVertex(108,214);
  curveVertex(151,217);
  endShape();
  
  // nose
  fill(50);
  ellipse(190,302,13,10);
  ellipse(210,302,13,10);
  stroke(140);
  strokeWeight(5);
  line(192,306,208,306);
  
  // hair
  noStroke();
  fill(23);
  beginShape();
  curveVertex(111,245);
  curveVertex(104,223);
  curveVertex(90,111);
  curveVertex(145,90);
  curveVertex(160,95);
  curveVertex(190,70);
  curveVertex(210,70);
  curveVertex(240,95);
  curveVertex(265,90);
  curveVertex(310,111);
  curveVertex(296,223);
  curveVertex(280,200);
  curveVertex(270,150);
  curveVertex(254,130);
  curveVertex(230,111);
  curveVertex(200,120);
  curveVertex(170,111);
  curveVertex(146,130);
  curveVertex(130,150);
  curveVertex(120,200);
  curveVertex(109,226);
  curveVertex(74,250);
  endShape();
  
  // left ear
  fill(150);
  beginShape();
  curveVertex(116,244);
  curveVertex(110,225);
  curveVertex(95,220);
  curveVertex(98,280);
  curveVertex(110,293);
  curveVertex(110,225);
  curveVertex(107,200);
  endShape();
  
  // right ear
  fill(240);
  beginShape();
  curveVertex(284,244);
  curveVertex(290,225);
  curveVertex(310,220);
  curveVertex(302,280);
  curveVertex(290,293);
  curveVertex(290,225);
  curveVertex(293,200);
  endShape();
  
  // cheek shadow
  stroke(100);
  strokeWeight(1);
  for (int x=150; x<160; x+=3){
    for (int y=320; y<380; y+=3){
      point(x,y);
    }}
  for (int x=115; x<140; x+=3){
    for (int y=295; y<315; y+=3){
      point(x,y);
    }}
    
  // flash of light
  fill(210);
  noStroke();
  rect(175,213,2,37);
  rect(157,229,37,2);
}
