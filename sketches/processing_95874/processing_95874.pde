
String abbr[] = {"DE", "DC", "MD", "VA"};
String months[] = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
int year[] = {2009, 2010, 2011, 2012};
int frame;
PShape usa;
//2009 ~ 2012
float unemploy[] [] = {
  //DE
  {6.7,7.4,7.7,7.5,8.1,8.4,8.2,8.1,8.3,8.7,8.5,9.0,8.8,8.7,8.6,8.5,8.4,8.3,8.3,8.3,8.3,8.4,8.4,8.5,8.5,8.4,8.2,8.0,8.0,8.1,8.1,8.1,7.9,7.6,7.4,7.0,7.0,6.9,6.8,6.8,6.7,6.8,6.7,6.8,6.8,6.7,6.9},
  //DC
  {9.3,9.9,9.8,9.9,10.7,10.9,10.6,11.1,11.4,11.9,11.8,12.1,10.3,10.3,10.1,10.0,9.9,9.8,9.8,9.8,9.7,9.7,9.7,9.6,9.6,9.5,9.5,9.6,9.8,10.4,10.8,11.1,11.1,11.0,10.6,10.4,9.9,9.9,9.8,9.5,9.3,9.1,8.9,8.8,8.7,8.5,8.4},
  //MD
  {6.2,6.7,6.9,6.8,7.2,7.3,7.3,7.2,7.2,7.3,7.4,7.5,7.7,7.6,7.6,7.5,7.4,7.4,7.4,7.4,7.4,7.4,7.4,7.2,7.1,6.9,6.8,6.8,7.0,7.2,7.3,7.4,7.2,6.9,6.7,6.5,6.5,6.6,6.7,6.8,6.9,7.0,7.1,6.9,6.7,6.6,6.6},
  //VA
  {6.0,6.6,6.8,6.8,7.1,7.2,6.9,6.5,6.7,6.6,6.6,6.9,7.2,7.2,7.1,7.1,7.0,6.9,6.8,6.8,6.7,6.7,6.6,6.6,6.5,6.4,6.3,6.1,6.0,6.0,6.1,6.3,6.5,6.4,6.2,6.2,5.8,5.7,5.6,5.6,5.6,5.7,5.9,5.9,5.9,5.7,5.6}
};

void setup() {
  size(500,400);
  usa = loadShape("http://upload.wikimedia.org/wikipedia/commons/3/32/Blank_US_Map.svg");
  smooth();
  frameRate(0.5);
  frame = 0;
  colorMode(RGB);
}

void draw() {
  background(255);
  shape(usa, -600, -100);
  for(int i = 0; i < abbr.length; i++) {
    PShape state = usa.getChild(abbr[i]);
    state.disableStyle();
    if(unemploy[i][frame] >= 5 && unemploy[i][frame] <= 6) {
      fill(0, 0, 255);
    }
    else if(unemploy[i][frame] > 6 && unemploy[i][frame] <= 7) {
      fill(0, 255, 0);
    }
    else if(unemploy[i][frame] > 7 && unemploy[i][frame] <= 9.5) {
      fill(0, 255, 255);
    }
    else if(unemploy[i][frame] > 9.5) {
      fill(255, 0, 0);
    }
    noStroke();
    shape(state, -600, -100);
  }
  int yeari;
  if(frame < 12) yeari = 0;
  else if(frame < 24) yeari = 1;
  else if(frame < 36) yeari = 2;
  else yeari = 3;
  textSize(22);
  fill(204, 20, 75);
  text(months[frame%12] + " " + year[yeari], 300, 200);
  frame++;
  if(frame > 46) {
    frame = 0;
  }
}
  


