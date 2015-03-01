
/* @pjs preload="southpark.png,rocket.png"; */

size(500,500); 


background(77,186,237); //255 is white, 0 is black

noStroke();
fill(255);
ellipse(370,53,40,20);
ellipse(350,65,50,30);
ellipse(385,70,50,28);

ellipse(400,48,40,20);
ellipse(380,60,50,30);
ellipse(415,65,50,28);

ellipse(480,198,40,20);
ellipse(460,210,50,30);
ellipse(495,215,50,28);

//noStroke();

//point(250,250);

noFill();
strokeWeight(18);
stroke(30,150,70);
arc(240, 320, 130, 180, 0, QUARTER_PI, OPEN);

PImage img2;
img2 = loadImage("rocket.png");
image(img2, 80, 300);

strokeWeight(15);
arc(160, 150, 300, 280, 0, QUARTER_PI, OPEN);
strokeWeight(18);
arc(210, 330, 130, 180, 0, QUARTER_PI, OPEN);


noStroke();
fill(50,170,50);
triangle(215, 180, 220, 370, 345, 310);

noFill();
strokeWeight(15);
stroke(30,150,70);
line(220,250,170,260);
line(170,260,165,230);

fill(255);
ellipse(220,160,100,100);

PImage img;
img = loadImage("southpark.png");
image(img, 120, 80, width/2.5, height/3);





//rect(190, 220, 100, 110, 7);

stroke(0);


fill(100,255); //<>//
strokeWeight(10);
line(205,210,70,260);
noStroke();
ellipse(100,248,10,5);

fill(210,255);
ellipse(100,230,20,15);

ellipse(85,200,45,26);

ellipse(25,130,80,50);
ellipse(15,120,100,50);
fill(200,255);
ellipse(15,80,80,40);
ellipse(95,2250,25,18);
ellipse(70,175,70,35);
fill(190,255);
ellipse(80,210,30,20);
ellipse(45,180,60,40);
ellipse(50,150,90,40);

fill(205,40,40);
//ellipse(60,430,20,20);
//ellipse(50,440,30,30);
//ellipse(20,450,20,20);
//ellipse(80,420,22,22);


