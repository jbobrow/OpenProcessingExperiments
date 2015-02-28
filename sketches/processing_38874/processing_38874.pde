
void setup() {
size(500,500);
background(0);

}


void draw(){
  
noStroke();
fill(255,50,0);
ellipse(255,440,70,70);

fill(255,50,0);
ellipse(255,250,400,400);



stroke(255);
strokeWeight(3);
line(245,455,260,455);//mouse1



noStroke();
fill(0);
rect(0,0,500,255);

noStroke();
fill(255,50,0);
rect(55,125,80,120);

noStroke();
fill(255,50,0);
rect(40,125,80,5);// toe

noStroke();
fill(255,50,0);
rect(40,135,80,5);// toe

noStroke();
fill(255,50,0);
rect(40,145,80,5);// toe


noStroke();
fill(0);
rect(285,250,60,155);

noStroke();
fill(0);
rect(300,400,60,5);

noStroke();
fill(0);
rect(300,390,60,5);

noStroke();
fill(0);
rect(300,380,60,5);

noStroke();
fill(255,50,0);
rect(400,200,55,60);

noStroke();
fill(255,50,0);
triangle(410,167,400,200,415,200);

noStroke();
fill(255,50,0);
triangle(430,167,420,200,435,200);

noStroke();
fill(255,50,0);
triangle(450,167,440,200,455,200);

noStroke();
fill(255,50,0);
triangle(380,210,400,220,400,200);


noStroke();
fill(255,50,0);
rect(275,220,10,40);

noStroke();
fill(255,50,0);
rect(145,217,140,10);

noStroke();
fill(255,50,0);
rect(145,90,10,130);

noStroke();
fill(255,50,0);
rect(145,80,210,10);

noStroke();
fill(255,50,0);
rect(345,90,10,50);

noStroke();
fill(255,50,0);
rect(220,130,130,10);

noStroke();
fill(255,50,0);
ellipse(200,133,50,50); 

noStroke();
fill(255);
ellipse(192,125,13,13);

noStroke();
fill(255);
ellipse(192,144,8,8); 

noStroke();
fill(255);
rect(210,123,5,20);

noStroke();
fill(255,50,0);
rect(310,130,10,200);

noStroke();
fill(255,50,0);
ellipse(315,360,40,40);

noStroke();
fill(255,50,0);
ellipse(314.5,330,9,9); 

noStroke();
fill(255);
ellipse (325,365,6,6);

noStroke();
fill(255);
ellipse(309,365,6,6);

noStroke();
fill(255);
rect(309,350,18,3);


strokeWeight(3);
stroke(random(0),random(100));
noFill();
//if the mouse is above the middle, then the line turns to bluish green.
if (mouseY<250) {stroke(0,230,230);}
ellipse(180,340,120,120);


strokeWeight(3);
stroke(random(0),random(100));
//if the mouse is above the middle, then the line turns to bluish green.
if (mouseY<250) {stroke(0,230,230);}
line(180,340,180,280);

strokeWeight(3);
stroke(random(0),random(100));
//if the mouse is above the middle, then the line turns to bluish green.
if (mouseY<250) {stroke(0,230,230);}
line(180,340,180,400);

strokeWeight(3);
stroke(random(0),random(100));
//if the mouse is above the middle, then the line turns to bluish green.
if (mouseY<250) {stroke(0,230,230);}
line(180,340,135,375);

strokeWeight(3);
stroke(random(0),random(100));
//if the mouse is above the middle, then the line turns to bluish green.
if (mouseY<250) {stroke(0,230,230);}
line(180,340,230,375);

noStroke();
fill(random(30),random(255),random(255));
ellipse(235,440,10,10); 

noStroke();
fill(random(30),random(255),random(255));
ellipse(270,440,10,10);

strokeWeight(1);
stroke(255);
line(mouseX,mouseY,235,440);

strokeWeight(1);
stroke(255);
line(mouseX,mouseY,270,440);


}



                                                                
