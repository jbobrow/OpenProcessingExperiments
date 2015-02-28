
//joe
void setup()
{
//start
size(600,600);
background(83,119,122);
noStroke();
smooth();
}

void draw()

{
 
  background(random(100,255),random(0,50),random(0,100));
//ears

fill(255,228,140);
bezier(300,200,80,80,60,230,300,360);
bezier(300,200,520,80,540,230,300,360);

//head shape

fill(236,208,120);
ellipse(300,300,300,300);

//mouth

fill(84,36,55);
arc(300,400,170,220,PI,PI*2);
fill(192,41,66);
arc(300,400,170,75,PI,PI*2);

//tears

fill(173,random(150,193),random(180,255));
ellipse(225,320,25,25); 
ellipse(325,320,25,25);
ellipse(225,375,25,25);
ellipse(225,425,25,25);
ellipse(325,425,25,25);
ellipse(325,375,25,25);
ellipse(225,260,50,50);
ellipse(325,260,50,50);

//eyes

fill(random(255));
ellipse(225,250,50,50);
ellipse(325,250,50,50);
fill(random(255));
ellipse(220,265,15,15);
ellipse(320,265,15,15);

//pacman

fill(random(150,255),random(180,238),random(10));
arc(100,480,150,150,PI/4,(2*PI)-(PI/4));
fill(random(255));
ellipse(100,435,10,10);
}




