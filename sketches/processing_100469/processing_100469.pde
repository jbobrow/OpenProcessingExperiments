
/*
  MAIN SOURCE FOR CODE: Sketchbook -> GalacticSim
*/
Dotobj[] Dots = new Dotobj[20];
int time;
int temp;
float scaling = 1;
int inactivedots = 0;
int growingdot = -1;
int dotTrack = -1;
PVector tempvect = new PVector(0, 0, 0);
PVector totalVelocity = new PVector(0, 0, 0);
color tempColor = color(0, 0, 0);


void setup() 
{
  size(300, 300);
  background(255);
  PVector startpos = new PVector(0, 0, 0);
  PVector startvel = new PVector(0, 0, 0);
  for (int i = 0; i < Dots.length; i++){
    startpos.set(random(width), random(height), 0);
    startvel.set(random(-0.01, 0.01), random(-0.01, 0.01), 0);
//    startpos.set(width/2 + random(-1, 1), height/2 + random(-1, 1), 0);
//    startvel.set(0, 0, 0);
    Dots[i] = new Dotobj(startpos, startvel, i, 100);
  }
  stroke(0);
  fill(0);
  ellipseMode(CENTER);
  noSmooth();
} 

void draw() {
  if ((time + 1) < millis()){
    time = millis();
    //background(255);
    totalVelocity.set(0, 0, 0);
    for (int i = 0; i < Dots.length; i++){
      if (Dots[i].active){
        totalVelocity.add(PVector.mult(Dots[i].vel, Dots[i].mass));
      }
    }
    println(totalVelocity);
    for (int i = 0; i < Dots.length; i++){
      Dots[i].display();
    }
    if (growingdot > -1){
      Dots[growingdot].mass *= 1.2;
      line(Dots[growingdot].pos.x * scaling, Dots[growingdot].pos.y * scaling, mouseX, mouseY); 
    }
    
    for (int i = 0; i < Dots.length; i++){
      Dots[i].calcs();
    }
    for (int i = 0; i < Dots.length; i++){
      Dots[i].collisionCheck();
    }
    for (int i = 0; i < Dots.length; i++){
      Dots[i].addvel();
    }
    if (dotTrack > -1){
      tempvect.set(((width/(2 * scaling)) - Dots[dotTrack].pos.x), ((height/(2 * scaling)) - Dots[dotTrack].pos.y), 0.0);
      for (int i = 0; i < Dots.length; i++){
        Dots[i].posshift(tempvect);
      }
      Dots[dotTrack].collisionCheck();
    }
    processPixels();
  }
}


class Dotobj {
  PVector pos, vel, temp;
  color colorValue;
  boolean active = true;
  boolean drawing = true;
//  boolean type;
  float mass = 5;
  int id;
  
  Dotobj(PVector postemp, PVector veltemp, int tempid, float tempmass) {
    id = tempid;
    pos = new PVector(postemp.x, postemp.y);
    vel = new PVector(veltemp.x, veltemp.y);
    temp = new PVector(0, 0);
    mass = tempmass;
    colorValue = color(random(255), random(255), random(255));
  }
  
  void display() {
    if (drawing) {
      stroke(colorValue);
      fill(colorValue);
      ellipse(pos.x * scaling, pos.y * scaling, (sqrt(mass/PI)) * scaling, (sqrt(mass/PI)) * scaling);
    }
  }
  
  void calcs() {
    for (int i = 0; i < Dots.length; i++){
      if (i != id && Dots[i].active) {
        temp.set(PVector.sub(Dots[i].pos, pos));
        temp.normalize();
        vel.add(PVector.mult(temp, ( Dots[i].mass / sq(pos.dist(Dots[i].pos)))));
      }
    }
  }
  
  void collisionCheck(){
    if (active){
      for (int i = 0; i < Dots.length; i++){
        if ((PVector.dist(Dots[i].pos, pos) < (sqrt(mass/TWO_PI) + sqrt(Dots[i].mass/TWO_PI))) && Dots[i].active && i != id) {
          Dots[i].deactivate();
          pos.set(PVector.div(PVector.add(PVector.mult(Dots[i].pos, Dots[i].mass), PVector.mult(pos, mass)), (Dots[i].mass + mass)));
          vel.set(PVector.div(PVector.add(PVector.mult(Dots[i].vel, Dots[i].mass), PVector.mult(vel, mass)), (Dots[i].mass + mass)));
          colorValue = color((red(Dots[i].colorValue)*Dots[i].mass + red(colorValue)*mass) / (Dots[i].mass + mass), (green(Dots[i].colorValue)*Dots[i].mass + green(colorValue)*mass)/ (Dots[i].mass + mass), (blue(Dots[i].colorValue)*Dots[i].mass + blue(colorValue)*mass)/ (Dots[i].mass + mass));
          mass = Dots[i].mass + mass;
        }
      }
    }
  }
  
  void addvel() {
    if (active){
      pos.add(vel);
    }
  }
  
  void posshift(PVector change){
    if (active) {
      pos.add(change);
    }
  }
  
  void activate() {
    active = true;
    drawing = true;
    inactivedots--;
  }
  
  void deactivate() {
    active = false;
    drawing = false;
    inactivedots++;
  }
}


PVector mouse = new PVector(0, 0, 0);
PVector mouse2 = new PVector(0, 0, 0);
boolean dragging = false;

void mousePressed(){
  dragging = false;
  mouse.set(float(mouseX), float(mouseY), 0);
  if (mouseButton == RIGHT && inactivedots > 0) {
    for (int i = 0; i < Dots.length; i++){
      if (!Dots[i].active){
        Dots[i].pos.set(mouseX, mouseY, 0);
        Dots[i].pos.mult(1/scaling);
        Dots[i].vel.set(0, 0, 0);
        Dots[i].temp.set(0, 0, 0);
        Dots[i].colorValue = color(random(255), random(255), random(255));
        Dots[i].mass = 1;
        Dots[i].drawing = true;
        growingdot = i;
        break;
      }
    }
  }else{
    if(mouseButton == CENTER){
      for (int i = 0; i < Dots.length; i++){
        if ( PVector.dist(PVector.mult(mouse, (1/scaling)), Dots[i].pos) <= sqrt(Dots[i].mass /PI) + 5 ){
          if (i != dotTrack){
          //  tempColor = Dots[i].colorValue;
         //   Dots[i].colorValue = color(0, 0, 0);
            dotTrack = i;
            background(255);
          }else{
          //  Dots[dotTrack].colorValue = tempColor;
            dotTrack = -1;
          }
          break;
        }
      }
    }else{
      if (dotTrack > -1) {
  //      Dots[dotTrack].colorValue = tempColor;
        dotTrack = -1;
      }
      dragging = true;
    }
  }
}

void mouseReleased(){
  if(mouseButton == CENTER) background(255);
  mouse2.set(float(mouseX), float(mouseY), 0);
  if (growingdot > -1){
    Dots[growingdot].vel.set(PVector.mult(PVector.sub(mouse, mouse2), (1 / (5*scaling))));
    if (dotTrack > -1){
      Dots[growingdot].vel.add(Dots[dotTrack].vel);
    }
    Dots[growingdot].active = true;
    inactivedots--;
    growingdot = -1;
  }else{
    if (dragging){
      for (int i = 0; i < Dots.length; i++){
        Dots[i].posshift(PVector.mult(PVector.sub(mouse2, mouse), (1 / scaling)));
        background(255);
      }
    }
  }
}

void keyTyped(){
  switch(key){
    case 'w': //zoom in
      background(255);
      scaling *= 1.1;
      if(dotTrack == -1){
        mouse.set((mouseX/ (-10 * scaling)), (mouseY/ (-10 * scaling)), 0);
      }else{
        mouse.set((width/ (-20 * scaling)), (height/ (-20 * scaling)), 0);
      }
      for (int i = 0; i < Dots.length; i++){ //zoom in
        Dots[i].posshift(mouse);
      }
      break;
    case 's': //zoom out
      background(255);
      scaling *= 0.9;
      if(dotTrack == -1){
        mouse.set((mouseX/ (10 * scaling)), (mouseY/ (10 * scaling)), 0);
      }else{
        mouse.set((width/ (20 * scaling)), (height/ (20 * scaling)), 0);
      }
      for (int i = 0; i < Dots.length; i++){
        Dots[i].posshift(mouse);
      }
      break;
    case 'r': //reset
      scaling = 1;
      this.setup();
      break;
    case ' ': //spawn a new body orbiting this one
      if (dotTrack > -1 && inactivedots > 0){
        for (int i = 0; i < Dots.length; i++){
          if (!Dots[i].active){
            float distance = ((Dots[dotTrack].mass) * 0.1);
            Dots[i].mass = Dots[dotTrack].mass * 0.1;
            Dots[dotTrack].mass *= 0.9;
            Dots[i].pos.set(Dots[dotTrack].pos.x, Dots[dotTrack].pos.y - distance, 0);
            Dots[i].vel.set(sqrt(Dots[dotTrack].mass / distance) + Dots[dotTrack].vel.x, Dots[dotTrack].vel.y , 0);
            Dots[i].temp.set(PVector.sub( PVector.mult(PVector.add(PVector.mult(Dots[dotTrack].vel, Dots[dotTrack].mass), PVector.mult(Dots[i].vel, Dots[i].mass)), 1 / (Dots[dotTrack].mass + Dots[i].mass)), Dots[dotTrack].vel));
            Dots[i].colorValue = color(random(255), random(255), random(255));
            Dots[i].vel.sub(Dots[i].temp);
            Dots[dotTrack].vel.sub(Dots[i].temp);
            Dots[i].activate();
            break;
          }
        }
      }
      break;
    case '0':
      for (int i = 0; i < Dots.length; i++){
        Dots[i].vel.set(0, 0, 0);
      }
      break;
  }
}


void processPixels(){
  int addition = (6 << 16) + (5 << 8) + 4;
  int white = color(255);
  loadPixels();
  for(int i = 0; i < pixels.length; i++){
    if(pixels[i] != white)
      pixels[i] = ((pixels[i] + addition) & 0xFFFFFF) + (0xFF << 24);//Non-javascript(faster) version: pixels[i] += addition
  }
  updatePixels();
}


