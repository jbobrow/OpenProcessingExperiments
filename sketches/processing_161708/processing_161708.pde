
/*****************************************
 * Assignment <<< 3 >>
 * Name:         <<< Nick Vernon >>>
 * Course:       CSC 103 - Creative Computing - Fall 2014
 * Submitted:    <<< Animated Sketch >>>
 * 
 * <<< Two people kicking a soccer ball all day and night in the snow. >>>
 *
***********************************************/
int ballx = 150;
int ballspeed = 3;
int cloudx = 0;
int cloudspeed = 1 ;
float darkness = 255;
float speed = 1;
boolean gettingLighter = true;
int sunspeed = 1;
int sunx = 50;
float X;
float Y;
float snowsize;

void setup() {
  size(500,500);
}

void draw() {
background(#AEE2FA); //sky

fill(230); //clouds...
stroke(230);  

ellipse(100,75,80,80);
ellipse(120,75,50,75);
ellipse(130,75,75,100);
ellipse(140,75,100,50);
ellipse(150,75,50,90);
ellipse(160,75,50,88);
ellipse(170,75,90,50);
ellipse(180,75,50,75);
ellipse(190,75,100,100);
ellipse(200,75,50,50);

ellipse(50,200,80,80);
ellipse(70,200,50,75);
ellipse(90,200,75,100);
ellipse(110,200,100,50);
ellipse(130,200,50,90);
ellipse(140,200,50,88);
ellipse(150,200,90,50);
ellipse(160,200,50,75);
ellipse(170,200,100,100);
ellipse(200,200,50,50);

ellipse(300,150,80,80);
ellipse(320,150,50,75);
ellipse(330,150,75,100);
ellipse(340,150,100,50);
ellipse(350,150,50,90);
ellipse(360,150,50,88);
ellipse(370,150,90,50);
ellipse(380,150,50,75);
ellipse(390,150,100,100);
ellipse(400,150,50,50);

stroke(#118E25);
fill(255);
rect(-100,400,1000,200); //field

stroke(0);
fill(#C92527); //redplayer
rect(25,250,50,100); //torso
rect(25,350,20,30); //legs
rect(55,350,20,30); //legs
ellipse(35,390,25,20); //feet
ellipse(65,390,25,20); //feet
ellipse(50,225,50,50); //head
rect(10,250,15,50); //arms
rect(75,250,15,50); //arms

fill(#114ECE); //blueplayer
rect(425,250,50,100); //torso
rect(425,350,20,30); //legs
rect(455,350,20,30); //legs
ellipse(435,390,25,20); //feet
ellipse(465,390,25,20); //feet
ellipse(450,225,50,50); //head
rect(410,250,15,50); //arms
rect(475,250,15,50); //arms

ballx = ballx + ballspeed;  //add the current speed to the ball location.

if ((ballx > 400) || (ballx < 100)) {
  ballspeed = ballspeed * -1; //when ball reaches foot, multiply speed by -1 to turn it around.
}

stroke(#F1FA12);
fill(#F1FA12);
ellipse(sunx,55,100,100); //sun

stroke(#FA12D4);
fill(#FA12D4);
ellipse(ballx,375,50,50); //ball

X = random(500);
Y = random(300);
snowsize = random(5, 15);

fill(255);
noStroke();
ellipse(X, Y, snowsize, snowsize);

sunx = sunx + sunspeed;  //add the current speed to the sun location.

if ((sunx > 550) || (sunx < 0)) {
  sunspeed = sunspeed * -1;
}

noStroke();
fill(0, darkness); //darkness
rect(0, 0, width, height);

update();
}

void update() {
  if (gettingLighter) {
    darkness = darkness - speed;
    if (darkness == 0) {
      gettingLighter = false;
    }
  } else {
    darkness = darkness + speed; 
    if (darkness == 255) {
      gettingLighter = true;
    }
  }
}


