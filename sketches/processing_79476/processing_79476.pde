
size(500,500);
background(13,110,129);
smooth();

fill(171,228,235);
noStroke();
ellipse(200,245,18,65); //back left arm
ellipse(410,220,35,40); //back right leg
quad(392,220,380,290,400,290,427,224); //back right leg

fill(81,198,201);
arc(280,300,286,262,0,PI); //shell

fill(250,247,184);
arc(280,300,281,84,PI,TWO_PI); //body

fill(255);
rect(120,290,320,30); //white shell
ellipse(120,305,30,30); //white shell left
ellipse(440,305,30,30); //white shell right

fill(140,219,234);
quad(77,197,140,290,180,290,195,234); //neck fill
bezier(203,225,175,260,230,270,172,268); //neck curve
ellipse(160,150,190,190); //head
bezier(66,168,78,200,88,240,140,290); //neck outer

stroke(0);
noFill();
bezier(198,267,200,270,200,278,200,289); //body line left

noStroke();
fill(146,233,250);
ellipse(140,223,45,45); //front left arm
quad(160,214,205,290,177,290,125,240); //front left arm
ellipse(400,225,42,35); //front right leg
quad(379,225,421,225,413,290,390,290); //front right leg

fill(214);
ellipse(200,165,25,7); //cheek
bezier(186,165,181,175,186,169,200,168); //cheek left
bezier(213,165,220,155,210,160,200,161); //cheek right

fill(0);
ellipse(181,140,16,16); //eye

stroke(0);
noFill();
line(154,360,405,360); //shell line
line(189,400,370,400); //shell line
bezier(280,258,281,270,281,278,280,290); //body line middle
bezier(360,265,361,268,361,270,360,290); //body line right

strokeWeight(2);
bezier(185,121,173,119,170,135,170,140); //eyebrow
bezier(220,188,227,163,243,200,250,158); //mouth
bezier(250,158,251,155,252,155,254,155); //mouth

textSize(50);
fill(255);
text("a",16,70);
text("w",12,130);
text("k",16,190);
text("w",12,250);
text("a",16,310);
text("r",17,370);
text("d",16,430);
text("t  u  r  t  l  e",125,480);
