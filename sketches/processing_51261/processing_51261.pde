
//Tracy Carlin
//January 28,2012
//Week 2 - Variables
//size(x,y)
void setup() {
size(800,600);
smooth();
background(240);
}

void draw() {
float heartX=400.0;
float heartY=300.0;

//body
rect(heartX-75,heartY-100,150,220);

//head
rect(heartX-30,heartY-220,60,120);

//nose...thing
rect(heartX-90,heartX-270,30,60);
rect(heartX-90,heartX-270,60,30);

//eyes
ellipse(heartX-15,heartY-190,20,20);
ellipse(heartX+5,heartY-180,20,20);

//halo...circle...thing left top right
ellipse(heartX-70,heartY-210,50,50);
ellipse(heartX,heartY-260,50,50);
ellipse(heartX+70,heartY-210,50,50);

//arm - left
rect(heartX-160,heartY-100,85,150);

//arm - right
rect(heartX+75,heartY-100,85,150);

//hand - left
rect(heartX-160,heartY-100,-50,30);
rect(heartX-160,heartY-70,-70,30);
rect(heartX-160,heartY-40,-50,30);

//hand - right
rect(heartX+160,heartY-100,50,30);
rect(heartX+160,heartY-70,70,30);
rect(heartX+160,heartY-40,50,30);

//belt
rect(heartX-75,heartY+120,150,20);
//belt buckle
rect(heartX-10,heartY+120,20,20);
rect(heartX-5,heartY+125,10,10);
//left leg
rect(heartX-75,heartY+140,65,100);
//right leg
rect(heartX+10,heartY+140,65,100);
//left boot
rect(heartX-10,heartY+240,-105,50);
//right boot
rect(heartX+10,heartY+240,105,50);
}

