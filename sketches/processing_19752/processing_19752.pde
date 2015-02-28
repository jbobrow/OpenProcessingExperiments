
size(250,250);
smooth();
background(#666667);

PFont font;
for(int x = 0; x < 50; x++) {
  font = loadFont ("Jenkinsv20-25.vlw");
  textFont(font);
  fill(255,180);
  text("M3H4B3", random (0, 200), random (0, 230));
  fill(255,120);
  text("M3H4B3", random (0, 230), random (0, 240));
  fill(255,50);
  text("M3H4B3", random (0, 210), random (0, 250));
  
  fill(#E88538,140);
  text("M3H4B3",40,60);
  
  fill(#D39260,20);
  text("M3H4B3",150,220);
  
  fill(#509547,140);
  text("M3H4B3",130,100);
  
  fill(#80B978,20);
  text("M3H4B3",20,160);
  
  fill(#3C6DAF,140);
  text("M3H4B3",90,180);
  
  fill(#779CCB,20);
  text("M3H4B3",180,30);
}

