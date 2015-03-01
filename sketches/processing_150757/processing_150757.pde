

int maxballs = 600; 


int numballs = maxballs;   //100 


Ball balls[] = new Ball[numballs]; 


boolean borderWhite = false; 


boolean borderExist = false; 


boolean bgWhite = true; 


boolean circleVisible = false; 


float borderWidth = 1.2; 


int minsize = 5; 


int maxsize = 20; 


   


void setup() { 


  size(600, 300); 


  colorMode(HSB,150); 


  strokeWeight(borderWidth); 


  stroke(0, 0, 255); 


  for (int i = 0; i < numballs; i++) { 


    balls[i] = new Ball(); 


  } 


} 


   


void draw() { 


  if (bgWhite) { 


    background(0, 0, 255); 


    stroke(0, 0, 0, 100); 


  } else { 


    background(0, 0, 0); 


    stroke(0, 0, 255, 100); 


  } 


  if (circleVisible) { 


    noFill(); 



    ellipse(300, 300, 400, 200); 


    ellipse(300, 300, 500, 300); 



  


  } 


  if (borderExist) { 


    if (borderWhite) { 


      stroke(0, 0, 255); 


    } else { 


      stroke(0, 0, 0); 


    } 


  } else { 


    noStroke(); 


  } 


   


  for (int i = 0; i < numballs; i++) { 


    balls[i].run(); 


  } 


} 


   


void keyPressed() { 


  if (key == 'c') { 


    circleVisible = !circleVisible; 


  } 


/*  if (key == 'b') { 


    borderWhite = !borderWhite; 


    if (borderWhite) { 


      strokeWeight(1.5); 


    } else { 


      strokeWeight(1.2); 


    } 


  } 


  if (key == 'n') { 


    borderExist = !borderExist; 


  } */ 


  if (key == 'm') { 


    bgWhite = !bgWhite; 


  } 


/*  if (key == 'q') { 


    numballs = int(maxballs * .4); 


    minsize = 10; 


    maxsize = 40; 


    reset(); 


  } 


  if (key == 'w') { 


    numballs = int(maxballs * .4); 


    minsize = 20; 


    maxsize = 40; 


    reset(); 


  } 


  if (key == 'e') { 


    numballs = int(maxballs * .5); 


    minsize = 15; 


    maxsize = 30; 


    reset(); 


  } 


  if (key == 'r') { 


    numballs = int(maxballs *.6); 


    minsize = 10; 


    maxsize = 30; 


    reset(); 


  } 


  if (key == 't') { 


    numballs = int(maxballs * .8); 


    minsize = 10; 


    maxsize = 20; 


    reset(); 


  } */ 


  if (key == 'y') { 


    numballs = maxballs; 


    minsize = 5; 


    maxsize = 20; 


    reset(); 


  } 


  if (key == 'u') { 


    numballs = maxballs; 


    minsize = 5; 


    maxsize = 10; 


    reset(); 


  } 


  if (key == 's') { 


    saveFrame("frames/####.png"); 


  } 


} 


   


void reset() { 


  background(0, 0, 0); 


  for (int i = 0; i < numballs; i++) { 


    balls[i].x = random(width/2-1, width/2+11); 


    balls[i].y = random(height/2-1, height/2+1); 


    balls[i].ballsize = random(minsize, maxsize); 


  } 


} 


   


   


   


class Ball { 


  float x; 


  float y; 


  float xs; 


  float ys; 


  float bfill; 


  float alph; 


  float ballsize; 


   


  Ball() { 


    x = random(width/2-1, width/2+1); 


    y = random(height/2-1, height/2+1); 


    xs = random(1, 5);  //3 


    ys = random(1, 5);  //3 


    float temp; 


    temp = random(-1, 1); 


    if (temp < 0) { 


      xs *= -1; 


    } 


    temp = random(-1, 1); 


    if (temp < 0) { 


      ys *= -1; 


    } 


   


    ballsize = random(minsize, maxsize);  //30 


    float talph = map(ballsize, minsize, maxsize, 0, 100); 


    alph = 170 - talph; 


  } 


   


  void run() { 


    display(); 


    move(); 


  } 


   


  void display() { 


    bfill = map((width/2) - (dist(x, y, width/2, height/2)), 0, width/2, 0, 255); 


    if (bfill < 0) { 


      bfill = 0; 


    } 


    float talph = alph; 


    if (!bgWhite) { 


      talph = alph + 60; 


    } 


    fill(bfill, 255, 255, talph); 


    ellipse(x, y, ballsize, ballsize); 


  } 


   


  void move() { 


   if (dist(x, y, 300, 300) < 50) { 


      x += xs/30; 


      y += ys/30; 


    } else if (dist(x, y, 300, 300) < 100) { 


      x += xs; 


      y += ys; 


    } else if (dist(x, y, 300, 300) < 150) { 


      x += xs/20; 


      y += ys/20; 


    } else if (dist(x, y, 300, 300) < 200) { 


      x += xs; 


      y += ys; 


    } else if (dist(x, y, 300, 300) < 250) { 


      x += xs/10; 


      y += ys/10; 


    } else { 


      x += xs; 


      y += ys; 


    } 


    if (x >= (width - ballsize/2)) { 


      xs *=-1; 


    } 


   


    if (x <= (ballsize/2)) { 


      xs *=-1; 


    } 


   


    if (y >= (height - ballsize/2)) { 


      ys *=-1; 


    } 


   


    if (y <= (ballsize/2)) { 


      ys *=-1; 


    } 


  } 


} 



