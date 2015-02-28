
int num = 60;
int x[] = new int[num];
int y[] = new int[num];

float posx;
float posy;



void setup(){
  size(600, 600);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
  
  posx = 300;
  posy = 300;
  
}

void draw(){
  background(0);
  
 fill(255, 0, 0);
 ellipse(posx-(posx/6), posy, posx/6, posy/6);
 ellipse(posx+(posx/6), posy, posx/6, posy/6);
  //arc(posx-(posx/6), posy, posx/6, posy/6, HALF_PI+QUARTER_PI, TWO_PI);
  //arc(posx+(posx/6), posy, posx/6, posy/6, PI, TWO_PI+QUARTER_PI);
  triangle(posx-(posx/3), posy+(posy/19), posx+(posx/3), posy+(posy/19), posx, posy*1.5);
  //copy array values from back to front
  for(int i = x.length-1; i > 0; i--){
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
 
  x[0] = mouseX; //start position
  y[0] = mouseY; //start position
  
  
  for(int i = 0; i < x.length; i++){
    fill(i*4);
    ellipse(x[i], y[i], 40, 40);
  }
  
  
}


