
int x = 100;
int y = 70;

void setup() {
size(200,200);
background(255);
smooth();
}

void draw() {

rectMode(CENTER);
ellipseMode(CENTER);

int x = mouseX;
int y = mouseY;

background(x,y,200);

//legs
stroke(5,90,26);
strokeWeight(4);
line(90,140,80,160);
line(110,140,120,160);

//arms
stroke(5,90,26);
strokeWeight(3);
line(90,120,70,100);
line(110,120,130,100);


//body
strokeWeight(2);
stroke(5,90,26);
fill(15,240,68);
ellipse(100,100,30,100);

//head
strokeWeight(2);
stroke(5,90,26);
fill(234,38,38);
if (mouseX>95 && mouseX<105 && mouseY>55 && mouseY<75) {
  fill(15,240,68);
}
ellipse(x,y,60,60);


//eyes
strokeWeight(1);
fill(255);
ellipse(x-15,y,20,20);
ellipse(x+15,y,20,20);
fill(0);
ellipse(x-15,y,10,10);
ellipse(x+15,y,10,10);

//mouth
strokeWeight(2);
line(x-10,y+20,x+10,y+20);
}


