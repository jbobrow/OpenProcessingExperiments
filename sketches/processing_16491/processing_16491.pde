
int frog = 0; 
PFont font;

void setup() {
  size (450, 450);
  font = loadFont("ArialNarrow-Bold-48.vlw");
  textFont(font);
  smooth();
}


void draw () {
  if (frog ==0) {
     background(40);
  fill(200);
     text("This is a frog",100,420);
     noStroke();
  frogOne(240,265);
}

else if (frog ==1) {
    noStroke();
  background(40);
  fill(200);
  text("Very naughty frog.",60,420);
  frogTwo(240, 265,int(random(58, 88)), 1);
}


else if (frog ==2){ 
  background(40);
       strokeWeight(3);
     line(100, 100, 40, 115);
     smooth();
     fill(255);
ellipse(170,70,300,100);
  fill(200);
  textSize(40);
     text("When I give the command,",24,420);
     fill(0);
     textSize(22);
     text("Change the color to",40,80);
     textSize(28);
     fill(255,185,5);
     text("YELLOW",210,80);
     noStroke();
  frogThr(240, 265,int(random(58, 88)), 1);
}

else if (frog ==3){
   background(40);
         strokeWeight(3);
     line(100, 100, 40, 115);
     smooth();
     fill(255);
ellipse(170,70,300,100);
  fill(200);
  textSize(40);
     text("the frog doesn't listen...",50,420);
     textSize(28);
     fill(0);
     text("Hey, that's not yellow !", 40, 80);
     noStroke();
  frogThree(240,265);
}

else if(frog ==4){
   background(40);
         strokeWeight(3);
     line(100, 100, 40, 115);
     smooth();
     fill(255);
ellipse(170,70,300,100);
  fill(200);
  textSize(40);
     text("Again...!!",150,420);
     textSize(25);
     fill(0);
     text("Then...", 70, 57);
     textSize(22);
     text("Change the color to", 40,90); 
     fill(177, 62, 255);
     text("PURPLE!", 220,90);
     noStroke();
  frogFo(240,265);
}

else if (frog ==5){
  background(40);
strokeWeight(3);
     line(100, 100, 40, 115);
        smooth();
     fill(255);
ellipse(170,70,300,100);
  fill(200);
  textSize(40);
     text("Again...",160,420);
     textSize(25);
     fill(0);
     text("... ...", 140,80); 
noStroke();
  frogFour(240,265);
}

else if (frog ==6){
   background(40);
      strokeWeight(3);
     line(100, 100, 40, 115);
     smooth();
     fill(255);
ellipse(170,70,300,100);
  fill(200);
  textSize(40);
     text("uh... I'm angry..",90,420);
      textSize(25);
     fill(0);
     text("What's the game?",70,57);
     text("Take my words!!", 70, 90);
     noStroke();
  frogFi(240,265);
}

else if (frog ==7){
    background(40);
    strokeWeight(3);
     line(100, 100, 40, 115);
     smooth();
     fill(255);
ellipse(170,70,300,100);
  fill(200);
  textSize(35);
     text("What the So.. naughty frog...",30,420);
      textSize(35);
     fill(0);
     text("STOP!!! STOP!!!",60,80);
     noStroke();
  frogFive(240,265, random(0.4,1.4));
}

else if (frog ==8){
   background(40);
      strokeWeight(3);
     line(100, 100, 40, 115);
     smooth();
     fill(255);
ellipse(170,70,300,100);
  fill(200);
 // textSize(40);
   //  text("",90,420);
      textSize(40);
     fill(255,0,0);
     text("Wanna DIE ?!!?!",50,80);
     fill(255,0,0);
     text("!", 350, 200);
     noStroke();
  frogSix(240,265);
}
else if (frog ==9){
    background(40);
      strokeWeight(3);
     line(100, 100, 40, 115);
     smooth();
     fill(255);
ellipse(170,70,300,100);
  fill(200);
 textSize(40);
//   text("I finally feel relaxed",70,420);
      textSize(26);
     fill(0);
     text("Change the color to white",45,80);
     noStroke();
  frogSev(240,265);
}

else if (frog ==10){
 background(40);
      strokeWeight(3);
     line(100, 100, 40, 115);
     smooth();
     fill(255);
ellipse(170,70,300,100);
  fill(200);
 textSize(40);
   text("I finally feel relaxed",70,420);
      textSize(28);
     fill(0);
     text("Good job",110,80);
     noStroke();
  frogSeven(240,265);
}
else if (frog ==11){
   background(40);
  textSize(60);
  fill(255);
  text("The End",70,240);
  noStroke();
  frogEnd(340,215,0.3);
}
}

void mousePressed(){
  
  if(frog == 0) {
    frog = 1;
  }
  
  else if (frog == 1){
    frog = 2;
  }
  
  else if (frog ==2){
    frog =3;
  }
  
  else if (frog==3){
    frog =4;
  }
  
  else if (frog==4){
    frog =5;
  }
  
  else if (frog ==5){
    frog =6;
  }
  
  else if(frog ==6){
    frog =7;
  }
  
  else if (frog ==7){
    frog =8;
  }
  
  else if (frog ==8){
    frog =9;
  }  
  
  else if (frog==9){
    frog=10;
  }
  
  else if (frog ==10){
    frog =11;
  }
  
  else if (frog ==11){
    frog =12;
  }
}



void frogOne(int x, int y){
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



void frogTwo(int x, int y,int a, float s){
  translate(x, y);
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
line(47, 88, 132, a);//right foot
fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

void frogThr(int x, int y,int a, float s){
  translate(x, y);
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
line(47, 88, 132, a);//right foot
fill(164, 255, 46);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

void frogThree(int x, int y){
translate(x,y);
fill(219, 30, 20);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(219, 30, 20);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(219, 30, 20);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);

stroke(255, 107, 70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(219, 30, 20);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(219, 30, 20);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}

void frogFo(int x, int y){
translate(x,y);
fill(219, 30, 20);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(219, 30, 20);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(219, 30, 20);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);

stroke(255, 107, 70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(219, 30, 20);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(219, 30, 20);
arc(-135, 40, 90,60, 0-QUARTER_PI-PI/2, QUARTER_PI);//left leg
line(-167, 18, -85, 88);
line(-85, 88,-170,88);//left foot
}
 
 
 
 void frogFour(int x, int y){
translate(x,y);
fill(62, 115, 255);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(62, 115, 255);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 20, 20);
fill(62, 115, 255);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 20, 20);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);

stroke(255, 107, 70);
strokeWeight(2);
line(-103, -55, 63,-55); //mouse

fill(62, 115, 255);
arc(96, 40, 90, 60, 2.36, 5.5); //right leg
line(128,18,47,88);
line(47, 88, 132, 88);//right foot

fill(62, 115, 255);
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


 
void frogFive(int x, int y, float s){
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


void frogSix(int x, int y){
translate(x,y);
fill(164, 255, 46);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(164, 255, 46);
ellipse (-70, -90, 60, 60); //left eye
fill(255);
ellipse(-70,-90, 45, 45);
fill(0);
ellipse(-70,-90, 20, 20);
fill(164, 255, 46);
ellipse(30, -90, 60, 60); //right eye
fill(255);
ellipse(30,-90, 45, 45);
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
 

void frogSev(int x, int y){
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


void frogSeven(int x, int y){
translate(x,y);
fill(255);
ellipse (-20, 0, 210,200); //body

fill(255);
ellipse (-20, 30, 140, 140); //stomach
fill(255);
ellipse (-70, -90, 60, 60); //left eye
fill(0);
ellipse(-70,-90, 25, 25);
fill(255);
ellipse(30, -90, 60, 60); //right eye
fill(0);
ellipse(30, -90, 25, 25);


fill(134, 72, 57);
ellipse(-30, -80, 3, 3); //nose hole
ellipse(-10, -80, 3, 3);

stroke(255, 107, 70);
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

