
//Reginald M. Watkins
//NMD 102
//House Night/Day Zombie


//Declaring variables

PImage b;


float bgcolorR = (18);
float bgcolorG = (198);
float bgcolorB = (155);
float grasscolorR = (40);
float grasscolorG =(180);
float grasscolorB =(48);
float housemaincolorR = (175);
float housemaincolorG = (29);
float housemaincolorB = (12);
float housetopcolorR = (68);
float housetopcolorG = (12);
float housetopcolorB = (173);
float chimneyR = (21);
float chimneyG = (16);
float chimneyB = (82);
float doorR = (178);
float doorG = (127);
float doorB = (16);
float treeR = (162);
float treeG = (118);
float treeB = (21);
float leavesR = (34);
float leavesG = (93);
float leavesB = (19);
//Time of day variables
float time = (0);
float timepassing = (0.5);
float suncycle = (1);
float mooncycle = (1);


void setup() {
  size(400,400);
 b = loadImage("Zombie.gif");

}

void draw() {
  
  //Sky
  background(bgcolorR+time, bgcolorG+time, bgcolorB+time);
  stars();
  //Grass
  fill(grasscolorR+time, grasscolorG+time, grasscolorB+time);
  ellipse(200,350,600,200);
  //Main House Color
  fill(housemaincolorR+time, housemaincolorG+time, housemaincolorB+time);
  rect(170,210,70,70);
  //House Roof
  fill(housetopcolorR+time, housetopcolorG+time, housetopcolorB+time);
  triangle(260,225,207,180,150,225);
  //Chimney
  fill(chimneyR+time, chimneyG+time, chimneyB+time);
  rect(170,184,23,30);
  //Door
  fill(doorR+time, doorG+time, doorB+time);
  rect(193,250,20,30);
  //Doorknob
  fill(59);
  ellipse(208,270,5,5);
  //Trees
  fill(treeR+time, treeG+time, treeB+time);
  rect(110,230,20,40);
  rect(280,230,20,40);
  rect(50,240,20,40);
  rect(340,240,20,40);
  fill(leavesR+time, leavesG+time, leavesB+time);
  ellipse(60,240,45,45);
  ellipse(120,230,45,45);
  ellipse(290,230,45,45);
  ellipse(350,240,45,45);

 timep();
sun();
moon();

image(b, 385-mooncycle, 300);
image(b, 385-mooncycle, 320);
image(b, 385-mooncycle, 340);
image(b, 415-mooncycle, 300);
image(b, 415-mooncycle, 320);
image(b, 415-mooncycle, 340);

}

//This is a command that controls the time of day
void timep() {
  time = time + timepassing;
  
  if ((time > 100) || (time < -125)) {
    timepassing = timepassing * -1;
  }
}

//The Sun
void sun() {


    fill(237,240,106);
    ellipse (-5+suncycle,150-time,30,30);
      suncycle = suncycle + 1;
    
    if ((time > -1) && (time < 1)) {
      suncycle = 1;
      suncycle = suncycle + 1;
}

if (time < -1) {
  suncycle = -15;
}
}

//The Moon

void moon() {
  
   fill(227,245,244);
   ellipse (-5+mooncycle,150+time,30,30);
   
   if (time < 1); 
  mooncycle = mooncycle + 1;


  
      if ((time > -1) && (time < 1)) {
      mooncycle = 1;
      mooncycle = mooncycle + 1;
}

if (time > 1) {
  mooncycle = -15;
}
}

void stars() {
  float starx, stary; //star position variables

  if (time < 1);
  { fill(255);
  starx = random(height);
  stary = random(width);
    ellipse (starx,stary,3,3);
  ellipse (starx,stary,3,3);
  ellipse (starx,stary,3,3);
  ellipse (starx,stary,3,3);
    ellipse (starx,stary,3,3);
  ellipse (starx,stary,3,3);
  ellipse (starx,stary,3,3);
    ellipse (starx,stary,3,3);
  ellipse (starx,stary,3,3);
  ellipse (starx,stary,3,3);
    ellipse (starx,stary,3,3);
  ellipse (starx,stary,3,3);
  ellipse (starx,stary,3,3);
    ellipse (starx,stary,3,3);
  ellipse (starx,stary,3,3);
  ellipse (starx,stary,3,3);
  
 if (time > 1) {
  starx = -15;
  stary = -15;
}
  
  }
}

