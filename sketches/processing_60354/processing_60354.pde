
// My_clock
// this makes a display like the TIX clock
// each digit is displayed as a random set of coloured boxes
// the number of "lit" equals the digit
// Rob Antonishen
// http://ffaat.pointclark.net
// Oct 2006

color  sq_col;
color  bg_col = color(0,0,64);
int    app_width = 800;

// The statements in the setup() function 
// execute once when the program begins
void setup() 
{
  size(int(app_width), int(app_width/14*5));  // Size should be the first statement
  colorMode(HSB,255); 

  background(bg_col); //doesn't always work?

  stroke(color(0,0,128));     // Set line drawing color to grey  
  sq_col=color(0,255,255);
}


// The statements in draw() are executed until the 
// program is stopped. Each statement is executed in 
// sequence and after the last line is read, the first 
// line is executed again.
void draw() 
{ 
  int box_space = width/14; 
  int box_size = int(box_space*0.8); 

  int s = second();    // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23

  //trigger on next second...
  while (s==second()) {}

  sq_col=color((hue(sq_col)+4) % 255,255,255);
  background(bg_col); //doesn't always work?

  int h1=h/10;
  int h2=h-h1*10;
  int m1=m/10;
  int m2=m-m1*10;

  int[] lights = new int[9];
  int check;
  int counter;

  // hours tens 
  //fill light array
  counter=3;
  for(int i=0;i<counter;i++) {
    lights[i]=0;
  }
  for(int i=0;i<h1;i++) {
    check=int(random(counter));
    while(lights[check]==1) {
      check=int(random(counter));
    }
    lights[check]=1;
  }

  for(int i = box_space*1; i <= box_space*1; i += box_space) { 
    for(int j = box_space*1; j <= box_space*3; j += box_space) { 
      counter--;
      if(lights[counter]==1) {
        fill(sq_col); 
      } else {
        fill(color(0,0,0));
      }
      rect(i, j, box_size, box_size); 
    } 
  } 

  // hours ones
  //fill light array
  counter=9;
  for(int i=0;i<counter;i++) {
    lights[i]=0;
  }
  for(int i=0;i<h2;i++) {
    check=int(random(counter));
    while(lights[check]==1) {
      check=int(random(counter));
    }
    lights[check]=1;
  }
  for(int i = box_space*3; i <= box_space*5; i += box_space) { 
    for(int j = box_space*1; j <= box_space*3; j += box_space) { 
      counter--;
      if(lights[counter]==1) {
        fill(color((hue(sq_col)+64) % 255,255,255));  //shift color by 1/4 cycle
      } else {
        fill(color(0,0,0));
      }
      rect(i, j, box_size, box_size); 
    } 
  } 

  // minute tens 
  //fill light array
  counter=6;
  for(int i=0;i<counter;i++) {
    lights[i]=0;
  }
  for(int i=0;i<m1;i++) {
    check=int(random(counter));
    while(lights[check]==1) {
      check=int(random(counter));
    }
    lights[check]=1;
  }
  for(int i = box_space*7; i <= box_space*8; i += box_space) { 
    for(int j = box_space*1; j <= box_space*3; j += box_space) { 
      counter--;
      if(lights[counter]==1) {
        fill(color((hue(sq_col)+128) % 255,255,255));   //shift color by 2/4 cycle
      } else {
        fill(color(0,0,0));
      }
      rect(i, j, box_size, box_size); 
    } 
  } 

  // hours ones
  //fill light array
  counter=9;
  for(int i=0;i<counter;i++) {
    lights[i]=0;
  }
  for(int i=0;i<m2;i++) {
    check=int(random(counter));
    while(lights[check]==1) {
      check=int(random(counter));
    }
    lights[check]=1;
  }
  for(int i = box_space*10; i <= box_space*12; i += box_space) { 
    for(int j = box_space*1; j <= box_space*3; j += box_space) { 
      counter--;
      if(lights[counter]==1) {
        fill(color((hue(sq_col)+196) % 255,255,255));  //shift color by 3/4 cycle
      } else {
        fill(color(0,0,0));
      }
      rect(i, j, box_size, box_size); 
    } 
  } 
} 


