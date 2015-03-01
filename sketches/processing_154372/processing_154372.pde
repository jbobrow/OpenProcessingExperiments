
boolean[][] occupied;
particle[][] reference;
PVector mouse;
PVector pmouse;
PVector mouseV;
class particle{
  PVector location;
  PVector velocity;
  int impatience = 1;
  color clr;
  particle(int x,int y,color clr){
    location = new PVector(x,y);
    velocity = new PVector();
    this.clr = clr;
    occupied[x][y] = true;
    reference[x][y] = this;
  }
  void update(){
    int px = round(location.x);
    int py = round(location.y);
    PVector newLoc = PVector.add(location,velocity);
    int nx = round(newLoc.x);
    int ny = round(newLoc.y);
    if((px==nx&&py==ny)==false){
      if(nx<0||nx>=width){
        velocity.x *= -0.5;
      }else if(ny<0||ny>=height){
        velocity.y *= -0.5;
      }else{
        if(occupied[nx][ny]){
          PVector delta = PVector.sub(reference[nx][ny].velocity,velocity);
          delta.mult(0.8);
          float heat = impatience/3f;
          delta.add(new PVector(random(-heat,heat),random(-heat,heat)));
          velocity.add(delta);
          reference[nx][ny].velocity.sub(delta);
          impatience++;
          if(impatience>4){impatience = 4;}
        }else{
          occupied[px][py] = false;
          occupied[nx][ny] = true;
          reference[nx][ny] = this;
          location = newLoc;
          impatience = 0;
        }
      }
    }
    if(mousePressed){
      PVector arm = PVector.sub(mouse,location);
      float rad = 64;
      if(arm.mag()<rad){
        PVector delta = PVector.sub(mouseV,velocity);
        delta.mult((1-arm.mag()/rad)*0.5);
        velocity.add(delta);
      }
    }
    velocity.y += 3.0;
  }
}
particle[] field;
void setup(){
  size(800,600);
  occupied = new boolean[width][height];
  reference = new particle[width][height];
  int boxSize = 150;
  field = new particle[boxSize*boxSize];
  for(int i=0;i<field.length;i++){
    int x = width/2-boxSize/2+i%boxSize;
    int y = height/2-boxSize/2+i/boxSize;
    field[i] = new particle(x,y,color(random(0,255),random(0,255),random(0,255)));
  }
}
void draw(){
  background(0);
  pmouse = new PVector(pmouseX,pmouseY);
  mouse = new PVector(mouseX,mouseY);
  mouseV = PVector.sub(mouse,pmouse);
  for(int i=0;i<field.length;i++){
    field[i].update();
    set(round(field[i].location.x),round(field[i].location.y),field[i].clr);
  }
}


