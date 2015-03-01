
/*@pjs preload="sheep2_goat.png,sheep2_emotional.png,sheep2_sheep.png,sheep2_white.png ;*/


size(400,400);

background(255);

//white box
stroke(0);
fill(255,255,255);
rect(50,100,300,200);

//pink line

stroke(255,164,224);
strokeWeight(15);
line(0,50,50,0);

stroke(255,164,224);
strokeWeight(15);
line(0,100,100,0);

stroke(255,164,224);
strokeWeight(15);
line(0,150,150,0);

stroke(255,164,224);
strokeWeight(15);
line(0,200,200,0);

stroke(255,164,224);
strokeWeight(15);
line(0,250,250,0);

stroke(255,164,224);
strokeWeight(15);
line(0,300,300,0);

stroke(255,164,224);
strokeWeight(15);
line(0,350,350,0);

stroke(255,164,224);
strokeWeight(15);
line(0,400,400,0);

stroke(255,164,224);
strokeWeight(15);
line(0,450,450,0);

stroke(255,164,224);
strokeWeight(15);
line(0,500,500,0);

stroke(255,164,224);
strokeWeight(15);
line(0,550,550,0);

stroke(255,164,224);
strokeWeight(15);
line(0,600,600,0);

stroke(255,164,224);
strokeWeight(15);
line(0,650,650,0);

stroke(255,164,224);
strokeWeight(15);
line(0,700,700,0);

stroke(255,164,224);
strokeWeight(15);
line(0,750,750,0);




///big box

//white 4 box
stroke(255);
strokeWeight(1);
fill(255);
rect(0,0,50,400);

stroke(255);
strokeWeight(1);
fill(255);
rect(350,0,400,400);

stroke(255);
strokeWeight(1);
fill(255);
rect(50,300,400,400);

stroke(255);
strokeWeight(1);
fill(255);
rect(0,0,350,100);

//yerrow ellipse
//ellipseMode(CENTER);
//noStroke(); 
//fill(255,215,96);
//ellipse(100,100,180,180);

//yerrow ellipse
ellipseMode(CENTER);
noStroke(); 
fill(255,215,96);
ellipse(100,90,160,160);



//green collor box
rectMode(CORNER);
stroke(97,252,192);
strokeWeight(1);
fill(97,252,192);
rect(50,100,300,70);



///image
PImage img1,img2,img3,img4;
img1 = loadImage("sheep2_goat.png");
image(img1,0,0);

img2 = loadImage("sheep2_emotional.png");
image(img2,0,0);

img3 = loadImage("sheep2_sheep.png");
image(img3,0,0);

img4 = loadImage("sheep2_white.png");
image(img4,0,0);







