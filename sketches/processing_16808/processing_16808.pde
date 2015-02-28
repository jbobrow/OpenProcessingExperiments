
PFont font; 
int card = 0; 

void setup() {
  size(500, 500);
  font = loadFont("ComicSansMS-48.vlw");
  textFont(font);
  smooth();
}

void draw() {
  if (card == 0) {
  noStroke();
  background(255);
  fill(234, 159, 38);
  rect(0,400,500,100);
  
  fill(255, 0, 0);
  rect(40, 80, 50, 50);
  
  fill(255, 138, 59);
  rect(130, 80, 50, 50);
  
  fill(255, 232, 15);
  rect(220, 80, 50, 50);
  
  fill(137, 193, 10);
  rect(310, 80, 50, 50);
  
  fill(0, 171, 247);
  rect(400, 80, 50, 50);
  
  fill(161, 55, 203);
  rect(40, 170, 50, 50);
  
  fill(255, 106, 163);
  rect(130, 170, 50, 50);
  
stroke(0);
strokeWeight(1);
  fill(255);
  rect(220, 170, 50, 50);
  
  noStroke();
  fill(0);
  rect(310, 170, 50, 50);
  
  fill(255);
  textSize(30);
     text("This is a psychological test frog",30,460);
  frog(270,305);
  }  
  
  else if (card == 1) {  
  noStroke();
  background(255);
  fill(234, 159, 38);
  rect(0,400,500,100);
  
  fill(255, 0, 0);
  rect(40, 80, 50, 50);
  
  fill(255, 138, 59);
  rect(130, 80, 50, 50);
  
  fill(255, 232, 15);
  rect(220, 80, 50, 50);
  
  fill(137, 193, 10);
  rect(310, 80, 50, 50);
  
  fill(0, 171, 247);
  rect(400, 80, 50, 50);
  
  fill(161, 55, 203);
  rect(40, 170, 50, 50);
  
  fill(255, 106, 163);
  rect(130, 170, 50, 50);
  
stroke(0);
strokeWeight(1);
  fill(255);
  rect(220, 170, 50, 50);
  
  noStroke();
   fill(0);
  rect(310, 170, 50, 50);
  
  fill(0);
  textSize(18);
     text("From now on",30,300);
     text("I guess your Personality by Color !", 30, 330);
  frogOne(400,345,0.6);
  }
  
  
  else if (card  == 2) {  
     noStroke();
  background(255);
  fill(234, 159, 38);
  rect(0,400,500,100);
  
  fill(255, 0, 0);
  rect(40, 80, 50, 50);
  
  fill(255, 138, 59);
  rect(130, 80, 50, 50);
  
  fill(255, 232, 15);
  rect(220, 80, 50, 50);
  
  fill(137, 193, 10);
  rect(310, 80, 50, 50);
  
  fill(0, 171, 247);
  rect(400, 80, 50, 50);
  
  fill(161, 55, 203);
  rect(40, 170, 50, 50);
  
  fill(255, 106, 163);
  rect(130, 170, 50, 50);
  
stroke(0);
strokeWeight(1);
  fill(255);
  rect(220, 170, 50, 50);
  
  noStroke();
  fill(0);
  rect(310, 170, 50, 50);
  
  fill(0);
  textSize(30);
     text("Choose your Color !",40,300);
  frogTwo(400,345,0.6);
  }
  else if(card == 3){
      noStroke();
  background(255);
  
  fill(0);
  textSize(30);
     text("Is              is your Color ?",80,320);
     fill(255, 0, 0);
     textSize(40);
     text("RED" ,127, 320);
         fill(0);
    rect(60, 400,100, 50);
          rect(320, 400,100, 50);
          
          textSize(30);
                         fill(255);
          text(" Yes",78, 435); 
          fill(255);
          text("No", 350, 435);
  frogR(270, 170,0.9);

}
else if (card ==4){
  
 noStroke();
  background(255);
  
  fill(0);
  textSize(30);
     text("Is                        is your Color ?",40,320);
     fill(255, 138, 59);
     textSize(40);
     text("ORANGE" ,80, 320);
         fill(0);
    rect(60, 400,100, 50);
          rect(320, 400,100, 50);
          
          textSize(30);
                         fill(255);
          text(" Yes",78, 435); 
          fill(255);
          text("No", 350, 435);
  frogO(270, 170,0.9);
}
else if (card ==5){
 noStroke();
  background(255);
  
  fill(0);
  textSize(30);
     text("Is                        is your Color ?",40,320);

  fill(255, 232, 15);
     textSize(40);
     text("YELLOW" ,80, 320);
         fill(0);
    rect(60, 400,100, 50);
          rect(320, 400,100, 50);
          
          textSize(30);
                         fill(255);
          text(" Yes",78, 435); 
          fill(255);
          text("No", 350, 435);
  frogY(270, 170,0.9);
}

else if (card == 6){
   noStroke();
  background(255);
  
  fill(0);
  textSize(30);
     text("Is                   is your Color ?",50,320);

   fill(137, 193, 10);
     textSize(40);
     text("GREEN" ,90, 320);
         fill(0);
    rect(60, 400,100, 50);
          rect(320, 400,100, 50);
          
          textSize(30);
                         fill(255);
          text(" Yes",78, 435); 
          fill(255);
          text("No", 350, 435);
  frogG(270, 170,0.9);

}
else if (card == 7){
noStroke();
  background(255);
  
  fill(0);
  textSize(30);
     text("Is                is your Color ?",70,320);

   fill(0, 171, 247);
     textSize(40);
     text("BLUE" ,115, 320);
         fill(0);
    rect(60, 400,100, 50);
          rect(320, 400,100, 50);
          
          textSize(30);
                         fill(255);
          text(" Yes",78, 435); 
          fill(255);
          text("No", 350, 435);
  frogB(270, 170,0.9);

}
else if (card == 8){
  noStroke();
  background(255);
  
  fill(0);
  textSize(30);
     text("Is                    is your Color ?",50,320);

   fill(161, 55, 203);
     textSize(40);
     text("PURPLE" ,95, 320);
         fill(0);
    rect(60, 400,100, 50);
          rect(320, 400,100, 50);
          
          textSize(30);
                         fill(255);
          text(" Yes",78, 435); 
          fill(255);
          text("No", 350, 435);
  frogPu(270, 170,0.9);

}
else if (card == 9){
    noStroke();
  background(255);
  
  fill(0);
  textSize(30);
     text("Is                is your Color ?",65,320);

  fill(255, 106, 163);
     textSize(40);
     text("PINK" ,110, 320);
       fill(0);
    rect(60, 400,100, 50);
          rect(320, 400,100, 50);
          
          textSize(30);
                         fill(255);
          text(" Yes",78, 435); 
          fill(255);
          text("No", 350, 435);
  frogPi(270, 170,0.9);

}
else if (card == 10){
  noStroke();
  background(255);
  
  fill(0);
  textSize(30);
     text("Is                      is your Color ?",65,320);

     stroke(0);
     strokeWeight(1);
  fill(245,232,232);
     textSize(40);
     text("WHITE" ,110, 320);
         fill(0);
    rect(60, 400,100, 50);
          rect(320, 400,100, 50);
          
          textSize(30);
                         fill(255);
          text(" Yes",78, 435); 
          fill(255);
          text("No", 350, 435);
noStroke();
  frogWh(270, 170,0.9);
}
else if (card == 11){
   noStroke();
  background(255);
  
  fill(0);
  textSize(30);
     text("Is                   is your Color ?",55,320);
  fill(0);
     textSize(40);
     text("BLACK" ,100, 320);
     fill(0);
    rect(60, 400,100, 50);
          rect(320, 400,100, 50);
          
          textSize(30);
                         fill(255);
          text(" Yes",78, 435); 
          fill(255);
          text("No", 350, 435);
     
  frogBl(270, 170,0.9);
}
else if (card == 12){
   noStroke();
  background(40);

fill(255);
textSize(25);
text("You are active, energetic, sociable.", 40, 90);
text("and open person.", 40, 140);
text("You want to express just you feel. ", 40, 200);

  frogRe(370, 390,0.7);

}
else if (card == 13){
  noStroke();
 background(40);

fill(255);
textSize(25);
text("You are  good-natured person.", 40, 70);
text("You like being with other people.", 40, 120);
text("You have steadfast loyalty,", 40, 180);
text("so you never break the oath.", 40, 220);

  frogOr(370, 390,0.7);

}
else if (card ==14){
    noStroke();
 background(40);

fill(255);
textSize(25);
text("You are very tolerant person.", 40, 80);
text("So you can help people,", 40, 130);
text("who are mentally unstable.", 40, 170);


  frogYe(370, 390,0.7);

}
else if (card == 15){
    noStroke();
  background(40);
  
fill(255);
textSize(25);
text("You take a moral and democratic view.", 40, 100);
text("People ,who like this color, are  ", 40, 170);
text("mostly sincere and elegant.", 40, 210);

  
  frogGr(370, 390,0.7);
  
}
else if (card == 16){
  noStroke();
  background(40);
  
fill(255);
textSize(23);
text("You are so stubborn.", 40, 60);
text("You insist that you're always right.", 40, 110);
text("You never lose control.", 40, 170);
text("And you are quite logical, ", 30, 220);
text("so be excellent to conduct your own defence.", 20, 260);
  
  frogBlu(370, 390,0.7);
}
else if (card == 17){
    noStroke();
  background(40);

fill(255);
textSize(25);
text("You have a very strong individuality.", 40, 70);
text("You are an idealist.", 40, 120);
text("You wanted to high position and power. ", 40, 180);
text("Usually, people, who like this color, ", 40, 230);
text("has a kind mind.", 40, 260);

  frogPur(370, 390,0.7);
}
else if (card == 18){
  noStroke();
  background(40);

fill(255);
textSize(25);
text("You are passionate,", 40, 70);
text("but so easy to get Hurt by feelings.", 40, 110);
text("Extremely delicating at feelings,", 40, 180);
text("and Being good hearted is", 40, 220);
text("the top of the advantage.", 40, 260);

  frogPin(370, 390,0.7);

}
else if (card == 19){
   noStroke();
    background(40);

fill(255);
textSize(23);
text("You pursue perfection.", 40, 70);
text("You has distinguished ideals.", 40, 120);
text("Someone, who like this color, are ", 40, 180);
text("full of conceit and lonely at the same time.", 30, 210);
text("But they are very domestic.", 40, 270);

  frogWhi(370, 390,0.7);
}
else if (card == 20){
noStroke();
  background(40);
  
fill(255);
textSize(24);
text("You have a strong mind", 40, 70);
text("and you are very independent.", 40, 110);
text("Your passion can't be controlled.", 40, 170);
text("You are filled with hopes and dreams", 40, 230);
text("and NEVER want to be lose.", 40, 270);
  
  frogBla(370, 390,0.7);
}
else if (card == 21){
   noStroke();
  background(255);
   fill(234, 159, 38);
  rect(0,400,500,100);
  fill(0);
  textSize(40);
  text("Test is over ~~~ ", 60, 150);
  frogFo(270,305);
}
else if (card ==22){
  noStroke();
  background(255);
  fill(234, 159, 38);
  rect(0,400,500,100);
  fill(0);
  textSize(40);
  text("Does it fit you?", 100, 100);
  rect(120, 130, 80, 40);
  rect(270, 130, 80, 40);
  
  fill(255);
  textSize(30);
  text("Yes", 134, 160);
  text("No", 285, 160);
  frogFour(270,305);
}
else if (card == 23){
  noStroke();
  background(255);
  fill(234, 159, 38);
  rect(0,400,500,100);
  fill(0);
  textSize(50);
     text("Thank you !",60,150);
  frogFi(270,305);

}
else if (card ==24){
   noStroke();
  background(255);
  fill(234, 159, 38);
  rect(0,400,500,100);
  fill(0);
  textSize(23);
  text("No No No No No.... ", 40, 90);
  text("That's not true...", 50, 110);
  textSize(40);
  text("I'm always right !!", 40, 160);
  frogFive(270,305,int(random(58, 88)));
}
else if (card ==25){
    background(40);
  textSize(60);
  fill(255);
  text("Good Bye !",70,250);
  noStroke();
  textSize(20);
  text("again?",430, 480);
  frogEnd(400,230,0.3);
}
}

void mousePressed() {  

  if (card == 0) {  

   // if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 1;
    } 
else if (card ==1){
  card =2;
}

else if (card ==2) {
  
  if((mouseX > 40) && (mouseX < 90) && (mouseY > 80) && (mouseY < 130)) {
      card = 3;
    } 
    
    else card = 2;
  
  
  if (card ==2){
   if((mouseX > 130) && (mouseX < 180) && (mouseY > 80) && (mouseY < 130)) {
      card = 4;
   }}
   
  if (card == 2){
   if((mouseX > 220) && (mouseX < 270) && (mouseY > 80) && (mouseY < 130)) {
      card = 5;
   } }
   
   if (card ==2){
   if((mouseX > 310) && (mouseX < 360) && (mouseY > 80) && (mouseY < 130)) {
      card = 6;
    } }
    
    if (card ==2){
   if((mouseX > 400) && (mouseX < 450) && (mouseY > 80) && (mouseY < 130)) {
      card = 7;
    } }
    
    if (card ==2){
     if((mouseX > 40) && (mouseX < 90) && (mouseY > 170) && (mouseY < 220)) {
      card = 8;
    } }
    
    if (card ==2){
     if((mouseX > 130) && (mouseX < 180) && (mouseY > 170) && (mouseY < 220)) {
      card = 9;
    } }
    
    if (card ==2){
     if((mouseX > 220) && (mouseX < 270) && (mouseY > 170) && (mouseY < 220)) {
      card = 10;
    } }
    
    if (card ==2){
     if((mouseX > 310) && (mouseX < 360) && (mouseY > 170) && (mouseY < 220)) {
      card = 11;
     }}
}
   
 else if(card ==3){
       if ((mouseX > 60) && (mouseX < 160) && (mouseY > 400) && (mouseY < 450)) {  
       card = 12;  
       }
       else card = 3;
       
       if(card == 3){
        if((mouseX > 320) && (mouseX < 420) && (mouseY > 400) && (mouseY < 450)) {    
       card = 2;  
       } }}
       
       else if(card ==4){
       if ((mouseX > 60) && (mouseX < 160) && (mouseY > 400) && (mouseY < 450)) {  
       card = 13;  
       }
       else card = 4;
       
       if(card == 4){
        if((mouseX > 320) && (mouseX < 420) && (mouseY > 400) && (mouseY < 450)) {    
       card = 2;  
       } }}
       
        else if(card ==5){
       if ((mouseX > 60) && (mouseX < 160) && (mouseY > 400) && (mouseY < 450)) {  
       card = 14;  
       }
       else card = 5;
       
       if(card == 5){
        if((mouseX > 320) && (mouseX < 420) && (mouseY > 400) && (mouseY < 450)) {    
       card = 2;  
       } }}
       
        else if(card ==6){
       if ((mouseX > 60) && (mouseX < 160) && (mouseY > 400) && (mouseY < 450)) {  
       card = 15;  
       }
       else card = 6;
       
       if(card == 6){
        if((mouseX > 320) && (mouseX < 420) && (mouseY > 400) && (mouseY < 450)) {    
       card = 2;  
       } }}
       
        else if(card ==7){
       if ((mouseX > 60) && (mouseX < 160) && (mouseY > 400) && (mouseY < 450)) {  
       card = 16;  
       }
       else card = 7;
       
       if(card == 7){
        if((mouseX > 320) && (mouseX < 420) && (mouseY > 400) && (mouseY < 450)) {    
       card = 2;  
       } }}
        else if(card ==8){
       if ((mouseX > 60) && (mouseX < 160) && (mouseY > 400) && (mouseY < 450)) {  
       card = 17;  
       }
       else card = 8;
       
       if(card == 8){
        if((mouseX > 320) && (mouseX < 420) && (mouseY > 400) && (mouseY < 450)) {    
       card = 2;  
       } }}
       
        else if(card ==9){
       if ((mouseX > 60) && (mouseX < 160) && (mouseY > 400) && (mouseY < 450)) {  
       card = 18;  
       }
       else card = 9;
       
       if(card == 9){
        if((mouseX > 320) && (mouseX < 420) && (mouseY > 400) && (mouseY < 450)) {    
       card = 2;  
       } }}
       
        else if(card ==10){
       if ((mouseX > 60) && (mouseX < 160) && (mouseY > 400) && (mouseY < 450)) {  
       card = 19;  
       }
       else card = 10;
       
       if(card == 10){
        if((mouseX > 320) && (mouseX < 420) && (mouseY > 400) && (mouseY < 450)) {    
       card = 2;  
       } }}
       else if(card ==11){
       if ((mouseX > 60) && (mouseX < 160) && (mouseY > 400) && (mouseY < 450)) {  
       card = 20;  
       }
       else card = 11;
       
       if(card == 11){
        if((mouseX > 320) && (mouseX < 420) && (mouseY > 400) && (mouseY < 450)) {    
       card = 2;  
       } }}
       
       else if (card ==12){
       card = 21;
  }
  else if (card ==13){
  card = 21;
}
else if (card == 14){
  card = 21; 
}
else if (card == 15){
  card = 21; 
}
else if (card == 16){
  card = 21; 
}
else if (card == 17){
  card = 21; 
}
else if (card == 18){
  card = 21; 
}
else if (card == 19){
  card = 21; 
}
else if (card ==20){
  card = 21;
}
else if (card ==21){
  card = 22;
}




else if (card ==22) {
  
  if((mouseX > 120) && (mouseX < 200) && (mouseY > 130) && (mouseY < 170)) {
      card = 23;
    } 
    
    else card = 22;
  
  
  if (card ==22){
   if((mouseX > 270) && (mouseX < 350) && (mouseY > 130) && (mouseY < 170)) {
      card = 24;
   }}
  }
  
  else if (card == 23){
    card = 25;
  
  }
  else if (card == 24){
    card = 25;
  }
  
  else if (card == 25){
     if((mouseX > 426) && (mouseX < 486) && (mouseY > 460) && (mouseY < 486)) {
      card = 0;
   }}
  }

  
void frog(int x, int y){
translate(x,y);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);

stroke(255, 107, 70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}


void frogOne(int x, int y, float s){
translate(x,y);
scale(s);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);

fill(255, 107, 70);
triangle(-103, -55, 63,-55,-20,-30); //mouse

stroke(255,108,70);
strokeWeight(2);
fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}
 
void frogTwo(int x, int y, float s){
translate(x,y);
scale(s);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);

fill(255, 107, 70);
triangle(-103, -55, 63,-55,-20,-40); //mouse

stroke(255,108,70);
strokeWeight(2);
fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}
  
void frogR(int x, int y, float s){
translate(x,y);
scale(s);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}


void frogO(int x, int y, float s){
translate(x,y);
scale(s);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

void frogY(int x, int y, float s){
translate(x,y);
scale(s);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

  
void frogG(int x, int y, float s){
translate(x,y);
scale(s);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

void frogB(int x, int y, float s){
translate(x,y);
scale(s);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

void frogPu(int x, int y, float s){
translate(x,y);
scale(s);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

  
void frogPi(int x, int y, float s){
translate(x,y);
scale(s);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

void frogWh(int x, int y, float s){
translate(x,y);
scale(s);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

void frogBl(int x, int y, float s){
translate(x,y);
scale(s);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}
  
void frogRe(int x, int y, float s){
translate(x,y);
scale(s);
fill(255,0,0);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(255,0,0);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(255,0,0);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(255,0,0);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(255,0,0);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

void frogOr(int x, int y, float s){
translate(x,y);
scale(s);
fill(255, 138, 59);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(255, 138, 59);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(255, 138, 59);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(160,23,23);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(255, 138, 59);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(255, 138, 59);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}


void frogYe(int x, int y, float s){
translate(x,y);
scale(s);
  fill(255, 232, 15);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
  fill(255, 232, 15);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
  fill(255, 232, 15);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

  fill(255, 232, 15);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

  fill(255, 232, 15);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

void frogGr(int x, int y, float s){
translate(x,y);
scale(s);
 fill(137, 193, 10);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
 fill(137, 193, 10);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
 fill(137, 193, 10);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

 fill(137, 193, 10);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

 fill(137, 193, 10);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

void frogBlu(int x, int y, float s){
translate(x,y);
scale(s);
  fill(0, 171, 247);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
  fill(0, 171, 247);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
  fill(0, 171, 247);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

  fill(0, 171, 247);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

  fill(0, 171, 247);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

  
void frogPur(int x, int y, float s){
translate(x,y);
scale(s);
   fill(161, 55, 203);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
   fill(161, 55, 203);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
   fill(161, 55, 203);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

   fill(161, 55, 203);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

   fill(161, 55, 203);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

void frogPin(int x, int y, float s){
translate(x,y);
scale(s);
  fill(255, 106, 163);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
  fill(255, 106, 163);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
  fill(255, 106, 163);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(160,23,23);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

  fill(255, 106, 163);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

  fill(255, 106, 163);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

  
void frogWhi(int x, int y, float s){
translate(x,y);
scale(s);
fill(255);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(255);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(255);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(255);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(255);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}
  
void frogBla(int x, int y, float s){
translate(x,y);
scale(s);
fill(0);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(0);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(0);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);


stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(0);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(0);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

void frogFo(int x, int y){
translate(x,y);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);

stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

stroke(255,108,70);
strokeWeight(2);
fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

  
void frogFour(int x, int y){
translate(x,y);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);

fill(255, 107, 70);
triangle(-103, -55, 63,-55,-20,-40); //mouse

stroke(255,108,70);
strokeWeight(2);
fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}
 
void frogFive(int x, int y, int a){
translate(x,y);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);

stroke(255,108,70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

stroke(255,108,70);
strokeWeight(2);
fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, a);//right foot

fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

  
void frogFi(int x, int y){
translate(x,y);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);

fill(255, 107, 70);
triangle(-103, -55, 63,-55,-20,-40); //mouse

stroke(255,108,70);
strokeWeight(2);
fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}
 
void frogEnd(int x, int y, float s){
translate(x,y);
scale(s);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);

stroke(255, 107, 70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(164, 255, 46);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

