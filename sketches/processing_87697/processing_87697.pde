
int myX;
int myY;
float x;
float y;
float easing = 0.03;
float m=0;
float n=0;
void setup() {
  size(600, 600); 
  noStroke();  
}

void draw() { 

myX=mouseX;
myY=mouseY;
if (mousePressed){background(110,92,226);}else 
{background(255,120,29);}//blue or orange
noStroke();
if (mouseX< width/2) {background(250,134,227);}//pink

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
float r=random(8,12); 
fill(r*8, r*10,r*18);//black body
ellipse(myX, myY, 180, 210);
fill(255,255,255);//white

ellipse(myX,myY+50,90,100);//belly

ellipse(myX-30,myY-50,54,50);//left eye
ellipse(myX+30,myY-50,54,42);//right eye
fill(0);//black
float w=random(2);
ellipse(myX-20,myY-50,30*1.3,30*w);//left eye2
ellipse(myX+20,myY-50,30,30);//right eye2
fill(192,109,240);//purple
rect(myX-15,myY+4,27,27);//tie
rect(myX-10,myY+10,17,83);//tie 2
fill(241,241,43);//yellow

ellipse(myX-70,myY+100,80,20);//left feet
ellipse(myX+70,myY+100,80,20);//right feet
triangle (myX-20,myY-30,myX+20,myY-30,myX,myY-10);
fill(0);//black
float e=random(1.3);
triangle(myX-180*e,myY-50*e,myX-80,myY-30,myX-90,myY+30);//left wing
triangle(myX+70,myY-50,myX+170*e,myY-100*e,myX+90,myY+20);//right wing  

float i=noise(2);
fill(140,210,32);//green 
ellipse(x,y-220,20,20);//left musical note 
ellipse(x+40,y-230,20,20);//right nusical note 
strokeWeight(4);  // Thicker
stroke(140,210,32);
line(x+5, y-280, x+5, y-230);//left line
line(x+45, y-290, x+45, y-240);//right line
line(x+5,y-280,x+45,y-290);//middle line
strokeWeight(3);//Thinner
fill(140,210,32);//green 
ellipse(m-20,n-120,m/17,n/17);//small musical note 
m=m+1;
n=n+1;
strokeWeight(4);  // Thicker
stroke(140,210,32);
line(m+5, n-180, m-10, n-120);//line2
line(m+5, n-180,m+20,n-160);

pushMatrix();
rotate(radians(frameCount/10));
translate(200,-300);
fill(140,210,32);//green 
ellipse(400,280,10,10);//rotate musical note 
strokeWeight(4);  // Thicker
stroke(140,210,32);
line(400,275,370,280);//rotate line
popMatrix();
}
