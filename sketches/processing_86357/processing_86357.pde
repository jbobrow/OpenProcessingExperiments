
int myX;
int myY;
void setup(){
  size(800,800);
myX=0;
myY=0;
}
void draw(){
myX=mouseX;
myY=mouseY;
background(33,72,226);//blue
noStroke();
fill(255,255,255);//white
rect(0,0,800,500);
fill(0);//black body
ellipse(myX+300, myY+300, 180, 210);
fill(255,255,255);//white
ellipse(myX+300,myY+350,90,100);//belly
ellipse(myX+270,myY+250,54,50);//left eye
ellipse(myX+330,myY+250,54,42);//right eye
fill(0);//black
ellipse(myX+280,myY+250,30,30);//left eye2
ellipse(myX+320,myY+250,30,30);//right eye2
fill(192,109,240);//purple
rect(myX+285,myY+304,27,27);//tie
rect(myX+290,myY+310,17,83);//tie 2
fill(241,241,43);//yellow
ellipse(myX+230,myY+400,80,20);//left feet
ellipse(myX+370,myY+400,80,20);//right feet
triangle (myX+280,myY+270,myX+320,myY+270,myX+300,myY+290);
fill(0);//black
triangle(myX+120,myY+250,myX+220,myY+270,myX+210,myY+330);//left wing
triangle(myX+370,myY+250,myX+470,myY+200,myX+390,myY+320);//right wing
fill(140,210,32);//green
ellipse(myX+400,myY+170,20,20);//left musical note 
ellipse(myX+440,myY+160,20,20);//right nusical note 
strokeWeight(4);  // Thicker
stroke(140,210,32);
line(myX+405, myY+130, myX+405, myY+170);//left line
line(myX+445, myY+120, myX+445, myY+160);//right line
line(myX+405,myY+130,myX+445,myY+120);//middle line
strokeWeight(3);//Thinner
line(myX+405,myY+140,myX+445,myY+130);//thinner line
}
