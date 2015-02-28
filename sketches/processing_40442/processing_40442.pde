
void setup() {
  size(500,700);
  background(55,6,124);
}
void mousePressed(){
 stroke(0);
 fill(175);
 ellipse(mouseX,mouseY,74,50);
}
void draw() {
smooth();
fill(mouseX,0,mouseY);
line(mouseX-10,mouseY + 50,pmouseX-10,pmouseY + 60);
line(mouseX + 300,mouseY + 50,pmouseX + 10,pmouseY + 60);
line(mouseX-10,mouseY + 50,pmouseX-10,pmouseY + 200);
line(mouseX + 10,mouseY + 50,pmouseX + 10,pmouseY + 60);
size(500,700);
map(150,0,500,10,450);
stroke(63,232,230);
fill(mouseX,0,mouseY-211);
quad(15,25,430,22,90,688,422,500);
rect(mouseX,mouseY,23,50);
ellipseMode(CENTER);
noStroke();
fill(191,162,150,400);
ellipse(185,150,300,245);
fill(123,194,196,200);
quad(300,75,175,90,200,200,400,100);
fill(252,92,172);
quad(300,375,433,412,200,456,402,399);
fill(90,90,90,140);
rect(243,250,150,43);
stroke(0);
strokeWeight(12);
line(385,482, 22,54);
line(22,287,41,400);
noStroke();
fill(242,51,51,130);
ellipse(200,550,276,45);
ellipse(mouseX-25,mouseY-73,25,70);
noFill();
strokeWeight(5);
stroke(99,0,255);
quad(134,465,167,500,235,504,178,544);
stroke(0,255,40);
line(100,42,145,450);
point(345,115);
point(405,250);
stroke(88,58,227);
line(345,115,405,250);
stroke(255);
point(350,200);
fill(144);
noStroke();
arc(350,200,50,75,1,5);
stroke(0);
point(365,230);
point(430,400);
stroke(49,193,168);
line(365,230,430,400);
noStroke();
fill(255,245,152);
point(260,200);
ellipse(260,200,60,45);
stroke(0);
point(255,200);
strokeWeight(20);
arc(255,200,50,50,4,7);
stroke(49,175,211);
arc(mouseX-255,mouseY-200,50,50,4,7);
stroke(0);
fill(143,193,37);
arc(380,200,50,50,4,7);
stroke(211,68,154);
point(376,200);
strokeWeight(35);
stroke(0,0,0,200);
point(350,390);
noFill();
strokeWeight(4);
arc(350,390,75,80,3,5);
point(380,500);
point(340,545);
strokeWeight(15);
stroke(117,227,108,200);
line(380,500,340,545);
stroke(31,77,0,300);
arc(345,575,90,90,5,9);
stroke(118,1,15);
point(380,490);
stroke(118,1,15,185);
point(365,491);
stroke(118,1,15,50);
point(350,492);
stroke(118,1,15,200);
point(330,491);
point(225,335);
fill(182,180,232,60);
ellipse(225,335,150,200);
point(245,333);
stroke(9,7,98);
arc(200,300,75,200,2,5);
point(250,675);
point(275,625);
stroke(255,206,44);
line(250,675,275,625);
line(230,680,200,675);
strokeWeight(2);
stroke(0);
point(200,175);
strokeWeight(4);
point(224,185);
strokeWeight(5);
point(210,165);
strokeWeight(7);
point(208,145);
point(300,200);
point(350,375);
point(100,300);
point(50,500);
noStroke();
fill(173,242,78,110);
quad(208,145,300,375,50,500,100,300);
fill(195,104,229,30);
quad(218,245,370,370,59,520,200,350);
stroke(227,80,80);
strokeWeight(59);
point(75,250);
strokeWeight(4);
stroke(149,188,127);
fill(75,20,20,150);
arc(80,230,85,90,3,7);
line(pmouseX ,pmouseY ,mouseX ,mouseY);
}
void keyPressed(){
  fill(250,255,178,200);
  rect(250,350,50,400);
  fill(129,97,27);
  stroke(5,169,255);
  rect(400,573,10,400);
  fill(255);
  noStroke();
  ellipseMode(CENTER);
  ellipse(250,350,300,300);
  
 
}












