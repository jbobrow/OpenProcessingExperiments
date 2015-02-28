
int counter;
int gaga = 10;
int jxz = 34;


int bbo = 110;
int ellsm = 330;
int ellmed = 450;
int elllg = 650;


void setup() {  //setup function called initially, only once
  size(1250, 650);
  background(255,255,255,0);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 24;
}

void draw() {  //draw function loops 
  counter*=3;
  noStroke();
  ellipse(34,120,ellsm,ellsm)
  fill(#333333);
  for(int ii = 2;ii<24;ii++){
      ellipse(counter*3,counter*5,ellsm,ellsm);
      noStroke();
      fill(#19afd6);
      ellipse(counter+122,counter+345,ellsm,ellsm);
      fill(#19afd6);
      ellipse(ii + counter, counter + 55 + ii,ellsm,ellsm);
      ellipse(ii +10+888,ii+220,ellsm,ellsm);
      fill(#d61957);
  }
  
}
