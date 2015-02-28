
size(320, 480);
background(255);
smooth();


//face
fill(0);
triangle(0, 320, 0, 480, 60, 480);
triangle(200, 480, 320, 480, 320, 270);


//Eyebrow
noFill();
strokeWeight(2);
arc(8, 190, 200, 180, PI+QUARTER_PI, TWO_PI, OPEN);
arc(220, 190, 220, 220, radians(180), radians(340), OPEN);
for (int i=0; i<190; i=i+10) {
  arc(220, i, 220, 220, radians(180), radians(340), OPEN);
}

for (int i=0; i<190; i=i+10) {
  arc(8, i, 200, 180, PI+QUARTER_PI, TWO_PI, OPEN);
}

//Eye
fill(0);
quad(20, 220, 20, 225, 70, 222, 70, 212);
quad(160, 210, 160, 215, 250, 222, 250, 212);


noFill();
//nose
stroke(0);
strokeWeight(2);
line(108, 190, 108, 320);
line(108, 320, 130, 320);
line(130, 320, 120, 350);
line(120, 390, 120, 480);

//Mouse
strokeWeight(4);
arc(120, 360, 20, 20, radians(110), radians(270));
arc(120, 380, 20, 20, radians(90), radians(270));







