
MrBat [] bats;
MrBat myMrBat;

void setup() {
  frameRate(10);
  size(800, 600);
  background(0);
  smooth();
   bats=new MrBat[0];
  
}

void draw() {
  background(0);
   if(bats != null){
 for(int i=0; i<bats.length; i++){ //adds bats to the array
 // println(i);
  bats[i].display();
  bats[i].move();
 }
 
 }
 if(frameCount % 10==0){
    
      myMrBat=new MrBat(random(width), random(height));// bat generates at a random location
     bats=(MrBat[]) append(bats,myMrBat);
       
   }
  
}

class MrBat {
  float bodyR;
  float bodyG;
  float bodyB;
  float opacity;
  float eyeR;
  float eyeG;
  float eyeB;
  float cx;
  float cy;
  int speedx;
  int speedy; 
  float mrbatSize;


  MrBat(float centerX, float centerY) {
    cx=centerX;// center x of bat body
    cy=centerY;// center y of bat body 
    bodyR=random(75,100);
    bodyG=random(75,100);
    bodyB=random(100,150);
    eyeR=random(175, 230);
    eyeG=random(125, 175);
    eyeB=40;
    speedx=int (random(-6,6)); 
    if(speedx==0){
      speedx=1;
    }
    speedy=int(random(-6,6));
    if(speedy==0){
      speedy=1;
    }
    opacity= random(200,255);
     mrbatSize=random(0.75,1.25);
    
    //boolean goLeft=true;
  }


  void display() {
    pushMatrix();
    translate(cx,cy);
    scale(mrbatSize);
    translate(-cx,-cy);
    
    ellipseMode(CENTER); 

    noStroke();
    fill(bodyR, bodyG, bodyB,opacity);

    ellipse(cx, cy, 40, 40);
    triangle(cx+10, cy, cx+50, cy-30, cx+90, cy-10);// main right wing
    triangle(cx-90, cy-10, cx-10, cy, cx-50, cy-30);// main left wing
    triangle(cx+90, cy-10, cx+90, cy, cx+62, cy-7); //sub right wing A
    triangle(cx+65, cy-7, cx+65, cy+10, cx+38, cy-4); //sub right wing B
    triangle(cx+39, cy-4, cx+45, cy+10, cx+15, cy-1); //sub right wing C
    triangle(cx-90, cy-10, cx-90, cy, cx-62, cy-7); // sub left wing A
    triangle(cx-65, cy-7, cx-65, cy+10, cx-40, cy-4); // sub left wing B
    triangle(cx-39, cy-4, cx-45, cy+10, cx-15, cy-1); // sub left wing C
    triangle(cx-20, cy-5, cx-20, cy-30, cx-10, cy-15); // left ear
    triangle(cx+10, cy-15, cx+20, cy-30, cx+20, cy-5); // right ear

    fill(eyeR, eyeG, eyeB);
    ellipse(cx-10, cy, 10, 20); // left eye
    ellipse(cx+10, cy, 10, 20); // right eye
    
      fill(eyeR,eyeG,eyeB, 100); 
    ellipse(cx-10, cy, 15, 25); //eye glow 1
    ellipse(cx+10, cy, 15, 25);
    
    fill(eyeR,eyeG,eyeB, 75);
    ellipse(cx-10, cy, 20, 25); // eye glow 2
    ellipse(cx+10, cy, 20, 25);
    
    fill(eyeR,eyeG,eyeB, 50);
    ellipse(cx-10, cy, 30, 30); //eyeglow 3
    ellipse(cx+10, cy, 30, 30);
    
   popMatrix();
  }
  
  void move(){
    
    cy=cy+speedy;
    cx=cx+speedx;
    
    if(cx>width || cx<0){
      speedx*=-1;
    }
    if(cy>height || cy<0){
      speedy*=-1;
    }
    
   /* if(goLeft){
     y=y-speedy;
     x=x-speedx;
    }
    else{
      y=y+speedy;
     x=x+speedx;
    }
    if(x>=width){
      goLeft=false;
    }
    if(x<=0){
      goLeft=true;
  }
  */
}
}




