
//ID3 W1 Assignment - Art Crop,  City lanscape Architectual piece Sep.17 2013

size(640, 480);
smooth();
background(#fbfadf);
float filVal = 255;

//Ellipse
noFill();
//EllipseA
stroke(#ec008b);
ellipse(100, 50, 450, 450);
//EllipseB
stroke(#f05a28);
ellipse(400, 100, 170, 170);
//EllipseC
stroke(#00adef);
ellipse(545, 100, 170, 170);
//ElipseD
stroke(#91268f);
ellipse(580, 95, 355, 355);


//EllipseAline
stroke(#ec008b);
line(0, 100, 280, 185);
line(220, 240, 100, -70);
line(300, 150, 0, 150);
line(-20, 275, 80, -70);
line(-55, 250, 125, 0);

//EllipseBline
stroke(#f05a28);
line(483, 120, 360, 25);
line(420, 182, 325, 60);
line(330, 148, 360, 26);
line(395, 185, 395, 15);


//EllipseCline
stroke(#00adef);
line(465, 75, 570, 180);
line(465, 130, 630, 95);

//EllipseDline
stroke(#91268f);
line(465, 230, 665, 20);
line(465, 230, 665, 110);
line(550, 270, 625, -20);
line(410, 50, 660, 75);

noStroke();
//ShapeA
fill(#ec008b);
triangle(125, -3, 16, 151, 187, 151);
quad(20, 460, 20, 480,  185,480, 185,460);

//ShapeB
fill(#f05a28);
quad(360, 26, 346, 87, 395, 149, 395, 52);
quad(347, 420, 347, 480,  395,480, 395,420);
quad(375, 390, 347, 420,  395,420, 395,390);


//ShapeC
fill(#00adef, 80);
arc(603, 70, 400, 415, radians(105), radians(186));
triangle( 465, 480, 500, 480, 525, 390);
fill(#00adef);
triangle( 500, 480, 545, 480, 525, 390);

//shapeD

fill(#ec008b, 80);
triangle(597, 90, 580, 160, 466, 230);
fill(#ec008b);
quad(551,340, 551, 480, 601, 480, 601, 325);

stroke(#ec008b);
strokeWeight(1);
for (int i=20; i<21; i=i+15) {
  for (int j=160; j<height; j=j+15) {
    line( i, j, i, j+3);
  }
}

for(int i=184; i<185; i=i+15){
   for(int j=160;j<height; j=j+15){
     line(i, j, i, j+3);
   }
}

for(int i=346; i<347; i=i+15){
   for(int j=100;j<height; j=j+15){
     line(i, j, i, j+3);
   }
}

for(int i=395; i<396; i=i+15){
   for(int j=140;j<height; j=j+15){
     line(i, j, i, j+3);
   }
}


for(int i=405; i<406; i=i+15){
   for(int j=80;j<height; j=j+15){
     line(i, j, i, j+3);
   }
}

for(int i=465; i<466; i=i+15){
   for(int j=245;j<height; j=j+15){
     line(i, j, i, j+3);
   }
}

for(int i=551; i<552; i=i+15){
   for(int j=270;j<height; j=j+15){
     line(i, j, i, j+3);
   }
}

for(int i=601; i<602; i=i+15){
   for(int j=80;j<height; j=j+15){
     line(i, j, i, j+3);
   }
}



