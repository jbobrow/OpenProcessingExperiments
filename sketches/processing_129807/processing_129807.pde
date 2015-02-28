
//Nicolette Hashey
//House
//1/22/2014


int w=250;
int h=250;
int triwidth=120;
int triheight= 110;
int cwidth=16;
int cheight=110;
int scolwidth=12;
int scolheight=60;
int bottom=370;
int addupleftx=100;
int adduplefty=280;
int addlefth=90;
int addleftcenterx=157;
int addtopwindowy=242;
void setup() {
  size(500, 500);
}

void draw() {
  background(#99FFCC); 

  //sun
  fill(#FFCC33);
  noStroke();
  ellipse(75, 75, 100, 100);

  //ground
  fill(#669933);
  noStroke();
  rect(0, 370, 500, 500);


  //left addition roof
  fill(#000066);
  stroke(#000066);
  strokeWeight(20);
  triangle(addleftcenterx-55, adduplefty, addleftcenterx+55, adduplefty, addleftcenterx, 230);

  //left addition
  fill(#3399CC);
  noStroke();
  rect(addupleftx, adduplefty, triwidth-7, addlefth);

  //left addition rounded top
  fill(#3399CC);
  stroke(#FFFFCC);
  strokeWeight(5);
  arc(addleftcenterx, adduplefty+3, triwidth-10, 15, PI, 2*PI);

  //left addition column
  noStroke();
  fill(#660033);
  rect(addupleftx-4, adduplefty, cwidth-2, cheight-20);

  //left addition horizontal
  //fill(#FFFFCC);
  //rect(addupleftx, adduplefty, 113, cwidth-8);

  //left addition upper window
  fill(#FFCC00);
  stroke(#FFFFCC);
  strokeWeight(3);
  rect(addleftcenterx-20, addtopwindowy, 40, 20);

  //left addition upper window lines
  line(addleftcenterx, addtopwindowy, addleftcenterx, addtopwindowy+20);
  line(addleftcenterx-20, addtopwindowy+10, addleftcenterx+20, addtopwindowy+10);




  //right addition roof
  fill(#000066);
  stroke(#000066);
  strokeWeight(20);
  triangle(addleftcenterx+191, adduplefty, addleftcenterx+302, adduplefty, addleftcenterx+247, 230);

  //right addition
  fill(#3399CC);
  noStroke();
  rect(addupleftx+248, adduplefty, triwidth-7, addlefth);

  //right addition rounded top
  fill(#3399CC);
  stroke(#FFFFCC);
  strokeWeight(5);
  arc(addleftcenterx+248, adduplefty+3, triwidth-10, 15, PI, 2*PI);

  //right addition column
  noStroke();
  fill(#660033);
  rect(addupleftx+357, adduplefty, cwidth-2, cheight-20);

  //right addition horizontal
  //fill(#FFFFCC);
  //rect(addupleftx+249, adduplefty, 113, cwidth-8);

  //right addition upper window
  fill(#FFCC00);
  stroke(#FFFFCC);
  strokeWeight(3);
  rect(addleftcenterx+228, addtopwindowy, 40, 20);

  //right addition upper window lines
  line(addleftcenterx+248, addtopwindowy, addleftcenterx+248, addtopwindowy+20);
  line(addleftcenterx+228, addtopwindowy+10, addleftcenterx+268, addtopwindowy+10);






  //roof
  fill(#000066);
  noStroke();
  triangle(200, 260, 360, 260, 280, 175);

  //roof interior
  fill(#3399CC);
  stroke(#FFFFCC);
  strokeWeight(2);
  triangle(220, 260, 340, 260, 280, 195);

  //main blue center
  noStroke();
  fill(#3399CC);
  rect(220, 260, triwidth, triheight);

  //front horizontal bar
  fill(#660033);
  quad(220, 260, 340, 260, 330, 250, 230, 250);

  //left column
  fill(#660033);
  rect(213, 260, cwidth, cheight);

  //right column
  fill(#660033);
  rect(332, 260, cwidth, cheight);

  //arc above door
  stroke(#FFFFCC);
  strokeWeight(10);
  noFill();
  arc(280, 310, 80, 60, PI, 2*PI);

  //left door column
  fill(#FFFFCC);
  noStroke();
  rect(235, 310, scolwidth, scolheight);

  //right door column
  fill(#FFFFCC);
  rect(314, 310, scolwidth, scolheight);

  //door overhead horizontal
  fill(#FFFFCC);
  rect(238, 308, 84, 10);

  //door
  fill(#993399);
  rect(247, 318, 67, scolheight-8);
  stroke(0);
  strokeWeight(1);
  line(280, 318, 280, bottom-1);
}



