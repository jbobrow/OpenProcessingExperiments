
void
setup(){
size(200,200);
}

void
draw(){
background(255);



//computer
stroke(0);
rectMode(CENTER);
fill(100);
rect(width*.666,(height*.5)+30,20,20);
fill(100);
rect(width*.666,height*.5,75,50);
fill(#1599E8);
rect(width*.666,height*.5,70,45);

//person
noFill();
ellipse(50,125,75,75);

rectMode(CORNER);
fill(#F0BE8C);
rect(width*.666,(mouseY),30,400);

rectMode(CENTER);
noStroke();
fill(255);
rect(0,0,400,150);

fill(255,0,0);
rectMode(CORNER);
rect(0,165,100,210);

}

