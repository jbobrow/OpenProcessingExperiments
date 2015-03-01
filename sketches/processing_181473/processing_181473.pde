
float angle=0;

void setup () {
size (300,300);
background(0);
}

void draw () {
background(0);
noStroke();
fill(175,255,255);
rect(140,150,20,150);

angle = angle+mouseX/1200;

translate(300/2,300/2);
rotate(angle);
translate(-300/2,-300/2);


noStroke();
fill(255,245,96);
ellipse(200,100,60,60);
noStroke();
fill(112,255,147); 
ellipse(100,100,60,60);
noStroke();
fill(205,96,255);
ellipse(200,200,60,60);
noStroke();
fill(112,201,255);
ellipse(100,200,60,60);
noStroke();
fill(220,255,143);
ellipse(100,150,80,80);
ellipse(150,100,80,80);
ellipse(150,200,80,80);
ellipse(200,150,80,80);
noStroke();
fill(255,32,241);
ellipse(150,150,100,100);
}

