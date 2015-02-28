
float b = 0.0;
float offset = 0.0;

void setup(){
  size (400,400);
  smooth();
  noStroke();
  fill(227,18,133);
  background (164,250,239);
  frameRate(30);
}
void draw(){
  //background(255);

  for (float a = 0; a <= 360; a += 45){

    float f = radians (a+offset);
    float h = radians (b);

    noStroke();
    fill(250-(sin(b)*50),234-(sin(b)*50),209-(sin(b)*70)); //rosado
    float x3 = width/2 + sin (f) * (100 + cos (b)*60);
    float y3 = height/2 + cos (f) * (100 + cos (b)*60);
    ellipse (x3, y3, cos (b)*4, cos (b)*4);



    fill(247-(cos(b)*60),90,119); //magenta
    float x1 = width/2 + sin (f) * (80+ sin (b)*10);
    float y1 = height/2 + cos (f) * (80+ sin (b)*10);
    ellipse (x1, y1, abs(sin (b)*2), abs(sin (b)*2));


    float x = width/2 + cos (f) * (100 + sin (b)*60);
    float y = height/2 + sin (f) * (100 + sin (b)*60);
    ellipse (x, y, 3+abs(sin (b)*10), 3+abs(sin (b)*10));

    fill(250,233,167); //amarillo
    float x2 = width/2 + cos (f) * (20+ sin (b)*10);
    float y2 = height/2 + sin (f) * (20+ sin (b)*10);
    ellipse (x2, y2, abs(sin (b)*4), abs(sin (b)*4));

    fill(227,18,133); //magenta centro 1
    float x4 = width/2 + sin (f) * (10+ sin (b)*10);
    float y4 = height/2 + cos (f) * (10+ sin (b)*10);
    ellipse (x4, y4, 4, 4);

    fill(188,27,78); //magenta centro 2
    float x5 = width/2 + sin (f) * (10+ sin (b)*10);
    float y5 = height/2 + cos (f) * (10+ sin (b)*10);
    ellipse (x5, y5, 6, 6);
    stroke(255,100);
    line(x1,y1,x3,y3);
   
    stroke(240,167,190);
    line(x3,y3,x4,y4);
  }

  b += 0.2;
  offset += 4;
  filter(BLUR,1);
  filter(DILATE);
}

























