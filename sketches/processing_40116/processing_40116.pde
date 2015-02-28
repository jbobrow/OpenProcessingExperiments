

void setup(){
size(500,500);
}

void draw() {
background(247,223,109);  


  smooth();
//mouth
stroke(250,0,0);
strokeWeight(2);
fill(250,50,40,40);
ellipse(250,100,30,8);
 
//glasses
stroke(0);
strokeWeight(abs(mouseX-pmouseX/1));
fill(220);
ellipse(240,80,8,8);
ellipse(260,80,8,8);
line(245,80, 255,80);
 
//hair
fill(76,28,11);
noStroke();
beginShape();
vertex(276,75);
vertex(277,70);
vertex(278,65);
vertex(277,52);
vertex(276,49);
vertex(270,40);
vertex(265,37);
vertex(260,33);
vertex(255,34);
vertex(250,33);
vertex(245,35);
vertex(240,37);
vertex(235,40);
vertex(229,45);
vertex(225,55);
vertex(223,65);
vertex(221,75);
vertex(224,90);
vertex(230,75);
vertex(235,49);
vertex(239,49);
vertex(248,60);
vertex(248,60);
vertex(250,46);
vertex(255,60);
vertex(250,45);
vertex(255,60);
vertex(257,50);
vertex(260,52);
vertex(266,49);
vertex(270,60);
endShape();
 
//shirt
fill(121,114,114);
noStroke();
rect(222,124, 50,80);
 
//zipper
stroke(200);
strokeWeight(0);
line(245,130, 250,190);
line(244,138, 249,138);
line(244,143, 249,143);
line(244,148, 249,148);
line(244,153, 249,153);
line(245,158, 251,158);
line(245,163, 251,163);
line(245,168, 251,168);
line(245,172, 251,172);
line(245,178, 251,178);
line(245,130, 230,125);


//shoes
fill(200);
ellipse(mouseX-1,mouseY+145, 35,10);
ellipse(280,400, 35,10);
rect(mouseX-4,mouseY+133, 20,10);
rect(270,390, 20,15);
 
 
//moving leg
stroke(100,35,10);
fill(247,223,109); 
line(218,257,mouseX-6,mouseY+63 );
line(mouseX-6,mouseY+63,mouseX+8,mouseY+133);


//straight leg
stroke(100,35,10);
fill(247,223,109); 
beginShape();
vertex(265,260 );
vertex( 275,389);

endShape();
 
//watermellon
strokeWeight(5);
fill(255,10,100);
stroke(105,205,50);

arc(360,120, 50,50, 0, QUARTER_PI-.08);
arc(360,120, 50,50, QUARTER_PI,HALF_PI-.08);
arc(360,120, 50,50, HALF_PI,PI-.08);
arc(360,120, 50,50, PI,HALF_PI-.5);
arc(360,90, 140,140, PI+HALF_PI, 0);
 
fill(0);
stroke(0);
ellipse(350,130,1,1);
ellipse(378,125,1,2);



  //pants
  fill(mouseX,mouseY,84);
noStroke();
beginShape();
vertex(222,204);
vertex(215,255);
vertex(225,260);
vertex(240,265);
vertex(245,220);
vertex(250,265);
vertex(277,260);
vertex(276,204);
endShape();
}

