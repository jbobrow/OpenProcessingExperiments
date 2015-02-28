

int page = 1;
int startTime = 0;
int hesitationTime = 3000;
int internetTime = 6000;
int searchingTime = 1000;
int shippingTime = 400;
int storeTime = 4500;

float angle = 0.0;
float angle1 = 0.0;
float angle2 = 0.0;
float robot1 = 100.0;
float pg3 = 30.0;
float speed = 0.0;
float y,y1, y2, y3, y4, y5,y6;;

float R, targetR, easingR = 0.07; //page5, sweat
float b, targetb, easingb = 0.07;  // variables for page 13 
float b2, targetb2, easingb2 = 0.04;
float b3, targetb3, easingb3= 0.064;
float b4, targetb4, easingb4 =0.035;  
float c, targetc, easingc = 0.04;
float leg, targetleg, easingleg = 0.055;


PFont mono;

PShape pg1robot1, pg1robot2;
PShape pg2robot, pg2internet,pg2internet_x, pg2store,pg2store_x, mouse;
PShape pg3internet, pg3robot, number1, number2, number3;
PShape pg4robot, pg4background;
PShape pg5robot, pg5balloon, sweat, measurements;
PShape pg6sale, pg6sale_x, pg6regular, pg6regular_x;
PShape pg7robot, pg7seller, pg7balloonshop, pg7seller_x, pg7balloonshop_x;
PShape pg7right, pg7left;
PShape pg8robot, pg8internet, s_, h_, i_, p_, e_, d_, symbol_, smile;
PShape arm;
PShape pg9internet;
PShape pg12robot, pg12mouth, pg12bubble;
PShape body,mouth1, mouth2, LCD; //page 13


PImage pg1background, balloon, balloon2, balloon3, sky;



void setup() {
  size(640, 480);
  rectMode(CENTER);
  
  // load font
  mono = loadFont("Monospaced-17.vlw");
 
  // load shapes
  pg1robot1 = loadShape("page1robot.svg"); //page 1
  pg1robot2 = loadShape("page1robot2.svg");
  
  pg2robot = loadShape("pg2robot.svg"); //page 2
  pg2internet = loadShape("pg2internet.svg");
  pg2internet_x = loadShape("pg2internet_x.svg");
  pg2store = loadShape("pg2store.svg");
  pg2store_x= loadShape("pg2store_x.svg");
  mouse = loadShape("mouse1.svg");
  
  pg3internet = loadShape("internet.svg"); //page 3
  pg3robot = loadShape("pg3robot.svg");
  number1 = loadShape("number_1.svg");
  number2 = loadShape("number_2.svg");
  number3 = loadShape("number_3.svg");
  
  
  pg4robot = loadShape("pg4robot.svg");//  page 4
  pg4background = loadShape("pg4background.svg");
  
  
  pg5robot = loadShape("pg5robot.svg"); //page 5
  pg5balloon = loadShape("pg5balloon.svg");
  measurements = loadShape ("measurements.svg");
  sweat = loadShape("tear.svg"); 
  
  pg6sale = loadShape("pg6sale.svg"); //page 6
  pg6sale_x = loadShape("pg6sale_x.svg");
  pg6regular = loadShape("pg6regular.svg");
  pg6regular_x = loadShape("pg6regular_x.svg");
 
  pg7robot = loadShape("pg7robot.svg"); //page 7
  pg7seller = loadShape("pg7seller.svg");
  pg7right = loadShape("pg7right.svg");
  pg7left = loadShape("pg7left.svg");
  pg7balloonshop = loadShape("pg7balloonshop.svg");
  pg7seller_x = loadShape("pg7seller_x.svg");
  pg7balloonshop_x = loadShape("pg7balloonshop_x.svg");
  
  pg8robot = loadShape("pg8robot.svg"); //page 8
  pg8internet = loadShape("pg8internet.svg");
  smile = loadShape("smile.svg");
  arm = loadShape("arm.svg");
  s_ = loadShape("s_.svg");
  h_ = loadShape("h_.svg");
  i_ = loadShape("i_.svg");
  p_ = loadShape("p_.svg");
  e_ = loadShape("e_.svg");
  d_ = loadShape("d_.svg");
  symbol_ = loadShape("symbol_.svg");
 
  pg9internet = loadShape("pg9internet.svg"); //page 9
  
  pg12robot = loadShape ("pg12robot.svg"); // page 12
  pg12mouth = loadShape ("pg12mouth.svg");
  pg12bubble = loadShape("pg12bubble.svg");
  
  body = loadShape("body.svg"); //page 13
  mouth1 = loadShape("mouth1.svg");
  mouth2 = loadShape("mouth2.svg");
  
  //load Images
  pg1background = loadImage("room.png");
  sky = loadImage("background.png");
  balloon = loadImage("movingballoon.png");
  balloon2 = loadImage("movingballoon2.png");
  balloon3 = loadImage("movinballoon3.png");
  
  textFont(mono);
  textAlign(CENTER);
  smooth();
  startTime = millis();
}

void draw() {
background(0);

 //Page 1: Mr.Robot decided to buy a balloon

if (page == 1) {   
  background(204);
  image(pg1background, 0, 0);
  shape(pg1robot1, -10,70);
  float s = .1 * cos(angle1 * 4)*robot1;
  angle1 = angle1 + PI/280.0;
  shape(pg1robot2, 335, s + 40);
  
  fill(0);
  textSize(20);
  text("I want to fly. I need a BIG balloon!!", width/2+25, height/2+210);
  if(millis()>startTime + hesitationTime) {
  page = 2;
  fill(255);
}
}

 //Page 2: where Mr.Robot should buy a balloon?

else if(page == 2) {    
  background(204);
  background(#FF617C);
  float r = random (1, 3);
  if(mouseX<width/2) {shape(pg2internet, 40+r, 10);
  shape(pg2store_x, 340+r*-1, 10);}
  else{shape(pg2internet_x, 40+r, 10);
  shape(pg2store, 340+r*-1, 10);}
  shape(pg2robot, -1, 170);
  shape(mouse, mouseX-30, mouseY);  

  fill(0);
  text("should I buy a balloon",width/2+110, 400);
  text("through internet  OR  ", width/2+110, 420);
  text("go visit the balloon store?", width/2+110, 440);
startTime = millis();
}

 //Page 3: Internet shopping is cheaper

else if(page == 3) { 
  background(204);
  background(#FF617C);
  shape(pg3internet, 180,110);
  
  float s = sin(angle)*pg3;
  angle = angle + PI/180.0;
  shape(pg3robot, 25+s, height/2-10); 
  
  if(millis()>startTime + searchingTime) {shape(number1, 385, 20);}
  if(millis()>startTime + searchingTime +1000) {shape(number2, 350, 90);}
  if(millis()>startTime + searchingTime + 1700) {shape(number3, 350, 25);}


  text ("It is definitely cheaper", width/2+160, 390);
  text ("than balloon store!", width/2+160, 420);
  if (millis()>startTime + internetTime) {
  page = 5;
  startTime = millis();
}
}

 //Page 4: Balloon store

else if (page ==4) {
  background(204);
  targetc = mouseX;
  c = c + ((targetc - c) *easingc);
 
  shape(pg4background,0,0);
  shape(pg4robot, 115+c, 240); 
  
  strokeWeight(2);
  pushMatrix();
    translate(177+c, 438);
    rotate(angle2);
    fill(0);
    rect(0,0,2,34);
    rect(0,0,34,2);
    angle2 = angle2 + 0.02*mouseX;
  popMatrix();

  pushMatrix();
    translate(269+c, 438);
    rotate(angle2);
    fill(0);
    rect(0,0,2,34);
    rect(0,0,34,2);
    angle2 = angle2 + 0.02*mouseX;
  popMatrix();

  float r7 = random(1,6);
  fill(#1DE800, 150);
  strokeWeight(3);
  ellipse(102+c, 195, 100+r7, 110+r7);
  
  
  
  
  fill(0);
  text("Since I can see the actual balloons,", 420, 40);
  text("it is easier to compare various balloons!", 405,60);
  if(millis()>startTime + storeTime) {
  page = 6;
  startTime = millis();
}
}

 //Page 5: Internet Shopping: hard to make decision

else if (page ==5) {
  background(204);
  background(#F9E595);
  shape(pg5robot, 0, -5);
  shape(pg5balloon, 320, -40);  
  float r2 = random(1, 4);
  shape(measurements,322 + r2, 85 );
  
  float hardTime = millis();
  R = R + ((targetR - R) *easingR);
  if (hardTime < 2000) {speed = 0.2;}
  else {speed = 0.9;}
  y = y+ speed;
  if(y > 190) {y = 0;}
  shape(sweat, 1, y + 30);
  
  text("BUT...", 230, 350);  
  text("Since I can't see the actual balloons,", 230, 370);
  text("it is really hard to choose one.", 230, 390);
  if(millis()>startTime + internetTime){
  page = 7;
}
}

  //Page 6: at Balloon store, sale? or regular?

else if (page == 6) {
  
  background(204);
  background(#FFA6FF);
  float r8 =random (1,3);
  if(mouseX<width/2) {shape(pg6sale, 5+r8, 10);
  shape(pg6regular_x, 323+r8*-1, 10);}
  else {shape(pg6sale_x, 5+r8, 10);
  shape(pg6regular, 323+r8*-1, 10);}

  shape(pg2robot, 0, 170);
  shape(mouse, mouseX-30, mouseY);
  
  text("some are on SALE!!!!", 450, 360);
  text("Those are smaller than ", 450, 380);
  text("what I want, but very cheap!", 460, 400);
  text("Hmm..regular balloons are much", 460, 440);
  text("more expensive, but big enough!", 457, 460);
}

  //Page 7: Individual seller? or online balloon store?

else if (page ==7) {
  background(204);
  background(#FC77DC);
  float r3 = random(1,3);
  if (mouseX<width/2) {
   shape(pg7seller, 5+r3, 150);
   shape(pg7balloonshop_x, 326+r3*-1, 146); 
   shape(pg7left, 173, 357); }
  else {  
    shape(pg7seller_x, 5+r3, 150);
    shape(pg7balloonshop, 326+r3*-1, 146);
    shape(pg7right, 400, 355);}
  shape(pg7robot, 245, 325);
  shape(mouse, mouseX-10, mouseY+10);
  text("FEW MINUTES LATER...", width/2,20);
  text("Hmm..individual seller offers cheaper price than", width/2, 60);
  text("online balloon shop! but.. the balloon shop offers", width/2, 80);
  text("free shipping, warranty and has customer service!", width/2, 100);
  text("where should I buy a balloon?", width/2, 140);
}

  //Page 8: Choice: individual seller

else if (page == 8) {
  background(204);
  image(pg1background, 0, 0);
  shape(pg8internet, 215, 0);
  float r4 = random(1,3);
  shape(pg8robot, -2+r4, 155);

  if(millis()>startTime + shippingTime) 
    {shape(s_, 235, 255);}
  if(millis()>startTime + shippingTime*2)  
    {shape(h_, 257, 260);}
  if(millis()>startTime + shippingTime*3)  
    {shape(i_, 282, 260);}
  if(millis()>startTime + shippingTime*4)  
    {shape(p_, 293, 260);}
  if(millis()>startTime + shippingTime*5)  
    {shape(p_, 317, 260);}
  if(millis()>startTime + shippingTime*6)  
    {shape(e_, 342, 260);}
  if(millis()>startTime + shippingTime*7)  
    {shape(d_, 365, 260);}
  if(millis()>startTime + shippingTime*8)  
    {shape(symbol_, 390, 260);
     shape(smile, 17+r4, 320);
     shape(arm, 217+r4, 300);}
  
  
//text("finally buy it! (indi)", width/2, height/2);
if(millis()>startTime + internetTime-1000.0) {
page = 12;}
}

  //Page 9: Choice : online balloon store
 
else if (page == 9) {
  background(204);
  image(pg1background, 0, 0);
  shape(pg9internet, 215, 0);
  float r4 = random(1,3);
  shape(pg8robot, -2+r4, 155);

  if(millis()>startTime + shippingTime) 
    {shape(s_, 235, 255);}
  if(millis()>startTime + shippingTime*2)  
    {shape(h_, 257, 260);}
  if(millis()>startTime + shippingTime*3)  
    {shape(i_, 282, 260);}
  if(millis()>startTime + shippingTime*4)  
    {shape(p_, 293, 260);}
  if(millis()>startTime + shippingTime*5)  
    {shape(p_, 317, 260);}
  if(millis()>startTime + shippingTime*6)  
    {shape(e_, 342, 260);}
  if(millis()>startTime + shippingTime*7)  
    {shape(d_, 365, 260);}
  if(millis()>startTime + shippingTime*8)  
    {shape(symbol_, 390, 260);
     shape(smile, 17+r4, 320);
     shape(arm, 217+r4, 300);}
  
  
  
  
  
//text("finally buy it! (balloon store)", width/2, height/2);
if(millis()>startTime + internetTime-1000.0) {
  page = 13;}
}

 //Page 10: STORE Result : small balloon (sale).. too small

else if (page == 10) {
  
  background(204);
  image(pg1background, 0, 0);
  
  float s2 = .1 * cos(angle1 * 4)*robot1;
  angle1 = angle1 + PI/280.0;
  shape(pg12bubble,390, s2 + 10);
  
  shape(pg12robot, 60, 130);
  float r5 = random(1,4);
  shape(pg12mouth, 160+r5, 320);
  
  float hardTime2 = millis();
  R = R + ((targetR - R) *easingR);
  if (hardTime2 <2000) {speed = 0.2;}
  else{speed = 0.9;}
  y6 = y6+ speed;
  if(y6>200) {y6 = 0;}
  shape(sweat, 320, y6+230);
  
  text("When Mr. Robot gets back home,", 220, 60);
  text("he starts to regret because", 220, 80);
  text("he can't do anything with those", 220, 100);
  text("small balloons..", 220, 120);

}

  //Page 11: STORE Result: one big balloon ..PERFECT!!
  
else if (page ==11) {
  
    background(204);
  image(sky,0,0);
  
  targetb = mouseX;
  targetb2 = mouseY;
  targetb3 = mouseX;
  targetb4 = mouseY;
  targetleg= mouseX; 
  
  float currentTime = millis()/1000.0;  
  
  b = b + ((targetb - b) *easingb);
  b2 = b2 + ((targetb2 - b2) *easingb2);
  b3 = b3 + ((targetb3 - b3) * easingb3);
  b4 = b4 + ((targetb4 - b4) * easingb4);
  leg = leg + ((targetleg - leg) *easingleg);
  
  if(currentTime< 5.0) {speed = 0.7;} //hot air balloon 1.
  else {speed = 1.5;}
  y1 = y1+speed;
  if (y1>405) { y1 = 0;}
  image(balloon, 30, -y1 +400);

  if(currentTime<7.0) {speed=0.4;}// hot air balloon 2. 
  else{speed = 2.3;}
  y2 = y2+speed;
  if (y2>405) { y2 = 0;}
  image(balloon2, 360, -y2+400);

  if (currentTime<2.6) {speed = 0.3;}// hot air balloon 3.
  else{speed = 1.8;}
  y3 = y3 + speed;
  if (y3>405) { y3 = 0;}
  image(balloon3, 260, -y3+400);

  if(currentTime<3.3) {speed = 0.0;} // hot air balloon 4. 
  else{speed = 2.1;}
  y4 = y4 + speed;
  if (y4>405) { y4 = 0; }
  image(balloon2, 430, -y4 +400);

  if (currentTime<7.0) {speed = 0.0;}// hot air balloon 5.
  else{speed = 1.3;}
  y5 = y5 +speed;
  if(y5>400){ y5 = 0;}
  image(balloon3, 610, -y5+400);
  
  
  triangle(b+132, b2+1, b+128, b2+5, b+136, b2+5);//balloon
  stroke(#DDA540);
  strokeWeight(5);
  line(b+132, b2+8, b+132, b2+20);

  fill(#3EF916, 100);
  strokeWeight(3);
  stroke(0);
  ellipse(b+132, b2-105, 190, 207);

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

  shape(body,b, b2); //body
  shape(mouth1, b+26, b2+50);//mouth
  fill(0);
  
  text("As Mr. Robot has dreamed for a long time,", 250, 420);
  text("he can finally fly with a big balloon", 230, 440);
}



  //Page 12: INTERNET Result:) 

else if (page == 12) {
  background(204);
  image(pg1background, 0, 0);
  
  float s2 = .1 * cos(angle1 * 4)*robot1;
  angle1 = angle1 + PI/280.0;
  shape(pg12bubble,390, s2 + 10);
  
  shape(pg12robot, 60, 130);
  float r5 = random(1,4);
  shape(pg12mouth, 160+r5, 320);
  
  float hardTime2 = millis();
  R = R + ((targetR - R) *easingR);
  if (hardTime2 <2000) {speed = 0.2;}
  else{speed = 0.9;}
  y6 = y6+ speed;
  if(y6>200) {y6 = 0;}
  shape(sweat, 320, y6+230);
  
  
  
  //fill(255);
  text("A WEEK LATER...", 220, 50);
  text("Mr. Robot receives a balloon. But,", 220, 80);
  text("different from his expectation,", 220, 100);
  text("it is too small and he can't even", 220, 120);
  text("return it", 220, 140);
} 


  //Page 13: INTERNET result :(
else if (page == 13) {
  background(204);
  image(sky,0,0);
  
  targetb = mouseX;
  targetb2 = mouseY;
  targetb3 = mouseX;
  targetb4 = mouseY;
  targetleg= mouseX; 
  
  float currentTime = millis()/1000.0;  
  
  b = b + ((targetb - b) *easingb);
  b2 = b2 + ((targetb2 - b2) *easingb2);
  b3 = b3 + ((targetb3 - b3) * easingb3);
  b4 = b4 + ((targetb4 - b4) * easingb4);
  leg = leg + ((targetleg - leg) *easingleg);
  
  if(currentTime< 5.0) {speed = 0.7;} //hot air balloon 1.
  else {speed = 1.5;}
  y1 = y1+speed;
  if (y1>405) { y1 = 0;}
  image(balloon, 30, -y1 +400);

  if(currentTime<7.0) {speed=0.4;}// hot air balloon 2. 
  else{speed = 2.3;}
  y2 = y2+speed;
  if (y2>405) { y2 = 0;}
  image(balloon2, 360, -y2+400);

  if (currentTime<2.6) {speed = 0.3;}// hot air balloon 3.
  else{speed = 1.8;}
  y3 = y3 + speed;
  if (y3>405) { y3 = 0;}
  image(balloon3, 260, -y3+400);

  if(currentTime<3.3) {speed = 0.0;} // hot air balloon 4. 
  else{speed = 2.1;}
  y4 = y4 + speed;
  if (y4>405) { y4 = 0; }
  image(balloon2, 430, -y4 +400);

  if (currentTime<7.0) {speed = 0.0;}// hot air balloon 5.
  else{speed = 1.3;}
  y5 = y5 +speed;
  if(y5>400){ y5 = 0;}
  image(balloon3, 610, -y5+400);
  
  
  triangle(b+132, b2+1, b+128, b2+5, b+136, b2+5);//balloon
  stroke(#DDA540);
  strokeWeight(5);
  line(b+132, b2+8, b+132, b2+20);

  fill(#3EF916, 100);
  strokeWeight(3);
  stroke(0);
  ellipse(b+132, b2-105, 190, 207);

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

  shape(body,b, b2); //body
  shape(mouth1, b+26, b2+50);//mouth
  fill(0);
  text("A WEEK LATER...", 230, 380);
  text("Mr. Robot receives a perfect balloon!", 230, 420);
  text("FINALLY, he can fly", 230, 440);
}
}
  


void mousePressed() {  //decision #1
if (page ==2) {
if (mouseX<width/2) {
page = 3;
startTime = millis();
} else { page = 4;
}
}


else if (page == 6) {  //decision #2
if(mouseX<width/2) {
page = 10;
} else { page = 11;
}
startTime = millis();
}

else if (page == 7) {  //decision #3
if(mouseX<width/2) {
page = 8; 
startTime = millis();
} else { page =9; }
startTime = millis();
}
}






