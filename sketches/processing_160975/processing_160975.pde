
Umbrella umbrella;
/* @pjs preload="umbrella.png, bg.png"; */
PImage umbrellaImg;
PImage bg;
ArrayList<Rain> rain;
float wind;
float xVelocity = 0;

void setup(){
  size(500,600);
  background(0,0,32);
  umbrella = new Umbrella();
  smooth();
  rain = new ArrayList<Rain>();  
  umbrellaImg = loadImage("umbrella.png");
  bg = loadImage("bg.png");  
}

void draw(){
  for(int i = 0; i < round(random(2,15)); i++){
    if(random(0,1000/float(frameCount)) < float(frameCount)/500){ //causes rain buildup
      rain.add(new Rain(xVelocity));
    }
  }
  image(bg,0,0);
  umbrella.display();
  wind = random(-0.1,0.1);
  xVelocity += wind;
  for(int i = 0; i < rain.size(); i++){
    Rain drop = rain.get(i);
    drop.update(xVelocity);
    drop.display();
    if(collision(drop.x,drop.y,umbrella.x,umbrella.y) || drop.y > height){
      drop.collide();
    }
    else if(drop.bounce > 2){
      rain.remove(i);
    }
  }
  image(umbrellaImg,umbrella.x - 60, umbrella.y - 35);
  saveFrame();
}

void mouseDragged(){
  if(collision(mouseX,mouseY,umbrella.x,umbrella.y)){
    umbrella.update();
  }
}
class Rain{
  color colour = color(155,155,155);
  float x;
  float y = 0;
  float yVelocity = 10;
  float xNew, yNew;
  int bounce = 0;
  
  Rain(float xVelocity){
    x = random(-60*abs(xVelocity), width + abs(60*xVelocity));
  }
  
  void update(float xVelocity){
    yNew = y + yVelocity;
    xNew = x + xVelocity;
    if(yVelocity < 10 && y < height){
      yVelocity +=0.7;
    }
  }
  
  void display(){
    stroke(colour);
    line(x,y,xNew,yNew);
    x = xNew;
    y = yNew;
  }
  
  void collide(){
    yVelocity = ceil(- 0.5 * yVelocity);
    if(y > height){
      y = height;
      bounce ++;
    }
    
  }
  
}

boolean collision(float x_, float y_, float x2_, float y2_){
  float disX = x_ - x2_;
  float disY = y_ - y2_;
  if (sqrt(sq(disX/60) + sq(disY/35)) < 1 && disY < 0) {
    return true;
  } else {
    return false;
  }
}
  
class Umbrella{
  float x = width/2;
  float y = height - 90;
  float xDis, yDis;
  
  
  Umbrella(){
  }
  
  void update(){
    xDis = pmouseX - x;
    yDis = pmouseY - y;
    x = mouseX - xDis;
    //y = mouseY - yDis;
    
  }
  
  void display(){
//    noStroke();
//    fill(255,255,255);
//    arc(x, y, 120, 70, -PI, 0);
//    rect(x-2,y,4,40);
//    ellipse(x-20,y+20, 20,20);
//    ellipse(x-20,y+50, 20,70);
//    rect(x-30, y + 50, 20, 40);
//    ellipse(x,y+30,9,12);
//    stroke(255,255,255);
//    line(x,y+30,x-20,y+50);
//    line(x,y+29,x-20,y+49);
//    line(x,y+28,x-20,y+48);
  }
  
}



