
int circleX = 0;
int circleY =50;
int lineX = 0;
int lineY = 10;
int rectX = 0;
int rectY = 10;
void setup () {
  size(300,300);
}
void draw () {
  background(205,random(10),random(160));
  frameRate (40);
  smooth ();
  stroke(255);
  line (lineX,lineY,10,0);
  line (lineX,lineY+10,20,0);
  line (lineX,lineY+20,30,0);
  line (lineX,lineY+30,40,0);
  line (lineX,lineY+40,50,0);
  line (lineX,lineY+50,60,0);
  line (lineX,lineY+60,70,0);
  line (lineX,lineY+70,80,0);
  line (lineX,lineY+80,90,0);
  line (lineX,lineY+90,100,0);
  line (lineX,lineY+100,110,0);
  line (lineX,lineY+110,120,0);
  line (lineX,lineY+120,130,0);
  line (lineX,lineY+130,140,0);
  line (lineX,lineY+140,150,0);
  line (lineX,lineY+150,160,0);
  line (lineX,lineY+160,170,0);  
  line (lineX,lineY+170,180,0);
  line (lineX,lineY+180,190,0);
  line (lineX,lineY+190,200,0);
  line (lineX,lineY+200,210,0);
  line (lineX,lineY+210,220,0);
  line (lineX,lineY+220,230,0);
  line (lineX,lineY+230,240,0);
  line (lineX,lineY+240,250,0);
  line (lineX,lineY+250,260,0);
  line (lineX,lineY+260,270,0);
  line (lineX,lineY+270,280,0);
  line (lineX,lineY+280,290,0);
  line (lineX,lineY+290,300,0);
  lineX =lineX +1;
  lineX =lineX % width;
  lineY =lineY % width;
  ellipse(circleX,circleY,50,50);
  circleX= circleX +2;
  circleY=circleY +1;
   //boxes shadow
  fill(0);
  rect (rectX-5,rectY+5,random(50),random(30));
  rect (rectX-5,rectY+55,50,30);
  rect (rectX-5,rectY+105,random(50),random(40));
  rect (rectX-5,rectY+155,50,30);
  rect (rectX-5,rectY+205,random(50),random(30));
  rect (rectX-5,rectY+255,50,30);
  //boxes
 fill(175,random(50),random(150));
  rect (rectX,rectY,random(50),random(30));
  rect (rectX,rectY+50,50,30);
  rect (rectX,rectY+100,random(50),random(40));
  rect (rectX,rectY+150,50,30);
  rect (rectX,rectY+200,random(50),random(30));
  rect (rectX,rectY+250,50,30);
rectX = rectX +1;
rectX = rectX % width;
rectY = rectY +10;
rectY = rectY % width;
fill (200,250,10);
rect (rectX-50,rectY-10,25,300);
}

