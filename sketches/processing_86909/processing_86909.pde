
int myX;
int myY;
float x;
float y;
float easing = 0.03;

void setup() {
  size(600, 600); 
  noStroke();  
}

void draw() { 
myX=mouseX;
myY=mouseY;
if (mousePressed){background(33,72,226);}else 
{background(245,107,212);}//blue or orange
noStroke();
  
  float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  
  
noStroke();
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
ellipse(x+300,y+80,20,20);//left musical note 
ellipse(x+340,y+70,20,20);//right nusical note 
strokeWeight(4);  // Thicker
stroke(140,210,32);
line(x+305, y+20, x+305, y+70);//left line
line(x+345, y+10, x+345, y+60);//right line
line(x+305,y+20,x+345,y+10);//middle line
strokeWeight(3);//Thinner

}
