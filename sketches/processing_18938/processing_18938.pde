
//Homework1 by Nicky Silber
//January 20, 2011
//
//Room by Vincent Van Gogh
void setup(){
size(800,600);
smooth();
background(220,229,234);

//door1
beginShape();
strokeWeight(2);
fill(197,220,234);
vertex(100,0);
vertex(100,800);
vertex(0,800);
vertex(0,0);
endShape();

beginShape();
strokeWeight(4);
vertex(70,0);
vertex(70,194);
vertex(0,206);
endShape();

beginShape();
vertex(0,228);
vertex(70,216);
vertex(70,500);
endShape();

//thing next to door1, b4 towell
beginShape();
strokeWeight(1);
fill(247,228,147);
vertex(100,0);
vertex(100,500);
vertex(107,500);
vertex(107,0);
endShape();


//door2
beginShape();
fill(197,220,234);
strokeWeight(2);
vertex(725,0);
vertex(725,600);
vertex(800,600);
vertex(800,0);
endShape();

beginShape();
strokeWeight(4);
vertex(800,5);
vertex(765,12);
vertex(765,175);
vertex(800,175);
endShape();

beginShape();
strokeWeight(4);
vertex(800,292);
vertex(765,292);
vertex(765,202);
vertex(800,202);
endShape();

beginShape();
vertex(800,312);
vertex(765,312);
vertex(765,489);
vertex(800,510);
endShape();

//floor
beginShape();
strokeWeight(2);
fill(185,137,88);
vertex(0,500);
vertex(200,300);
vertex(500,300);
vertex(800,550);
vertex(800,800);
vertex(0,800);
endShape();

//wall
beginShape();
fill(197,220,234);
vertex(200,0);
vertex(200,300);
vertex(500,300);
vertex(500,0);
endShape();

//window
beginShape();
fill(29,33,24);
vertex(250,0);
vertex(250,175);
vertex(340,175);
vertex(340,0);
endShape();

//window pane1
beginShape();
noStroke();
fill(232,222,110);
vertex(260,0);
vertex(260,165);
vertex(285,165);
vertex(285,0);
endShape();

//window pane2
beginShape();
noStroke();
fill(232,222,110);
vertex(305,0);
vertex(305,165);
vertex(330,165);
vertex(330,0);
endShape();

stroke(29,33,24);
strokeWeight(4);
line(252,10,338,10);
line(252,60,338,60);
line(252,110,338,110);

stroke(0);
strokeWeight(4);
line(295,0,295,174);

//table undernneath
beginShape();
strokeWeight(1);
fill(222,111,20);
vertex(207,210);
vertex(207,330);
vertex(210,335);
vertex(213,335);
vertex(213,260);

vertex(260,270);
vertex(260,350);
vertex(265,355);
vertex(267,355);
vertex(267,270);

vertex(306,260);
vertex(306,330);
vertex(310,335);
vertex(313,335);
vertex(313,210);

endShape();

//table top
beginShape();
fill(222,111,20);
strokeWeight(1);
vertex(200,210);
vertex(260,225);
vertex(320,210);
vertex(260,195);
vertex(200,210);
vertex(200,220);
vertex(260,235);
vertex(320,220);
vertex(320,210);
endShape();

//chair leg2
beginShape();
fill(224,152,7);
vertex(50,278);
vertex(55,273);
vertex(65,277);
vertex(65,527);
vertex(56,527);
vertex(56,288);
endShape();

//chair back
beginShape();
fill(224,152,7);
vertex(13,304);
vertex(23,290);
vertex(26,288);
vertex(30,284);
vertex(40,280);
vertex(50,278);
vertex(60,283);
vertex(60,298);
vertex(13,326);
endShape();

beginShape();
vertex(13,341);
vertex(60,313);
vertex(60,323);
vertex(13,351);
endShape();

beginShape();
vertex(13,366);
vertex(60,338);
vertex(60,348);
vertex(13,376);
endShape();

//chair leg1
beginShape();
fill(224,152,7);
vertex(1,300);
vertex(2,304);
vertex(3,308);
vertex(4,310);
vertex(5,312);
vertex(7,320);
vertex(9,340);
vertex(8,360);
vertex(7,380);
vertex(6,420);
vertex(5,540);
vertex(6,545);
vertex(8,547);
vertex(10,547);
vertex(12,545);
vertex(13,540);
vertex(13,420);
vertex(14,380);
vertex(15,360);
vertex(16,340);
vertex(16,310);
vertex(15,307);
vertex(14,305);
vertex(13,304);
vertex(12,302);
vertex(10,301);
vertex(8,300);
vertex(7,299);
endShape();

//chair seat
beginShape();
noStroke();
fill(125,152,69);
vertex(9,420);
vertex(13,405);
vertex(13,400);
vertex(65,372);
vertex(125,396);
vertex(85,450);
vertex(9,420);
endShape();

//chair legs
stroke(224,152,7);
strokeWeight(10);
line(85,440,85,567);
line(120,396,120,530);

strokeWeight(8);
line(85,537,13,517);
line(85,515,13,497);
line(85,537,120,475);
line(85,515,120,450);


}

void draw(){
  println("x: " + mouseX);
  println("y: " + mouseY);
}


