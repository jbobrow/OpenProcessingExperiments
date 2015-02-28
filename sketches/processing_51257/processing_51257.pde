
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
//neck
strokeWeight(2);
rect(heartX-40,heartY-150,80,110);

//head
ellipse(heartX,heartY-150,150,150);

//body
rect(heartX-80,heartY-40,160,200);

//buttons - left
ellipse(heartX-40,heartY,35,35);
ellipse(heartX-40,heartY+60,35,35);
ellipse(heartX-40,heartY+120,35,35);

//buttons - right
//this is meant to be offset, by the way - goes with his character
ellipse(heartX+30,heartY+15,35,35);
ellipse(heartX+30,heartY+75,35,35);
ellipse(heartX+30,heartY+135,35,35);

//left arm
rect(heartX-130,heartY,50,-180);
rect(heartX-80,heartY-180,30,60);
//left fingers
rect(heartX-50,heartY-180,35,20);
rect(heartX-50,heartY-160,45,20);
rect(heartX-50,heartY-140,35,20);

//right arm
rect(heartX+80,heartY,50,-180);
rect(heartX+50,heartY-180,30,60);
//right fingers
rect(heartX+50,heartY-180,-35,20);
rect(heartX+50,heartY-160,-45,20);
rect(heartX+50,heartY-140,-35,20);

//left leg
rect(heartX-80,heartY+160,50,100);

//left boot
rect(heartX-30,heartY+260,-80,50);

//right leg
rect(heartX+80,heartY+160,-50,100);

//right boot
rect(heartX+30,heartY+260,80,50);

//nose
strokeWeight(2);
line(heartX,heartY-150,400,175);

//mouth
line(heartX-25,heartY-110,425,190);

//crown - main 
rect(heartX-100,heartY-250,200,50);

//crown - spikes
rect(heartX-100,heartY-300,50,50);
rect(heartX-25,heartY-300,50,50);
rect(heartX+100,heartY-300,-50,50);
strokeWeight(2);
}

