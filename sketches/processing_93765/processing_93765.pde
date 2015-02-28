
int a=1;
int b=1;
void setup(){size(350,370);}
void draw(){background(255,193,158);
            a=a+int(random(2,10)*b);
  if (a>=30){b=-1;}
  else if(a<=0){b=1;} 
  stroke(0);
//arm
line(245,231,290+a,230);
line(245,250,290+a,251);
line(160+a,229,197,231);
line(160+a,251,197,249);
//ear
fill(210);
ellipse(175,148,20,30);
ellipse(270,118,20,30);
//face
fill(165,102,255);
triangle(175,160,270,130,255,220);
fill(0);
ellipse(213,168,10,8);
ellipse(246,160,9,7);
//body
noStroke();
fill(128,65,217);
ellipse(225,340,15,20);
ellipse(265,340,15,20);
fill(209,178,255);
rect(200,220,90,120);
fill(153);
rect(200,257,90,5);
//nose
noStroke();
fill(250,0,0);
ellipse(256,226,15,18);
//home
fill(0);
arc(80,100,40,80,PI,TWO_PI);}
