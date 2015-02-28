
//Adam Oaks

void setup(){
  size(400,400);
}

void draw(){
  
noStroke();
  
  background(215-mouseY,215-mouseY,215);
  
  fill(255-mouseY,255,255-mouseY);
rect(0,285,400,115);
  
noStroke();
  
//brick beyond
fill(124,54,38);

quad(470,140,470,180,550,180,550,160);
quad(110,155,110,185,55,185,55,165);

//main brick
fill(126,70,44);

beginShape();
vertex(100,85);
vertex(150,85);
vertex(285,50);
vertex(430,80);
vertex(470,80);
vertex(470,180);
vertex(560,180);
vertex(560,190);
vertex(575,190);
vertex(575,285);
vertex(30,285);
vertex(30,180);
vertex(100,180);
endShape();

//glass
fill(133,155,153);

beginShape();
curveVertex(170,190);
curveVertex(170,190);
curveVertex(170,120);
curveVertex(170,120);
curveVertex(170,120);
curveVertex(285,95);
curveVertex(400,115);
curveVertex(400,115);
curveVertex(400,115);
curveVertex(400,190);
curveVertex(400,190);
endShape();


//lower wdws
int fatwdwx=110;
int spacex=30;
rect(fatwdwx,220,20,30);
rect(fatwdwx,260,20,25);
fatwdwx+=spacex;
rect(fatwdwx,220,20,30);
rect(fatwdwx,260,20,25);
fatwdwx+=spacex;
rect(fatwdwx,260,20,25);
rect(fatwdwx,220,20,30);
fatwdwx+=spacex;
rect(fatwdwx,260,20,25);
rect(fatwdwx,220,20,30);
fatwdwx+=spacex;
rect(fatwdwx,260,20,25);
rect(fatwdwx,220,20,30);
fatwdwx+=spacex;
rect(fatwdwx,260,20,25);
rect(fatwdwx,220,20,30);
fatwdwx+=spacex;
rect(fatwdwx,260,20,25);
rect(fatwdwx,220,20,30);
fatwdwx+=spacex;
rect(fatwdwx,260,20,25);
rect(fatwdwx,220,20,30);
fatwdwx+=spacex;
rect(fatwdwx,260,20,25);
rect(fatwdwx,220,20,30);
fatwdwx+=spacex;
rect(fatwdwx,260,20,25);
rect(fatwdwx,220,20,30);
fatwdwx+=spacex;
rect(fatwdwx,260,20,25);
rect(fatwdwx,220,20,30);
fatwdwx+=spacex;
rect(fatwdwx,260,20,25);
rect(fatwdwx,220,20,30);

rect(50,210,25,40);
rect(50,260,25,25);
rect(85,210,15,40);
rect(85,260,15,25);
rect(470,210,25,40);
rect(470,260,25,25);
rect(505,210,25,40);
rect(505,260,25,25);

//truss
fill(0);
rect(50,145,13,35);
rect(547,145,13,35);

stroke(0);
strokeWeight(3.5);
line(60,148,100,138);
line(549,146,470,125);
line(170,135,400,135);


strokeWeight(2);
line(170,175,400,175);
line(285,95,285,190);
line(255,99,255,190);
line(225,105,225,190);
line(195,112,195,190);
line(315,97,315,190);
line(345,102,345,190);
line(375,110,375,190);

//trim
noFill();
stroke(214,194,162);
strokeWeight(4);
beginShape();
vertex(100,85);
vertex(150,85);
vertex(285,50);
vertex(430,80);
vertex(470,80);
endShape();

line(30,180,100,180);
line(470,180,560,180);
line(560,190,575,190);
line(170,190,400,190);

noStroke();
fill(214,194,162);
int trimwdwx=100;
rect(trimwdwx,245,10,5);
rect(trimwdwx,170,10,10);
rect(trimwdwx,275,10,10);
trimwdwx +=spacex;
rect(trimwdwx,245,10,5);
rect(trimwdwx,170,10,10);
rect(trimwdwx,275,10,10);
trimwdwx +=spacex;
rect(trimwdwx,245,10,5);
rect(trimwdwx,170,10,10);
rect(trimwdwx,275,10,10);
trimwdwx +=spacex;
rect(trimwdwx,245,10,5);
rect(trimwdwx,215,10,5);
rect(trimwdwx,275,10,10);
trimwdwx +=spacex;
rect(trimwdwx,245,10,5);
rect(trimwdwx,215,10,5);
rect(trimwdwx,275,10,10);
trimwdwx +=spacex;
rect(trimwdwx,245,10,5);
rect(trimwdwx,215,10,5);
rect(trimwdwx,275,10,10);
trimwdwx +=spacex;
rect(trimwdwx,245,10,5);
rect(trimwdwx,215,10,5);
rect(trimwdwx,275,10,10);
trimwdwx +=spacex;
rect(trimwdwx,245,10,5);
rect(trimwdwx,215,10,5);
rect(trimwdwx,275,10,10);
trimwdwx +=spacex;
rect(trimwdwx,245,10,5);
rect(trimwdwx,215,10,5);
rect(trimwdwx,275,10,10);
trimwdwx +=spacex;
rect(trimwdwx,245,10,5);
rect(trimwdwx,215,10,5);
rect(trimwdwx,275,10,10);
trimwdwx +=spacex;
rect(trimwdwx,245,10,5);
rect(trimwdwx,170,10,10);
rect(trimwdwx,275,10,10);
trimwdwx +=spacex;
rect(trimwdwx,245,10,5);
rect(trimwdwx,170,10,10);
rect(trimwdwx,275,10,10);
trimwdwx +=spacex;
rect(trimwdwx,245,10,5);
rect(trimwdwx,170,10,10);
rect(trimwdwx,275,10,10);

rect(495,185,10,5);
rect(495,245,10,5);
rect(495,275,10,10);

rect(530,185,10,5);
rect(530,245,10,5);
rect(530,275,30,10);

rect(75,185,10,5);
rect(75,245,10,5);
rect(75,275,10,10);

rect(40,185,10,5);
rect(40,245,10,5);
rect(30,275,20,10);

stroke(214,194,162);
strokeWeight(2);
line(50,250,530,250);
line(30,180,100,180);
line(170,212,400,212);

//shadows
noStroke();
fill(49,12,7);
quad(470,140,489,145,489,178,470,178);
quad(560,200,575,218,575,285,560,285);
stroke(49,12,7);
strokeWeight(3);
line(505,185,505,285);
line(540,185,540,285);
line(470,170,470,285);
line(440,170,440,285);
line(410,170,410,285);
line(170,170,170,285);
line(140,170,140,285);
line(110,170,110,285);
line(85,185,85,285);
line(50,185,50,285);
}

