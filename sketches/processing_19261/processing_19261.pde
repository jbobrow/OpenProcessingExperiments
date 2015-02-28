
size(250, 250);
background(#D5C3D8);
PFont font;
font = loadFont("CharlemagneStd-Bold-80.vlw");
textFont(font);
fill(0, 180);
text("L9C6W9", 0, 60);
for (int x = -60; x < 250; x += 90){
  smooth();
  fill(60, 170);
  textSize(60);
text("L9C6W9", x, 100);
 fill(60, 120);
  textSize(40);
text("L9C6W9", x, 130);
 fill(80, 160);
  textSize(30);
text("L9C6W9", x, 150);
 fill(190);
  
}
for (int x = -60; x < 250; x += 60){
  smooth();
  textSize(20);
  fill(30, 70);
text("L9C6W9", x, 170);

}
 for (int x = -60; x < 250; x += 40){
  textSize(13);
   fill(30, 40);
text("L9C6W9", x, 185);
 fill(30, 40);
  textSize(9);
text("L9C6W9", x, 195);
 fill(30, 20);
  textSize(8);
text("L9C6W9", x, 205);
 fill(30, 20);
  textSize(4);
text("L9C6W9", x, 215);
   }



