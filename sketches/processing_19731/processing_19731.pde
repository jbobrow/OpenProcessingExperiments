
PFont font;

size(250, 250);
background(#052121);
font = loadFont ("Copperplate-Light-90.vlw");
smooth();

//background
noStroke();
fill(#BBDFEB, 100);
rect (30, 30, 190, 190);
fill(#052121);
rect (50, 50, 150, 150);

//letter streams
for (int i=0; i<100; i+=1) {
  fill(#5C6B63);
  textFont(font); 
  text("9", i+70, i+30);
}
for (int i=0; i<190; i+=1) {
  fill(#D96523);
  textFont(font); 
  text("7", i+10, i+60);
}
for (int i=0; i<190; i+=1) {
  fill(#143840);
  textFont(font); 
  text("N", i-50, i+30);
}

for (int i=0; i<190; i+=1) {
  fill(#A69E89);
  textFont(font); 
  text("A", i-70, i-30);
}
for (int i=0; i<190; i+=1) {
  fill(#E0C297);
  textFont(font); 
  text("5", i-120, i);
}
for (int i=0; i<100; i+=1) {
  fill(#143840);
  textFont(font); 
  text("K", i, i);
}
//letter and number fills and positioning
fill(255);
text("K", 100, 100);
fill(255);
text("9", 170, 130);
fill(255);
text("A", 120, 160);
fill(255);
text("5", 70, 190);
fill(255);
text("N", 140, 220);
fill(255);
text("7", 200, 250);

