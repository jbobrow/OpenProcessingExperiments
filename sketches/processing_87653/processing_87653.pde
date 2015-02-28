
int myX;
int myY;
float bambooW ;
float bambooH ;
float i=0;
color[ ] bambooColor = {#74A025,#85D630,#3B6213};

void setup() {
size(300,300);
background(#588629);
frameRate(3);
strokeWeight(2);
smooth();
}

void draw() {

//draw random bamboo

if(i<width){
drawBamboo();
i=i+bambooW+10;
fill(bambooColor[int(random(0,3))]);
bambooW = random(10,15);
bambooH = random(100,400);
}
}
void drawBamboo()
{ 
  pushMatrix();
  translate(0,50);
  rotate(radians(random(-10,10)));
  rect(i,250,bambooW,-bambooH);
  popMatrix();
 
 //draw the right bamboo
 pushMatrix();
  translate(250, 10);
  rotate(radians(10));
  stroke(71, 113, 38, 150);
  fill(104, 170, 52);
  rect(0, 0, 15, 510);
  line(0, 50, 15, 50);
  line(0, 100, 15, 100);
  line(0, 150, 15, 150);
  line(0, 200, 15, 200);
  line(0, 250, 15, 250);
  line(0, 300, 15, 300);
  line(0, 350, 15, 350);
  line(0, 400, 15, 400);
  line(0, 450, 15, 450);
  popMatrix();

//draw the left bamboo
 pushMatrix();
  translate(20, 0);
  rotate(radians(-5));
  stroke(71, 113, 38, 150);
  fill(104, 170, 52);
  rect(0, 0, 15,400);
  line(0, 50, 15, 50);
  line(0, 100, 15, 100);
  line(0, 150, 15, 150);
  line(0, 200, 15, 200);
  line(0, 250, 15, 250);
  line(0, 300, 15, 300);
  line(0, 350, 15, 350);
  line(0, 400, 15, 400);
  line(0, 450, 15, 450);
  popMatrix();
 


//panda smile
myX=mouseX;
myY=mouseY;
//if(( myX<=3) || (myY<=3)){
//background(#588629);//green


//draw panda

fill(0);//black
ellipse(114,60,24,24);//left ear
ellipse(183,60,24,24);//right ear
fill(255,255,255);//white
ellipse(150,150,75,120);//body
ellipse(150,90,75,75);//head
fill(0,0,0);//black
ellipse(135,90,12,18);//left eye
ellipse(165,90,12,18);//right eye
ellipse(150,108,9,6);//nose
ellipse(114,135,45,45);//left hand
ellipse(183,135,45,45);//right hand
ellipse(114,189,54,54);//left foot
ellipse(183,189,54,54);//right foot

fill(255);

arc(150,114,18,15,myX/12+radians(5),radians(175));//smile
fill(104, 170, 52);

triangle(195,120,myX/12-50+204,myY/12+20+99,3/12+216,111);

//line(195,120,myX/12-50+204,myY/12+20+99);//L bamboo
//line(195,120,myX/12+216,111);//R bamboo
}






