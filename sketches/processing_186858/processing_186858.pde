
Pusher[] balls = new Pusher[100];

void setup(){
  size(300,300);
  background(0);
  smooth();
  
  for (int i = 0; i < balls.length; i++){
  balls[i] = new Pusher((random(width)),(random(height)),(random(25)+3),(random(25)+15));
  }

}

void draw(){
  
  fill(0,75);
  rect(0,0,width,height);
  
  for (int i = 0; i < balls.length; i++){
  
    
  int j = int(map(i,0,balls.length,int(balls.length/2),int(balls.length)));
  int k = int(map(i,0,balls.length,0,int(balls.length/2)));
   stroke(255); 
    
    line(balls[j].followerx,balls[j].followery,balls[k].followerx,balls[k].followery);
    
  balls[i].move();
  balls[i].display();
  
  
  
  
  
  
  }
  
  stroke(155,255,0,75);
  fill(100,175,0,50);
  ellipse(mouseX, mouseY,35,35);
  
}


class Pusher {
  float xpos;
  float ypos;
  float mdist = 0;
  float diameter = 15;
  float repel = 50;
  float easing = 0.05;
  float followerx;
  float followery;

Pusher(float txpos, float typos, float tdiameter, float trepel){
  xpos = txpos;
  ypos = typos;
  followerx = txpos;
  followery = typos;
  diameter = tdiameter;
  repel = trepel;
}

void move(){
  float targetx = xpos;
  float targety = ypos;
  
  followerx += (targetx - followerx) * easing;
  followery += (targety - followery) * easing;
  
  mdist = dist(mouseX,mouseY,followerx,followery);
  
  if(mdist < (diameter*2)){
    xpos += random(-repel, repel);
    ypos += random(-repel, repel);
  }
  
  if(xpos <= 0){
    xpos+=repel;
  }
  if(xpos >= height){
    xpos-=repel;
  }
  if(ypos <= 0){
    ypos+=repel;
  }
  if(ypos >= height){
    ypos-=repel;
  }
  
}

void display(){
  stroke(255,200,0,75);
  fill(255,200,0,50);
  ellipse(followerx, followery, diameter, diameter);
  
}
}



