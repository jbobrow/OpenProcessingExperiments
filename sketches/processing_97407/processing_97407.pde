
float a;
float b;
void setup()
{
 size (1000,1000);
 noCursor();
}

void draw(){
a = mouseX+random(-10,10);
b = mouseY+random(-10,10);
background(0);
strokeWeight(10);
stroke(random(100,255),10,10);
///A
rect(100+a,100+b,50,10);
rect(80+a,120+b,10,90);
rect(160+a,120+b,10,90);
rect(100+a,150+b,50,10);
///&
stroke(255,random(80,228),0);
//down
rect(220+a,199+b,50,10);
//downleft to right uo
rect(220+a,189+b,10,10);
rect(230+a,170+b,10,10);
rect(240+a,151+b,10,10);
rect(260+a,132+b,10,10);
//up
rect(220+a,113+b,50,10);
rect(220+a,132+b,10,10);
rect(259+a,170+b,10,10);
rect(278+a,189+b,10,10);
rect(285+a,170+b,10,10);
///T
stroke(0,51,random(80,153));
rect(340+a,100+b,90,10);
rect(380+a,110+b,10,108);
}
