
void setup(){

size(300,300);
background(122,100,152);
smooth();
frameRate(30);

}

void draw(){
background(122,100,152);
ellipseMode(CENTER);
rectMode(CENTER);
noStroke();

//moon
fill(221,219,181,30);//light yellow
ellipse(150,50,150,150);
ellipse(150,50,100,100);
ellipse(150,50,80,80);
fill(221,219,181);//light yellow full
ellipse(150,50,75,75);

//ground
fill(0);
rect(150,300,300,100);

//draw zoog's body
fill(115,193,88);//darker green fill
rect(mouseX,mouseY,20,100);//body

//draw head
fill(126,209,98);//green fill
ellipse(mouseX,mouseY-30,70,70);//head

//mouth
stroke(255,0,0);
fill(255);
rect(mouseX,mouseY-10,15,10);
fill(202,88,48);
rect(mouseX,mouseY-10,15,5);

//blood
noStroke();
fill(255,0,0);
rect(mouseX+5,mouseY,2,10);
rect(mouseX+2,mouseY-2,1,5);
rect(mouseX-3,mouseY-1,1,7);


//eyes
fill(mouseX,0,mouseY);
stroke(255,23,61);
ellipse(mouseX-19,mouseY-30,16,32);//eye
ellipse(mouseX+19,mouseY-30,16,32);//eye

//arms
fill(115,193,88);//green fill
noStroke();
rect(mouseX-20,mouseY+10,20,2);//left arm underarm
rect(mouseX-30,mouseY,2,20);//left upper arm
rect(mouseX+20,mouseY+10,20,2);//right arm underarm
rect(mouseX+30,mouseY,2,20);//right upper arm


//legs
stroke(115,193,88);//green line
line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);//leg
line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);//leg
}

void mousePressed(){
  
background(2,0,98);

//moon turning red
noStroke();
fill(230,32,32,30);//red
ellipse(150,50,150,150);
ellipse(150,50,100,100);
ellipse(150,50,80,80);
fill(230,32,32);//red full
ellipse(150,50,75,75);

//ground
fill(0);
rect(150,300,300,100);

//draw zoog's body
fill(0);//black fill
rect(mouseX,mouseY,20,100);//body

//draw head
fill(0);//black
ellipse(mouseX,mouseY-30,70,70);//head

//mouth
stroke(255,0,0);
fill(255);
rect(mouseX,mouseY-10,15,10);
fill(202,88,48);
rect(mouseX,mouseY-10,15,5);

//blood
noStroke();
fill(255,0,0);
rect(mouseX+5,mouseY,2,10);
rect(mouseX+2,mouseY-2,1,5);
rect(mouseX-3,mouseY-1,1,7);


//eyes
fill(mouseX,0,mouseY);
stroke(255,23,61);
ellipse(mouseX-19,mouseY-30,16,32);//eye
ellipse(mouseX+19,mouseY-30,16,32);//eye

//arms
fill(0);//black fill
noStroke();
rect(mouseX-20,mouseY+10,20,2);//left arm underarm
rect(mouseX-30,mouseY,2,20);//left upper arm
rect(mouseX+20,mouseY+10,20,2);//right arm underarm
rect(mouseX+30,mouseY,2,20);//right upper arm


//legs
stroke(0);//black line
line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);//leg
line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);//leg


//blood splatter appear
noStroke();
fill(255,0,0);
ellipse(mouseX+5,mouseY+20,10,10);
ellipse(mouseX,mouseY+30,5,5);
  
}

