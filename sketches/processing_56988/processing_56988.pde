
PImage snow;
PFont keith;
int a=50;
int direction=1;

void setup(){
  size(500,500);
  background(240,248,255);//R,G,B
  smooth();
  snow=loadImage("1.JPG");
  keith = loadFont("Kalinga-48.vlw");
  textFont(keith);

}

void draw(){
  
image(snow,0,0);
  textSize(30);
  fill(0);
  text("hi~I am a robot!",a,450);
  a=a+1*direction;
 if((a>250)||(a<40)){
 direction=direction*-1;
 }
//body
fill(255,255,0);//R,G,B
ellipse(250,300,150,200);//body
fill(152,251,152);//R,G,B
rect(175,185,150,170);//main body
fill(175,283,283);//R,G,B

//head
rect(200,85,100,100);//head
line(230,85,210,50);//head line1
line(260,85,280,50);//head line2
fill(204,255,0);//R,G,B
ellipse(210,50,8,8);
ellipse(280,50,8,8);

fill(255,90,70);//R,G,B
rect(225,145,50,40);
fill(0);
ellipse(220,120,20,30);//eyes1
ellipse(280,120,20,30);//eyes2
fill(255);
ellipse(283,115,5,5);//eyes3
ellipse(280,130,9,9);//eyes4
ellipse(223,115,5,5);//eyes5
ellipse(220,130,9,9);//eyes6
ellipse(215,125,4,4);//eyes7
ellipse(275,125,4,4);//eyes8

fill(255,182,193);//r,g,b
ellipse(210,150,10,10);
ellipse(290,150,10,10);

stroke(10);
line(175,230,100,200);//left arm1
line(100,200,150,150);//left arm2
line(325,230,400,200);//right arm1
line(400,200,350,250);//right arm2
line(350,250,370,260);//right hand
line(150,150,130,135);//letf hand

if (mousePressed) {
   background(150,90,150);
      //body
  fill(255, 255, 0);//R,G,B
  ellipse(250, 300, 150, 200);//body
  fill(152, 251, 152);//R,G,B
  rect(175, 185, 150, 170);//main body
  fill(175, 283, 283);//R,G,B

  //head
  rect(200, 85, 100, 100);//head
  line(230, 85, 210, 50);//head line1
  line(260, 85, 280, 50);//head line2
  fill(204, 255, 0);//R,G,B
  ellipse(210, 50, 8, 8);
  ellipse(280, 50, 8, 8);

  fill(255, 90, 70);//R,G,B
  rect(225, 145, 50, 40);





  fill(255, 182, 193);//r,g,b
  ellipse(210, 150, 10, 10);
  ellipse(290, 150, 10, 10);

      fill(0);
    ellipse(220, 120, 20, 30);//eyes1
    ellipse(280, 120, 20, 30);//eyes2
    fill(255);
    ellipse(283, 115, 5, 5);//eyes3
    ellipse(280, 130, 9, 9);//eyes4
    ellipse(223, 115, 5, 5);//eyes5
    ellipse(220, 130, 9, 9);//eyes6
    ellipse(215, 125, 4, 4);//eyes7
    ellipse(275, 125, 4, 4);//eyes8

stroke(10);

  line(325, 230,400,320);//arm
  line(175, 230, 50, 180);//arm
}

}


