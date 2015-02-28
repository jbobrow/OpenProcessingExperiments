
//physics ball
PImage e;
PImage m;
PImage h;
PImage v;
PImage l;
PImage j;
PImage s;
PImage u;
PImage n;
PImage p;

float vy = 0;
float vx = 2;
float x = 10;
float y = 200;
float frictiony = -.6;
float frictionx = .998;
float gravity = .098;

void setup(){
  size(800, 600);
  smooth();
  background(0);
  e = loadImage("Earth.jpg");
  l = loadImage("Moon.jpg");
  h = loadImage("mercury.jpg");
  m = loadImage("mars.jpg");
  v = loadImage("venus.jpg");
  j = loadImage("jupiter.jpg");
  s = loadImage("Saturn.jpg");
  u = loadImage("uranus.jpg");
  n = loadImage("Neptune.jpg");
  p = loadImage("Pluto.jpg");
  image(e,100,0);
}

void draw(){
  vy += gravity; //vy = vy + gravity
  vx *= frictionx; //vx = vx * frictionX
  x += vx;
  y += vy;
  
       //Earth
  if(keyPressed){
    if(key == 'e' || key == 'E'){
      background(0);
      image(e, 100,0);
      x = 10;
      y = 200;
      vx = 10;
      vy = 0;
      gravity =.098;
    }
  }
      
      //Pluto
  if(keyPressed){
    if(key == 'p' || key == 'P'){
      background(0);
      image(p, 100,0);
      x = 10;
      y = 200;
      vx = 10;
      vy = 0;
      gravity =.0066;
    }
  }
     
     //Neptune
  if(keyPressed){
    if(key == 'n' || key == 'N'){
      background(0);
      image(n, 100,0);
      x = 10;
      y = 200;
      vx = 10;
      vy = 0;
      gravity =.1103;
    }
  }
    
    //Uranus
  if(keyPressed){
    if(key == 'u' || key == 'U'){
      background(0);
      image(u, 100,0);
      x = 10;
      y = 200;
      vx = 10;
      vy = 0;
      gravity =.0871;
    }
  }
   
    //Saturn
  if(keyPressed){
    if(key == 's' || key == 'S'){
      background(0);
      image(s, 0,0);
      x = 10;
      y = 200;
      vx = 10;
      vy = 0;
      gravity =.1043;
    }
  }
  
  
  //Jupiter
  if(keyPressed){
    if(key == 'j' || key == 'J'){
      background(0);
      image(j, 100,0);
      x = 10;
      y = 200;
      vx = 10;
      vy = 0;
      gravity = .2317;
    }
  }
  

  //Mars
  if(keyPressed){
    if(key == 'm' || key == 'M'){
      background(0);
      image(m, 100,0);
      x = 10;
      y = 200;
      vx = 10;
      vy = 0;
      gravity = .0369;
    }
  }
  
  //Venus
  if(keyPressed){
    if(key == 'v' || key == 'V'){
      background(0);
      image(v, 100,0);
      x = 10;
      y = 200;
      vx = 10;
      vy = 0;
      gravity = .0888;
    }
  }
  
  //Mercury
  if(keyPressed){
    if(key == 'h' || key == 'H'){
      background(0);
      image(h, 100,0);
      x = 10;
      y = 200;
      vx = 10;
      vy = 0;
      gravity = .037;
    }
  }
  
    //Luna 
  if(keyPressed){
    if(key == 'l' || key == 'L'){
      background(0);
      image(l, 100,0);
      x = 10;
      y = 200;
      vx = 10;
      vy = 0;
      gravity = .0162;
    }
  }
  
  
  if(y >= height){
    y = height;
    vy *= frictiony;
  }
  
  if(x >= width){
    x = width;
    vx *= frictiony;
  }
  
  if(x <0){
    x = 0;
    vx *= frictiony;
  }
  fill(255,0,0);
  ellipse(x,y,10,10);
}

  
  //void mousePressed(){
    //vy -= 2;
  





