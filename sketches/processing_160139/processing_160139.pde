
void setup() {
  size(600, 600);
  background(#2027D3);
  
//Moon
  stroke(#A8E1FC);
  strokeWeight(4);
  ellipse(200,100,70,70);
//moon craters
  noStroke();
  fill(#BADBDA);
  ellipse(210,110,17,20);
  ellipse(190,90,15,12);
  ellipse(178,113,11,13);
  
//ground
  fill(#033A55);
  stroke(#033A55);
  rect(0,500,600,600);
  
//building1
  noStroke();
  fill(#02161F);
  rect(50,300,100,200);
//building1 roof
  quad(75,250,125,250,150,300,50,300);
//building1 windows
  fill(#D1CB08);
  rect(70,320,20,20);
  rect(110,320,20,20);
  rect(70,370,20,20);
  rect(110,370,20,20);
  rect(70,420,20,20);
  rect(110,420,20,20);
  
//Hospital
  fill(#02161F);
  rect(200,350,200,150);
//Red Cross
  fill(#9D0808);
  rect(285,350,20,50);
  rect(270,365,50,20);
//Hospital windows
  fill(#D1CB08);
  rect(220,400,55,30);
  rect(220,455,55,30);
  rect(315,400,55,30);
  rect(315,455,55,30);
  stroke(#02161F);
  line(220,415,390,415);
  line(220,470,390,470);
  line(248,400,248,490);
  line(343,400,343,490);

//building3
  fill(#02161F);
  rect(430,250,100,248);
  noStroke();
  triangle(480,200,530,250,430,250);
//building3 neon
  fill(#A01B17);
  rect(440,260,5,70);
  fill(#DE9A1B);
  rect(455,260,5,70);
  fill(#D6DE1B);
  rect(470,260,5,70);
  fill(#27A51C);
  rect(485,260,5,70);
  fill(#1A2F95);
  rect(500,260,5,70);
  fill(#6A1989);
  rect(515,260,5,70);
//building3 windows
  fill(#D1CB08);
  rect(440,365,20,30);
  rect(440,430,20,30);
  rect(500,365,20,30);
  rect(500,430,20,30);
  
//Stars
  stroke(#FFFFF2);
  point(5,20);
  point(500,40);
  point(330,140);
  point(20,300);
  point(200,200);
  point(180,290);
  point(110,140);
  point(550,340);
  point(300,270);
  point(420,240);
  point(470,120);
  point(125,60);
  point(280,100);
  point(590,210);
  
}
  


