
//Circle grows inside a square
//resets when they intersect and square gets bigger
//cycles around background colors to represent times of day
//at mid day square starts getting smaller
Circle circle;
Square square;
Star[] star = new Star[15];
Cloud[] cloud = new Cloud[1];
Rays[] ray = new Rays[14];
int time = 0;

void setup() {
  size(600, 600); 
  background(0);
  circle = new Circle();
  square = new Square();
 for (int i = 0; i < star.length; i++){    
  star[i] = new Star();
 }
 for (int i = 0; i < cloud.length; i++){    
  cloud[i] = new Cloud();
 } 
 //Sun Rise Rays
 ray[0] = new Rays(0,200,180,220);
 ray[1] = new Rays(0,0,200,200); 
 ray[2] = new Rays(200,0,220,180);
 ray[3] = new Rays(0,250,170,240);
 ray[4] = new Rays(250,0,240,170);
 ray[5] = new Rays(100,0,210,190);
 ray[6] = new Rays(0,100,190,210);
 
 //Moon Rise Rays
 ray[7] = new Rays(width,height-200,width-180,height-220);
 ray[8] = new Rays(width,height,width-200,height-200); 
 ray[9] = new Rays(width-200,height,width-220,height-180);
 ray[10] = new Rays(width,height-250,width-170,height-240);
 ray[11] = new Rays(width-250,height,width-240,height-170);
 ray[12] = new Rays(width-100,height,width-210,height-190);
 ray[13] = new Rays(width,height-100,width-190,height-210);

}

void draw() {
  //square.display();
  

  
//Sun / Moon  
  
 if (circle.r <= square.r) {
    circle.grow();
    circle.display();
    
 }

 else {
    circle.reset();
    square.grow();
    time+=1;
    println(time);
    if(time>=24){
      time=0;
    }

 } 
 //Time of Day Cycle
 
 //Border
 
  if(time>=0 && time<4){
        stroke(#D8A30D);
  }
  if(time>=4 && time<12){
        stroke(#FFFFFF);
  }
  if(time>=12 && time<16){
        stroke(#180874);
  }
  if(time>=16 && time<=24){
        stroke(#A7A8AD);
  }

 
    rectMode(CORNER);
  fill(#FC003F, 200);
  if(time>=0 && time<4){
    ray[int(random(0,7))].display();
    fill(#FC003F, 10);
  }
  rect(0,0,width/2,height/2);
  
  fill(#2E5DD1, 240);
  if(time>=4 && time<12){
  for (int i = 0; i < cloud.length; i++){  
    cloud[i].display();
   }
    
    fill(#2E5DD1, 10);
  }
  rect(width/2,0,width/2,height/2);
  
  fill(#1F252C, 250);
  if(time>=12 && time<16){
    ray[int(random(7,14))].display();
    fill(#1F252C, 10);
  }  
  rect(width/2,height/2,width/2,height/2);
  
  fill(0, 240);
  if(time>=16 && time<=24){
  for (int i = 0; i < star.length; i++){  
    star[i].display();    
   }
    fill(#000000, 10);
  }    
  rect(0,height/2,width/2,height/2);

}

void keyPressed(){
    square.r = 120;
    time = 12;
  }
class Circle {
  float r = 1;
  float x = width/2;
  float y = height/2;
  boolean solar = true;
  
  Circle() {

  }
  
  void grow() {
    r+=(square.r/100);
    
  }
  
  void display() {
    ellipseMode(CENTER);
    if(r>=120) {// && solar == true){
      solar = !solar;
    }

    if(solar){
      fill(#ECED0C);
    }
    else{
      fill(#C5D8C8);
    }
    noStroke();
    ellipse(x,y,r*2,r*2);

  }
  
  void reset() {
    r = 1;
    //x = random(width);
    //y = random(width);
  }
}


  
class Cloud {
  
  Cloud() {
    
  }
  
  void display(){
 //   noStroke();
    rectMode(CORNER);
    fill(255);
    rect(random(width/2,width),random(0,height/2),10,10);
  }
}
class Rays {
  int x1, y1, x2, y2;
  
  Rays(int _x1,int _y1,int _x2,int _y2) {
    x1 = _x1;
    x2 = _x2;
    y1 = _y1;
    y2 = _y2;
    
  }
  
  void display() {
    strokeWeight(3);
    line(x1,y1,x2,y2);
  }
}
class Square {
  float r = 10;
  
  Square(){
    
  }
  
  void display() {
    
    rectMode(CENTER);
    fill(#E5EDE1);
    rect(width/2, height/2, r*2, r*2);
  }
  
  void grow() {
   r+=10;
   if(r>=130){
      r=10;
    }
  }
}
class Star {
  
  Star() {
    
  }
  
  void display(){
  //  noStroke();
    fill(255);
    ellipse(random(0,width/2),random(height/2,height),1,1);
  }
}


