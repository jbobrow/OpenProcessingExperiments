
/*SIMON ENJOYS A RAVE PARTY
 BY GROUP 7 */

//In this animation, Simon is having the time of his life after
//randomly appearing at a party. Accompanied by colourful lights,
//Simon bumps into walls, his head becoming bigger each time.
//As it cathes on fire, Simon has no choice but to
//initiate a self destruction sequence. Best party ever!

float x; 
float y; //coordinates of stickman centre

float larmX; //coordinates of hands
float larmY;
float rarmX;
float rarmY;
float llegX; //coordinates of feet
float llegY;
float rlegX;
float rlegY;

float m=random(-5, 5); //bouncy vertical movement, speed and direction randomised
float n=random(-5, 5); //bouncy horizontal movement

float tiger; //defines how much arms should be stretched
float cheetah; //defines how much legs can be stretched
float giraffe; //the hue of stickman/boundaries

float vanilla; //for the lower left fancy spinning light
float chocolate; //for the lower right fancy spinning light
float strawberry; //upper left
float biscuit; //upper right

float flip=40;
float flop=40; //these are for the head size
float fap=0; //defines the increase in distance from the head to the torso

void setup() {
  size(600, 600);
  background(0);
  colorMode(HSB);
  textSize(80);
  text("Group 7", (width/2)-150, (height/2)+30);
  ellipseMode(CENTER);
  frameRate(60);
  x=random(50,550); //starting position of the stickman
  y=random(50,550);
}

void draw() {

  fancyLights();

  fill(0, 7); 
  rect(0, 0, width-1, height-1); //darken the stickman trace

  tiger=random(-20, 30);
  cheetah=random(20);

  giraffe++;
  stroke(giraffe, 255, 255); //change the colour of strokes



  if (y>=height-(70)) { // if LOWER border hit
    m=m*(-1);
    flip=flip+5; //
    flop=flop+5; // head enlargement
    fap=fap+2.5; // bigger distance from torso

    fill(random(255), 255, 150, 30);
    rect(0, 0, width, height); //make background rectangle flash
  }

  if (y<50) { // if UPPER border hit
    m=m*(-1);
    flip=flip+5;
    flop=flop+5;
    fap=fap+2.5;

    fill(random(255), 255, 150, 30);
    rect(0, 0, width, height);
  }

  if (x>=width-30) { // if RIGHT border hit
    n=n*(-1);
    flip=flip+5;
    flop=flop+5;
    fap=fap+2.5;

    fill(random(255), 255, 150, 30);
    rect(0, 0, width, height);
  }

  if (x<30) { // if LEFT border hit
    n=n*(-1);
    flip=flip+5;
    flop=flop+5;
    fap=fap+2.5;

    fill(random(255), 255, 150, 30);
    rect(0, 0, width, height);
  }


  stickman(x, y); //DRAW A STICKMAN at x,y


    y+=m;
  x+=n; // next time draw the stickman at x,y



  if (giraffe==255) { //renew hue cycle if needed
    giraffe=0;
  }


  if (flip>75) { // if head big enough
    strokeWeight(30);
    stroke(100);
    point(x+random(-25, 25), y-(fap+70)+random(-35, 35)); //smoke
    stroke(0, 255, 200);
    point(x+random(-35, 35), y-(fap+40)+random(-35, 35)); //fire
    strokeWeight(1);
    stroke(giraffe, 255, 255);
  }

  if (flip>100) { // if head even bigger
    strokeWeight(50);
    stroke(20, 255, 200);
    point(x+random(-50, 50), y-fap+random(-100, 60)); //orange explosions
    strokeWeight(30);
    stroke(35, 255, 200);
    point(x+random(-50, 50), y-fap+random(-100, 60)); //yellowish ones
    strokeWeight(1);
    stroke(giraffe, 255, 255);
  }

  if (flip>130) { // if head absolutely huge

    flip=flip+20;
    flop=flop+20; //make head expand rapidly
  }

  if (flip>1000) { //after expanding enough
    background(255);
    strokeWeight(500);
    stroke(20, 255, 200);
    point(random(width), random(height)); //orange explosions
    strokeWeight(300);
    stroke(35, 255, 200);
    point(random(width), random(height)); //yellowish ones
  }

  if (flip>1300) {
    background(0);
    textSize(10);
    text("And then his head exploded.", (width/2)-60, (height/2)); //end
  }

  if (flip>3500) { //after some time, reset everything
    flip=40;
    flop=40;
    fap=0;
    strokeWeight(1);
  }
}

void stickman(float x, float y) {
  strokeWeight(5);
  point(x, y); //center point for reference
  strokeWeight(1);
  line(x, y-10, x, y+30); //torso

  larmX=x-30; 
  larmY=y;
  rarmX=x+30; 
  rarmY=y; //arm ending variables

  line(x, y, larmX, larmY+tiger); //left arm
  line(x, y, rarmX, rarmY+tiger); //right arm

  if (flip>150) {
    fill(255);
  }
  else {
    noFill();
  } //if head is huge, make it white

  ellipse(x, y-(30+fap), flip, flop); //head

  llegX=x-15;
  llegY=y+40;
  rlegX=x+15;
  rlegY=y+40; //leg ending variables

  line(x, y+30, llegX, llegY-cheetah); //left leg part 1
  line(x, y+30, rlegX, rlegY-cheetah); //right leg part 1

  line(llegX, llegY-cheetah, llegX-10, llegY-cheetah+25); //left leg 2
  line(rlegX, rlegY-cheetah, rlegX+10, rlegY-cheetah+25); //right leg 2
} 

void fancyLights() { //creates four fancy arcs in the corners :)
  fill(giraffe, 255, 200);
  arc(0, height, width, height, vanilla, vanilla+1);
  noStroke();
  vanilla=vanilla+0.05;

  fill(giraffe, 255, 200);
  arc(width, height, width, height, chocolate, chocolate+1);
  noStroke();
  chocolate=chocolate+0.05;

  fill(giraffe, 255, 200);
  arc(0, 0, width, height, strawberry, strawberry+1);
  noStroke();
  strawberry=strawberry+0.05;

  fill(giraffe, 255, 200);
  arc(width, 0, width, height, biscuit, biscuit+1);
  noStroke();
  biscuit=biscuit+0.05;
}


