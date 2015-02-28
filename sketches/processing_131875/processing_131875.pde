

/* @pjs preload="Puddle.png"; */
/* @pjs preload="rain.jpeg"; */

size(400,600);

background(#BCD8E5);

PImage img;
  img = loadImage("Puddle.png");
  tint(255, 126);
  image(img, -100, 300);
  
PImage img4;
  img4 = loadImage("Puddle.png");
  tint(255, 126);
  image(img, -550, 0);
  
PImage img2;
  img2 = loadImage("rain.jpeg");
  tint(160, 50);
  image(img, 0, 0);
  
PImage img3;
  img3 = loadImage("rain.jpeg");
  tint(160, 50);
  image(img, -100, 300);

//tail
beginShape();
fill(99, 116, 139);
vertex(190, 360);
vertex(240, 260);
vertex(260, 220);
vertex(280,260);
vertex(340, 220);
vertex(320, 280);
vertex(340, 320);
vertex(280, 300);
vertex(280, 340);
vertex(240, 300);
endShape(CLOSE);

//foot1
strokeWeight(1);
fill(99, 116, 139);
ellipse(180, 390, 100, 30);

//foot2
strokeWeight(1);
fill(99, 116, 139);
ellipse(160, 420, 100, 30);

//neck
strokeWeight(1);
fill(99, 116, 139);
quad(200, 260, 220, 220, 200, 320, 180, 320);

//body
fill(#BAC9DE);
ellipse(200, 360, 100, 100);

//bodyinner
strokeWeight(0);
fill(99, 116, 139, 100);
ellipse(185, 360, 40, 50);

//antenna1
strokeWeight(2);
line (160, 220, 115, 200);

//antenna2
strokeWeight(2);
line (160, 220, 150, 200);

//head
strokeWeight(1);
fill(#BAC9DE);
quad(160, 280, 140, 240, 200, 180, 240, 240);

//mouth
strokeWeight(1);
line(180, 260, 200, 240);

//eyeA
strokeWeight(1);
fill(255);
ellipse(160, 240, 30, 30);

//eyeB
strokeWeight(1);
fill(255);
ellipse(180, 220, 30, 30);

//eyefillA
strokeWeight(1);
fill(99, 116, 139);
ellipse(160, 240, 10, 10);

//eyefillB
strokeWeight(1);
fill(99, 116, 139);
ellipse(180, 220, 10, 10);

//arm
strokeWeight(1);
fill(99, 116, 139);
ellipse(170, 340, 50, 25);

//flowerstem
noStroke();
fill(100, 250, 150, 245);
curve(100, 100, 150, 350, 100, 250, 15, 30);

//flowerpetal1
noStroke();
fill(250, 0, 100);
ellipse(100, 273, 15, 30);

//flowerpetal2
noStroke();
fill(150, 0, 100, 100);
ellipse(105, 273, 15, 30);

//flowerpetal3
noStroke();
fill(150, 0, 100, 100);
ellipse(95, 273, 15, 30);

//cloudone
noStroke();
// blendMode(BLEND);
fill(0, 140, 200, 100);
ellipse(300, 50, 120, 80);

//cloudtwo
noStroke();
//blendMode(BLEND);
fill(0, 100, 200, 100);
ellipse(300, 89, 60, 60);

//cloudthree
noStroke();
//blendMode(BLEND);
fill(0, 75, 200, 100);
ellipse(350, 80, 60, 60);

//cloudfour
noStroke();
//blendMode(BLEND);
fill(0, 150, 200, 100);
ellipse(350, 50, 60, 60);

//cloudfive
noStroke();
//blendMode(BLEND);
fill(0, 200, 200, 100);
ellipse(300, 50, 60, 60);

//cloudsix
noStroke();
fill(50, 200, 250, 100);
ellipse(315, 25, 60, 60);

//cloudseven
noStroke();
//blendMode(BLEND);
fill(0, 140, 200, 100);
ellipse(290, 25, 60, 60);

//cloudeight
noStroke();
//blendMode(BLEND);
fill(0, 75, 200, 100);
ellipse(250, 25, 60, 60);

//cloudnine
noStroke();
//blendMode(BLEND);
fill(0, 75, 200, 100);
ellipse(335, 25, 60, 60);

//cloudten
noStroke();
//blendMode(BLEND);
fill(0, 100, 255, 100);
ellipse(250, 55, 60, 60);

//cloudeleven
noStroke();
//blendMode(BLEND);
fill(0, 100, 255, 100);
ellipse(300, 55, 60, 60);

//cloudtwelve
noStroke();
//blendMode(BLEND);
fill(0, 100, 150, 100);
ellipse(275, 75, 60, 60);

//circle
noStroke();
//blendMode(BLEND);
fill(0, 100, 150, 100);
ellipse(50, 600, 200, 200);

//circle2
noStroke();
//blendMode(BLEND);
fill(0, 100, 200, 100);
ellipse(75, 500, 100, 100);

//PFont font;
//font = loadFont("Amatic-Bold-48.vlw");
//textFont(font, 150);
fill(255);
text("Sad Robot", 10, 570);




