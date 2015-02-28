
PShape body,mouth1, mouth2, LCD;
PImage sky, balloon, balloon2, balloon3, thunder1,sunrise;

float b, targetb, easingb = 0.07;  //variables 
float b2, targetb2, easingb2 = 0.04;
float b3, targetb3, easingb3= 0.064;
float b4, targetb4, easingb4 =0.035;  
float leg, targetleg, easingleg = 0.055;
float speed1 = 0.0;
float y, y2, y3, y4, y5;
float angle = 0.0;
float scalor = 150.0;


boolean sad = false;


void setup(){
size(320, 480);
frameRate(40);
smooth();

body = loadShape("body.svg");
mouth1 = loadShape("mouth1.svg");
mouth2 = loadShape("mouth2.svg");
LCD = loadShape("redlcd.svg");
sky = loadImage("sky.png");
balloon = loadImage("movingballoon.png");
balloon2 = loadImage("movingballoon2.png");
balloon3 = loadImage("movinballoon3.png");
thunder1 = loadImage("thunder1.png");
sunrise = loadImage("sun.png");

}

void draw(){

background(204);

image(sky,0,0); //background image

targetb = mouseX;
targetb2 = mouseY;
targetb3 = mouseX;
targetb4 = mouseY;
targetleg= mouseX;



float currentTime = millis()/1000.0; //variable for hot air balloon


b = b + ((targetb - b) *easingb);
b2 = b2 + ((targetb2 - b2) *easingb2);
b3 = b3 + ((targetb3 - b3) * easingb3);
b4 = b4 + ((targetb4 - b4) * easingb4);
leg = leg + ((targetleg - leg) *easingleg);



if(currentTime< 5.0) {speed1 = 0.7;} //hot air balloon 1.
else {speed1 = 1.5;}
y = y+speed1;
if (y>320) { //making rotation
 y = 0; 
}
image(balloon, 30, -y +240);



if(currentTime<7.0) {speed1=0.4;}// hot air balloon 2. 
else{speed1 = 2.3;}
y2 = y2+speed1;
if (y2>320) {
  y2 = 0;
}
image(balloon2, 160, -y2+240);


if (currentTime<4.6) {speed1 = 0.3;}// hot air balloon 3.
else{speed1 = 4.8;}
y3 = y3 + speed1;
image(balloon3, 280, -y3+200);


if(currentTime<3.3) {speed1 = 0.0;} // hot air balloon 4. 
else{speed1 = 2.1;}
y4 = y4 + speed1;
if (y4>320) {
  y4 = 0;
}image(balloon2, 230, -y4 +240);


if (currentTime<7.0) {speed1 = 0.0;}// hot air balloon 5.
else{speed1 = 1.3;}
y5 = y5 +speed1;
if(y5>320){ 
y5 = 0;}
image(balloon3, 280, -y5+240);



shape(body,b, b2); //body


float r = random(90, 115);
if (sad == true) {   //when space bar pressed, robot's 
noTint();
image(thunder1, r-100, r-115); //thunder
tint(125, 110, 200);          //weather change
shape(mouth2, b+26, b2+50);   //mouth, LCD and balloon change.
shape(LCD, b+14.5, b2+90.5);  
fill(#3EF916, 100);
strokeWeight(3);
ellipse(b+132, b2-55, r,r+10); // green balloon

}


else {
float s = sin(angle)*scalor;
float c = cos(angle)*scalor;
angle = angle + PI/195.0;
image(sunrise, 140+s*1.5, 300+c*1.7); //sun rises
shape(mouth1, b+26, b2+50);
noTint();
fill(#3EF916, 100);
strokeWeight(3);
ellipse(b+132, b2-55, 90, 107);
}

triangle(b+132, b2+1, b+128, b2+5, b+136, b2+5);//bottom of balloon
stroke(#DDA540);
strokeWeight(5);
line(b+132, b2+8, b+132, b2+20);

fill(#D9DBEE);   //arm - left
strokeWeight(4);
stroke(0);
beginShape(); 
vertex(b+1, b2+90);
vertex(b3-30, b4 + 116);
bezierVertex(b3-32, b4+124, b3-32, b4+133, b3-30, b4 + 136);
vertex(b3-30, b4 + 136);
vertex(b+1, b2+110); 
endShape(CLOSE);

beginShape();    //arm - right
vertex(b+127, b2+84);
vertex(b+135, b2+65);
vertex(b+125, b2+30);
bezierVertex(b+132, b2+20, b+137, b2+20, b+145, b2+30);
vertex(b+145, b2+30);
vertex(b+155, b2+65);
vertex(b+127, b2+110);
endShape(CLOSE);

beginShape(); //leg - left
vertex(b+27,b2+183);
vertex(leg+31, b2+222);
bezierVertex(leg+37, b2+229, leg +43, b2+229, leg+49, b2+222);
vertex(leg+49, b2+222);
vertex(b+53, b2+183);
endShape(CLOSE);

beginShape(); //leg - right
vertex(b+79, b2+183);
vertex(leg+83, b2+222);
bezierVertex(leg+89, b2+229, leg+95, b2+229, leg+101, b2+222);
vertex(leg+101, b2+222);
vertex(b+105, b2+183);
endShape(CLOSE); 

}




void keyPressed() { if (key == ' ') {sad = true;}}

void keyReleased () {sad = false;}

/* 1. hot air balloons fly away with different speeds
   2. sun rises
   3. when the space bar pressed, thunder appears(sun 
      does not rise anymore) and robot's balloon shakes
      randomly */

