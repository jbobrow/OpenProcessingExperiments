
size(300,300);// creates a 300x300 pixel sketch: size(width,height);
smooth();// turns on anti-aliasing to make shapes look nicer

/************************************************
*        EYES
************************************************/
noFill();
ellipse(80, 66, 55, 55);// rings around left eye
ellipse(80, 66, 30, 30);
ellipse(80, 67, 31, 31);

ellipse(220, 66, 55, 55);// rings around right eye
ellipse(220, 66, 29, 29);
ellipse(220, 67, 31, 31);

fill(24, 152, 255);// blue color for eyes
ellipse(80,66,20,20);// left eye
ellipse(220,66,20,20);// right eye
noFill();

/************************************************
*        LEFT HAND AND ARM
************************************************/
rect(40, 230, 33, 36);//left palm
rect(40, 220, 6, 10);//left pinky
rect(38, 213, 6, 7);
rect(40, 205, 6, 8);
rect(49, 215, 6, 15);//left ring finger
rect(48, 208, 6, 7);
rect(49, 200, 6, 8);
rect(58, 215, 6, 15);//left middle finger
rect(58, 205, 6, 10);
rect(58, 197, 6, 8);
rect(67, 215, 6, 15);//left index finger
rect(66, 208, 6, 7);
rect(67, 200, 6, 8);
rect(58, 250, 15, 16);//left thumb
rect(70, 240, 5, 10);
rect(63, 240, 7, 5);
rect(50,266,15,40);//left arm

/************************************************
*        RIGHT HAND AND ARM
************************************************/
rect(232, 230, 33, 36);//right palm
rect(259, 220, 6, 10);//right pinky
rect(261, 213, 6, 7);
rect(259, 205, 6, 8);
rect(250, 230, 6, 10);//right ring finger
rect(249, 240, 6, 8);
rect(241, 230, 6, 10);//right middle finger
rect(240, 240, 6, 8);
rect(232, 215, 6, 15);//right index finger
rect(233, 208, 6, 7);
rect(232, 200, 6, 8);
triangle(232, 266, 232, 256, 220, 260);//right thumb
triangle(232, 266, 216, 245, 220, 260);
rect(240,266,15,40);//right arm

/************************************************
*        NECK AND MOUTH LINES
************************************************/
curveTightness(-8.5);
curve(0, 0, 0, 150, 300, 150, 300, 0);
curveTightness(-7.5);
curve(0, 0, 0, 150, 300, 150, 300, 0);
curveTightness(-6.5);
curve(0, 0, 0, 150, 300, 150, 300, 0);
curveTightness(-5.5);
curve(0, 0, 0, 150, 300, 150, 300, 0);
curveTightness(-4.5);
curve(0, 0, 0, 150, 300, 150, 300, 0);
curveTightness(3.5);
curve(0, 0, 0, 150, 300, 150, 300, 0);
curveTightness(2.5);
curve(0, 0, 0, 150, 300, 150, 300, 0);
curveTightness(-0.5);
curve(0, 0, 0, 150, 300, 150, 300, 0);
curveTightness(-1.5);
curve(0, 0, 0, 150, 300, 150, 300, 0);
curveTightness(-2.5);
curve(0, 0, 0, 150, 300, 150, 300, 0);
curveTightness(-3.5);
curve(0, 0, 0, 150, 300, 150, 300, 0);

/************************************************
*        NOSE
************************************************/
fill(255, 200, 150);// skin color
noStroke();
ellipse(150,80,20,70);
ellipse(150,120,30,80);

/************************************************
*        TEETH
************************************************/
stroke(255,0,0);
fill(255);
triangle(120,176,120,150,130,176);
triangle(180,176,180,150,170,176);

