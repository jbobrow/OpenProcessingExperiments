
// Kao, Meng-Ting
// Intro to Creative Programming
// Exercise one

size(640, 360);
smooth();
background(86, 170, 183);

// (up, first)
fill(0);
noStroke();
rect(0, 0, 160, 180);
for (int a= 40; a<160; a +=40){
for (int b= 20; b<180; b +=20){
  smooth();
  stroke(86, 170, 183,100);
  strokeWeight(2);
  line (a, 0, a, 180);
  line (0, b, 160, b);
  fill(86, 170, 183);
  ellipse(a, b, 8, 8);
}
}

// (up, third)
fill(0);
noStroke();
rect(320, 0, 160, 180);
strokeWeight(3);
stroke(86, 170, 183 ,200);
line(360, 0, 360, 180);
line(440, 0, 440, 180);
for(int i= 0; i<160; i +=20 ){
  line(320, i, 360, i+40 );
  line(360, i+40, 400, i);
}
for(int i= 0; i<160; i +=20 ){
  line(400, i, 440, i+40 );
  line(440, i+40, 480, i);
}

//(up, second)
noStroke();
for(int y=0; y<=160; y +=40) {
  for(int x=160; x<=300; x +=40) {
   fill(0);
rect(x, y, 20, 20);
  }
}
for(int y=20; y<=160; y +=40) {
  for(int x=180; x<=300; x +=40) {
   fill(253, 209, 0, 220 );
rect(x, y, 20, 20);
  }
}

//(up, fourth)
fill(0);
noStroke();
for (int a=480; a<640; a +=20){
  for(int b=0; b<180; b +=40){
  triangle (a, b, a+20,b, a+20, b+20);
  }
}
fill(253, 209, 0, 220);
for (int a=480; a<640; a +=20){
  for(int b=20; b<180; b +=40){
  triangle (a, b, a+20,b, a+20, b+20);
  }
}

//(down, one);
for(int x=0; x<=160; x +=20){
for(int y=200; y<360; y +=20){
  fill(253, 209, 0, 180 );
  ellipse (x, y, 25, 25);
  
}
}
//(down, two)
fill(0);
noStroke();
rect(160, 180, 160, 180);
for(int a=160; a < 300; a +=20){
  for(int b=180;b<360; b+=20){
    stroke(86, 170, 183, 200);
    strokeWeight(2);
    line (a, 180, a+40, 360);
    stroke(86, 170, 183, 30);
    line (a, 360, a+40, 180);
  }
}
//(down, third)
noStroke();
for (int y=180; y<=height; y+=8) {
for ( int x=333; x<=width-170; x+=15 ){
  fill(253, 209, 0, 180);
  ellipse(x, y, y/11.0-16, y/11.0-16); 
}
}

//(down fourth)
fill(0);
rect(480, 180, 160, 180);
for (int a=480; a<=640; a+=10){
  for(int b= 180; b<=360; b +=10){
    stroke(86, 170, 183, 100);
    //ellipse(a, b, 2, 2);
    line(a, b, 560, 270);
  }
}
