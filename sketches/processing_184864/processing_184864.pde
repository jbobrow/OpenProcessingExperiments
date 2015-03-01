
int x=0;
int speed=3;
int y=100;
int z=285;

void setup(){
  size(400,700);
  background(0);
  smooth();
  fill(139,90,43);
  stroke(255);
  strokeWeight(6);
  ellipse(200,380,180,180);
  fill(255,215,0);
  triangle(100,400,300,400,200,600);
}

void draw(){
  iceCream();
  move();
}



void iceCream(){
  if((mouseX<275)&&(mouseX>125)&&(mouseY<390)&&(mouseY>310)){
    float a=random(255);
    float b=random(255);
    float c=random(255);
    stroke(a,b,c,150);
     for (int i=-20;i<=20;i=i+30) {
      point(mouseX+i,mouseY); 
     }
  }
}


void move(){
  if(mouseButton==LEFT){
    float a=random(30);
    float b=random(255);
    float c=random(255);
    float d=random(255);
    
    background(255,b,c,15);
    rectMode(CENTER);
    line(170,400,170,500);
    line(230,400,230,500);
    fill(255,0,b);
    rect(200,350,100,150);
    line(250,300,300,360);
    line(150,300,100,360);
    fill(255,228,181);
    ellipse(200,170,240,300);
    fill(255,c,b);
    ellipse(200,280,160,60);
    fill(255);
    ellipse(110,180,50,50);
    ellipse(290,180,50,50);
    fill(0);
    ellipse(y,190,a,a);
    ellipse(z,190,a,a);
    y=y+speed;
    z=z+speed;
    if((y<100)||(y>130)){
      y=100;
    }
    if((z<280)||(z>310)){
      z=285;
    }
    
   
    fill(b,d,c);
  stroke(255);
  strokeWeight(6);
  ellipse(x,380,180,180);
  fill(255,215,c);
  triangle(x-100,400,x+100,400,x,600);
  x=x+speed;
  if((x<0)||(x>400)){
    speed=speed*-1;
  }
  }
}


