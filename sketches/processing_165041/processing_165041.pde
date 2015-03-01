
/*@pjs preload="rose.png,leaf.png";*/
PImage img1,img2;

size(400,400);
background(255);
img1 = loadImage("rose.png");
img2 = loadImage("leaf.png");

stroke(150,130,200,95);
strokeWeight(15);
line(0,0,400,400);//mannnaka
line(-10,50,370,430);//sita
line(-20,100,340,460);
line(-30,150,310,490);
line(-40,200,280,520);
line(-50,250,250,550);
line(-60,300,220,580);
line(50,-10,430,370);//ue
line(100,-20,460,340);
line(150,-30,490,310);
line(200,-40,520,280);
line(250,-50,550,250);
line(300,-60,580,220);

line(0,400,400,0);//migimannaka
line(10,450,430,30);
line(20,500,460,60);
line(30,550,490,90);
line(40,600,520,120);
line(50,650,550,150);
line(60,700,580,180);
line(-10,350,350,-10);//ue
line(-20,300,300,-20);
line(-30,250,250,-30);
line(-40,200,200,-40);
line(-50,150,150,-50);
line(-10,60,60,-10);

tint(252, 122, 168);
image(img1, 280,290,100,100);
tint(97,142,90);
image(img2, 277,290,100,100);



