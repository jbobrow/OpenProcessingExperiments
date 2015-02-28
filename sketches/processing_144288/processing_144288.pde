
float X,Y ;
void setup(){
size(600,600);
smooth();

textSize(20);
X=width/2;
Y=height/2;
}

void draw(){
background(255);
drawClock();


stroke(210,245,20);
ellipse(300,300,20,20);

noFill();
stroke(210,245,20);
ellipse(X,Y,480,480);


}


void drawClock(){
noStroke();
fill(22,19,39);
ellipse(X,Y,500,500);
drawNumbers();
float s_angle=map(second(),0,60,0,TWO_PI);
pushMatrix();
translate(X,Y);
rotate(s_angle);
strokeWeight(2);
stroke(210,245,20);
line(0,0,0,-170);
popMatrix();

float m_angle=map(minute(),0,60,0,2*PI);
pushMatrix();
translate(X,Y);
rotate(m_angle);
strokeWeight(3);
stroke(255);
line(0,0,0,-130);
popMatrix();

float h_angle=map(hour(),0,12,0,2*PI);
pushMatrix();
translate(X,Y);
rotate(h_angle);
strokeWeight(3);
stroke(255);
line(0,0,0,-170);
popMatrix();
}

void drawNumbers(){
float r=190;
float inc= TWO_PI /12;
for (int i=1; i<=12; i++){
float Xn=X+cos(i*inc-HALF_PI)*r;
float Yn=Y+sin(i*inc-HALF_PI)*r;
fill(255);
text(i,Xn,Yn);

}
}
