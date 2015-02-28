
void setup(){
//setup sketch
size(600,600);
frameRate(100);
smooth();
}


void draw () {
background(120,190,250);

//marvin left arm
fill(255);
beginShape();
vertex(420,280);
vertex(350,250);
vertex(350,300);
vertex(420,320);
endShape();

bezier(420,280,480,250,490,320,420,320);

bezier(420,280,405,295,450,305,420,320);

fill(0);
ellipse(460,280,40,40);
fill(255);

//marvin right arm
beginShape();
vertex(180,280);
vertex(250,250);
vertex(250,300);
vertex(180,320);
endShape();

bezier(180,280,100,250,100,320,180,320);

bezier(180,280,195,295,160,305,180,320);

fill(0);
ellipse(130,285,40,40);
fill(255);

//marvin body
beginShape();
vertex(210,420);
vertex(250,250);
vertex(350,250);
vertex(390,420);
endShape();

beginShape();
vertex(210,420);
vertex(290,480);
vertex(310,480);
vertex(390,420);
endShape();


//marvin embelishment
strokeWeight(2);
bezier(212,415,270,435,330,435,388,415);

fill(0);
beginShape();
vertex(250,340);
vertex(280,320);
vertex(320,320);
vertex(350,340);
vertex(250,340);
endShape();

fill(mouseY*.3,255,mouseY*.3);

rect(275,260,50,40);

fill(mouseX*.3,255,mouseY*.5);

ellipse(420,310,10,10);
ellipse(183,310,10,10);

//marvin Legs
fill(255);
strokeWeight(1);
stroke(255);

beginShape();
vertex(390,540);
vertex(395,440);
vertex(320,495);
vertex(340,540);
endShape();

beginShape();
vertex(260,540);
vertex(290,495);
vertex(205,440);
vertex(210,540);
endShape();

stroke(0);

bezier(395,430,430,470,390,520,390,540);
bezier(320,494,330,520,330,520,340,540);

bezier(205,430,170,470,210,520,210,540);
bezier(290,494,275,520,275,520,260,540);

strokeWeight(20);
line(320,484,389,430);
line(212,430,291,484);


//marvin feet
strokeWeight(8);
line(340,580,390,580);
line(260,580,210,580);

strokeWeight(2);
bezier(340,580,300,520,430,520,390,580);
bezier(260,580,300,520,170,520,210,580);


//marvin head
strokeWeight(1);
fill(0,0,0);
ellipse(300,230,115,115);

fill(255);
ellipse(300,150,250,250);
strokeWeight(3);
arc(300,200,230,50,PI+.4,TWO_PI-.4);

strokeWeight(1);
fill(mouseY*.2,255,mouseY*.2);
beginShape();
vertex(210,185);
vertex(230,205);
vertex(250,178);
endShape();

beginShape();
vertex(390,185);
vertex(370,205);
vertex(350,178);
endShape();



println (mouseX +"," + mouseY);
}
