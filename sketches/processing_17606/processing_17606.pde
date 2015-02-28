
void setup() {

size(200,200);
//background(24,196,214);
ellipseMode(CENTER);
noStroke();
smooth();
background(0, 0, mouseX);

rectMode(CENTER);
noStroke();
}

void draw() {

frameRate(10);
  fill(255);
  ellipse(mouseX,mouseY,10,10);
  ellipse(pmouseX,pmouseY,6,6);
  
  frameRate(5);
  background(24,196,214);
    //fill(250,103,231);
    
//ground

    fill(77,62,22);
    rect(100,195,200,10);
    ellipse(25,190,20,20);
ellipse(10,190,15,15);
 ellipse(45,190,10,10);
ellipse(3,190,10,10); 

ellipse(190,190,20,10);
ellipse(175,190,10,10);

ellipse(120,190,20,10);

ellipse(90,190,10,5);

//plant


//fill(1,98,11);
//ellipse(175,150,15,30);
//fill(24,196,214);
//ellipse(178,150,15,30);


//fill(1,98,11);
//ellipse(180,160,15,30);
//fill(24,196,214);
//ellipse(183,160,15,30);

//fill(1,98,11);
//ellipse(185,170,15,30);
//fill(24,196,214);
//ellipse(188,170,15,30);

//fill(77,62,22);
//ellipse(188,190,20,20); 

fill(1,98,11);
stroke(2);
stroke(1,98,11);
ellipse(180,160,20,20);
ellipse(180,132,15,15);
ellipse(180,110,10,10);
line(180,100,180,190);


noStroke();

//twirlies

//first twirly
fill(234,mouseX,mouseY);
ellipse(75,80,20,20);
fill(24,196,214);
ellipse(78,80,20,20);

fill(234,mouseX,mouseY);
ellipse(75,100,20,20);
fill(24,196,214);
ellipse(72,100,20,20);

fill(250,103,231);
ellipse(75,120,20,20);
fill(24,196,214);
ellipse(78,120,20,20);

fill(250,103,231);
ellipse(75,140,20,20);
fill(24,196,214);
ellipse(72,140,20,20);

fill(250,103,231);
ellipse(75,160,20,20);
fill(24,196,214);
ellipse(78,160,20,20);

fill(250,103,231);
ellipse(75,180,20,20);
fill(24,196,214);
ellipse(72,180,20,20);

//second twirly

fill(250,103,231);
ellipse(103,85,20,20);
fill(24,196,214);
ellipse(100,85,20,20);

fill(250,103,231);
ellipse(103,105,20,20);
fill(24,196,214);
ellipse(106,105,20,20);

fill(250,103,231);
ellipse(103,125,20,20);
fill(24,196,214);
ellipse(100,125,20,20);

fill(250,103,231);
ellipse(103,145,20,20);
fill(24,196,214);
ellipse(106,145,20,20);

//third twirly

fill(250,103,231);
ellipse(130,70,20,20);
fill(24,196,214);
ellipse(132,70,20,20);

fill(250,103,231);
ellipse(130,90,20,20);
fill(24,196,214);
ellipse(128,90,20,20);

fill(250,103,231);
ellipse(130,110,20,20);
fill(24,196,214);
ellipse(132,110,20,20);

fill(250,103,231);
ellipse(130,130,20,20);
fill(24,196,214);
ellipse(128,130,20,20);

fill(250,103,231);
ellipse(130,150,20,20);
fill(24,196,214);
ellipse(132,150,20,20);

fill(250,103,231);
ellipse(130,170,20,20);
fill(24,196,214);
ellipse(128,170,20,20);

//body
noStroke();
fill(234,mouseX,mouseY);
ellipse(100,45,77,77);
rect(100,60,77,22);
fill(24,196,214);
rect(100,77,70,14);


//twirlies

//first twirly
fill(234,mouseX,mouseY);
ellipse(75,80,20,20);
fill(24,196,214);
ellipse(78,80,20,20);

fill(234,mouseX,mouseY);
ellipse(75,100,20,20);
fill(24,196,214);
ellipse(72,100,20,20);

fill(234,mouseX,mouseY);
ellipse(75,120,20,20);
fill(24,196,214);
ellipse(78,120,20,20);

fill(234,mouseX,mouseY);
ellipse(75,140,20,20);
fill(24,196,214);
ellipse(72,140,20,20);

fill(234,mouseX,mouseY);
ellipse(75,160,20,20);
fill(24,196,214);
ellipse(78,160,20,20);

fill(234,mouseX,mouseY);
ellipse(75,180,20,20);
fill(24,196,214);
ellipse(72,180,20,20);

//second twirly

fill(234,mouseX,mouseY);
ellipse(103,85,20,20);
fill(24,196,214);
ellipse(100,85,20,20);

fill(234,mouseX,mouseY);
ellipse(103,105,20,20);
fill(24,196,214);
ellipse(106,105,20,20);

fill(234,mouseX,mouseY);
ellipse(103,125,20,20);
fill(24,196,214);
ellipse(100,125,20,20);

fill(234,mouseX,mouseY);
ellipse(103,145,20,20);
fill(24,196,214);
ellipse(106,145,20,20);

//third twirly

fill(234,mouseX,mouseY);
ellipse(130,70,20,20);
fill(24,196,214);
ellipse(132,70,20,20);
fill(234,mouseX,mouseY);
rect(128,65,20,10);

fill(234,mouseX,mouseY);
ellipse(130,90,20,20);
fill(24,196,214);
ellipse(128,90,20,20);

fill(234,mouseX,mouseY);
ellipse(130,110,20,20);
fill(24,196,214);
ellipse(132,110,20,20);

fill(234,mouseX,mouseY);
ellipse(130,130,20,20);
fill(24,196,214);
ellipse(128,130,20,20);

fill(234,mouseX,mouseY);
ellipse(130,150,20,20);
fill(24,196,214);
ellipse(132,150,20,20);

fill(234,mouseX,mouseY);
ellipse(130,170,20,20);
fill(24,196,214);
ellipse(128,170,20,20);


//legs
stroke(155,10,196);
line(71,70,71,175);
line(87,70,87,125);
line(103,70,103,125);
line(118,70,118,150);
line(134,70,134,150);

stroke(255);
line(63,70,63,150);
line(79,70,79,150);
line(95,70,95,150);
line(110,70,110,175);
line(126,70,126,175);


//nubs
noStroke();
fill(234,mouseX,mouseY);
ellipse(71,70,20,10);
ellipse(90,70,20,10);
ellipse(109,70,20,10);
ellipse(128,70,20,10);

//eyes
fill(255);
ellipse(110,55,10,10);
ellipse(125,55,10,10);
fill(155,10,196);
ellipse(110,55,4,4);
ellipse(125,55,4,4);

//mouth
fill(59,1,47);
ellipse(127,67,6,4);

//monacle

stroke(0);
noFill();
ellipse(125,55,15,15);

//hat

stroke(59,1,47);
strokeWeight(3);
fill(59,1,47);
quad(65,10,74,18,84,10,75,2);
strokeWeight(4);
line(70,23,90,8);

//spots

noStroke();
fill(255);

ellipse(100,10,4,2);
ellipse(110,15,5,2);
ellipse(85,20,6,3);
ellipse(96,15,4,2);
ellipse(120,18,5,2.5);

strokeWeight(1);

//bubbles


noStroke();
fill(255);
  
  ellipse(mouseX,mouseY,10,10);
  ellipse(pmouseX,pmouseY,6,6);
  ellipse(pmouseX+10,pmouseY-10,3,3);
}

void keyPressed() {
  
  fill(0,18,82);
  ellipse(30,30,30,30);
}

                
                                
