
// import netscape.javascript.*;
void setup()
{
size(600,400);

}


float p1X=50;float p1Y=50; 
float p2X = 600-50; float p2Y = 350;
float rX = 300; float rY = 200;
// hastigheden i de to medier hhv. v1 og v2 relativt til lysets hastighed i vacuum.
float v1 = 1; float v2 = 1/1.33;
float d1=1;float d2 = 1;

void draw(){
  background(200);
if (v1>v2){
  fill(100);
  rect(0,rY,width,height);
}
else {fill(100);
  rect(0,0,width,rY);}

if (mousePressed & mouseX<300 & mouseY<200){
 p1X = mouseX; p1Y = mouseY;
}



stroke(255,255,255);
strokeWeight(4);
fill(255);


float i = atan(dist(p1X,1,rX,1)/dist(1,p1Y,1,rY));
float b = asin(v2/v1*sin(i));
p2Y = rY+150*cos(b);
p2X = rX+150*sin(b);
ellipse(p1X,p1Y,20,20);
ellipse(p2X,p2Y,20,20);
line(0,rY,width,rY);

stroke(150);
strokeWeight(1);
// korrekte linje

// fake ass linje
stroke(0);
line(p1X,p1Y,mouseX,rY);
line(mouseX,rY,p2X,p2Y);



text("P1("+int(p1X) +","+int(p1Y) +")",p1X,p1Y-25);
text("P2("+int(p2X) +","+int(p2Y) +")",p2X,p2Y+25);
//text("R ("+int(rX) +","+int(rY) +")",rX+10,rY-10);


text("v1="+v1, 20,240);
text("v2="+nf(v2,1,2), 20,270);

text("OPL="+nf(d2,3,1), 20,330);

d1 = dist(p1X,p1Y,rX,rY)/v1+dist(rX,rY,p2X,p2Y)/v2;
d2 = dist(p1X,p1Y,mouseX,rY)/v1+dist(mouseX,rY,p2X,p2Y)/v2;

if (mousePressed & mouseY>height/2)
{
text("OPL="+nf(d1,3,1), 20,300);
strokeWeight(3);
stroke(250);
line(p1X,p1Y,rX,rY);
line(rX,rY,p2X,p2Y);
noStroke();
}

}








