
size(1000,1000);
background(175,247,245);
fill(100,98,98);
ellipse(140, 400, 200, 200);//TUBE
fill(152,150,150);
ellipse(140,400,180,180);//TUBE
line(66,350,215,350);
fill(100,98,98);
ellipse(850, 400, 200, 200);
fill(152,150,150);
ellipse(850,400,180,180);
line(776,350,925,350);
fill(39,37,37);
quad(0,530,1000,530,1000,1000,0,1000);//road
fill(152,151,150);
quad(0,505,250,505,250,530,0,530);//sidewalk
quad(1000,505,750,505,750,530,1000,530);//sidewalk
fill(46,45,44);
triangle(74,505,94,490,114,505); // base of the tube
triangle(167,505,187,490,207,505);
triangle(780,505,800,490,820,505);
triangle(880,505,900,490,920,505);
textSize(12);
text("Entrada", 120,345);
textSize(12);
text("Saída", 835,345);
fill(229,0,19);
rectMode(CORNERS);
fill(252,0,4);
rect(300,505,480,305);
rect(510,505,700,305);
fill(255,255,255);
rect(310,390,460,315);
rect(520,390,680,315);
fill(0);
quad(300,505,330,505,330,530,300,530);
quad(450,505,480,505,480,530,450,530);
quad(515,505,545,505,545,530,515,530);
quad(670,505,700,505,700,530,670,530);
fill(252,231,28);
ellipse(310,475,20,20);
ellipse(460,475,20,20);
strokeWeight(20);
stroke(246,255,0);
line(500,550,500,700);
strokeWeight(20);
stroke(246,255,0);
fill(9,142,1);
textSize(20);
text("CURITIBA" , 550,450);
fill(255);
stroke(255);
for(int x=100;x<=500;x+=40) //cloud
{
  ellipse(x,100,70,80);
}
strokeWeight(1);
stroke(0);
for(int x=0;x<=1000;x+=40)
{
  rectMode(CENTER);
  rect(x,880,30,200);
}
