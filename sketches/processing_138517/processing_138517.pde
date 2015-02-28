
// TWO SENTENCE ARTISTIC STATEMENT

// I tried two different methods of defining the palette - one upon start and another within the setup, using loops
color[] dexter = {
  color(190, 0, 0, 200), 
  color(200, 0, 0, 200), 
  color(210, 0, 0, 200), 
  color(220, 0, 0, 200), 
  color(230, 0, 0, 200), 
  color(240, 0, 0, 200)
};
// Try another way:)
color[] breakingBad=new color[10];
color[] deepBlue=new color[10];
color[] theThing=new color[10];
color[] palette;


// I want a lot of cirlces on a lot of positions :)
float xpos [] = new float[1000];
float ypos [] = new float[1000];
float xadd [] = new float[1000];
float yadd [] = new float[1000];
float xwid [] = new float[1000];
float ywid [] = new float[1000];
float wadd [] = new float[1000];
int cykles = 1;
float theStroke = 10;
float strokeAdd = .05;
int numberOfCirles = 600;
//Create setup code block
void setup() {
  size(1280, 800);
  //Create the other color palettes
  for (int i=0; i < 10; i++) {         
    breakingBad[i]=color(0, 150+i*10, 0, 200);
    deepBlue[i]=color(0, 200, 150+i*10, 200);
    theThing[i]=color(150+i*10, 0, 0, 20);
  }
  // Set up the circle coordinates and 'iterators'
  for (int i=0;i<numberOfCirles;i++) {
    xpos[i] = random (1, width);
    ypos[i] = random (1, height);
    xadd[i] = random (-2, 2);
    yadd[i] = random (-2, 2);
    wadd[i] = random (0, 1);
    xwid[i] = random (10, 30);
    ywid[i] = random (10, 30);
  }
  palette= dexter;
  background(palette[0]);
}

//Create the draw code block
void draw() {
  theStroke+=strokeAdd   ; 
  if (theStroke>50 || theStroke<10) {
    strokeAdd=-strokeAdd;
  }
  cykles++;
  if (cykles >400) {
    cykles=1;
    switch(int(random(0, 3) )) {
    case 0: 
      palette= dexter;
      break;
    case 1: 
      palette= deepBlue;
      break;
    case 2: 
      palette= theThing;
      break;
    default:             
      palette= dexter;
      break;
    }
  }
  for (int i=0; i < numberOfCirles; i++) {  
    stroke(0, 0, 0, 30);
    strokeWeight(int(random(1, theStroke)));
    fill(palette[int(random(1, 5))]);
    ellipse(xpos[i], ypos[i], xwid[i], ywid[i]);
    xpos[i]+=xadd[i];
    ypos[i]+=yadd[i];
    xwid[i]+=wadd[i];
    ywid[i]+=wadd[i];
    if ( xwid[i]>30) {
      wadd[i]=random(-1, 0);
    }
    else if ( xwid[i]<15  ) {
      wadd[i]=random(0, 1);
    }
    else if ( ywid[i]>30) {
      wadd[i]=random(-1, 0);
    }
    else if ( ywid[i]<15  ) {
      wadd[i]=random(0, 1);
    }
    if (xpos[i]>width) {
      xadd[i]=random(-2, 0);
    }
    if (xpos[i]<1) {
      xadd[i]=random(0, 2);
    }
    if (ypos[i]>height) {
      yadd[i]=random(-2, 0);
    }
    if (ypos[i]<1) {
      yadd[i]=random(0, 2);
    }
    yadd[i]=yadd[i]+random(-0.25, 0.25);   
    xadd[i]=xadd[i]+random(-0.25, 0.25);
  }
}



