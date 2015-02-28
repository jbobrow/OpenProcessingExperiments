
//Ashley Wong amwong
//Copyright Pittsburgh 2012
   
float h,k,dh,dk;
float a,b,c, u,v,s,t;
float beta, gamma;
int phase, delta, sigma,score;
   
void setup() {
  size(600,400);
  background(195,235,255);
  h=random(width);
  k=random(height);
  dh=random(2,6);
  dk=random(2,6);
  u=random(width);
  v=random(height);
  beta=width/10;
  gamma=height/10;
  phase=1;
  textAlign(CENTER);
  score=0;
}
   
void draw(){
  if(phase==1){
    showInstructions();
  }
  else if(phase==2){
    playGame();
    delta=(30-(millis()/1000)%31);
    fill(0);
    textSize(22);
    text("Seconds Left:"+ delta, width/6, height);
    text("Score:"+score, 2*width/3, height);
    if(delta<1){
      phase=3;
    }
  }
  else if(phase==3) {
      gameOver();
    }
}
   
void gameOver() {
  background(195,235,255);
  textSize(22);
  fill(0);
  text("GAME OVER", width/2, height/3);
  text("Your Final Score: " +score+ " !", width/2, 2*height/3);
}
    
void mouseClicked() {
  if (phase==1) {
    phase=2;
  } else {
    phase=1;
    score=0;
    delta=30;
  }
}
void showInstructions(){
  background(195,235,255);
  makeFish(h,k,beta,gamma);
  fishEye(h,k,beta,gamma);
  moveFish();
  textSize(12);
  fill(255,175,75);
  text("Move the mouse to catch the fish.", width/2, height/3);
  text("Keep the hook on the screen or lose points.", width/2, 2*height/5);
  textSize(22);
  fill(0);
  text("Click to start!", width/2, 2*height/3);
}
   
void playGame() {
  //noCursor();
  if((h-a)<(.75*beta)&&(h-a)>-(.75*beta)&&(k-b)<(.75*gamma)&&(k-b)>-(.75*gamma)) {
    collision();
  }
  else {
    swim();
  }
}
   
void collision() {
  background(195,235,255);//reeling in fish
  makeFish(h,k,beta,gamma);
  makeHook(a,b,c);
  deathEye(h,k,beta,gamma);
  k+=-5;
  b+=-5;
  if(k<1) { //begin again
    h=random(width);
    k=random(height);
    a=random(width)/2;
    b=random(height)/2;
    dh=random(4,8);
    dk=random(4,8);
    swim();
    score+=1;
  }
}
void deathEye(float x, float y, float z, float w) {
    if(dh<0) { //left eye
    strokeWeight(1);
    stroke(0);
    line(x-3*z/16,y-5*w/28,x-5*z/16,y-9*w/28);
    line(x-3*z/16,y-9*w/28,x-5*z/16,y-5*w/28);
  }
  if(dh>0) { //right eye
    strokeWeight(1);
    stroke(0);
    line(x+3*z/16,y-5*w/28,x+5*z/16,y-9*w/28);
    line(x+3*z/16,y-9*w/28,x+5*z/16,y-5*w/28);
    }
}
void swim() {
  background(255,205,195);
  makeFish(h,k,beta,gamma);
  fishEye(h,k,beta,gamma);
  moveFish();
  makeHook(a,b,c);
  moveHook();
}
     
     
void makeFish(float x, float y, float z, float w) {
  noStroke();
  fill(255,175,75);
  if(dh<0) { //left fins
    quad(x-z/2,y, x,y-3*w/4, x+z/2,y-3*w/4, x,y);
    quad(x-z/4,y, x,y+3*w/5, x+z/2,y+3*w/5, x,y);
    quad(x,y, x+z,y-w/2, x+3*z/4,y, x+z,y+w/2);
  }
  if(dh>0) { //right fins
    quad(x+z/2,y, x,y-3*w/4, x-z/2,y-3*w/4, x,y);
    quad(x+z/4,y, x,y+3*w/5, x-z/2,y+3*w/5, x,y);
    quad(x,y, x-z,y-w/2, x-3*z/4,y, x-z,y+w/2);
  }
  fill(255,255,125); //body
  ellipse(x,y,z,w);
  if(dh<0) { //left gill and pectoral
    strokeWeight(1);
    stroke(255,120,0);
    noFill();
    arc(x-z/6,y,z/6,w/2,3*PI/2,5*PI/2);
    noStroke();
    fill(255,175,75);
    quad(x-z/6,y, x+z/6,y-w/4, x,y+w/4, x-z/6,y+w/6);
  }
  if(dh>0) { //right gill and pectoral
    strokeWeight(1);
    stroke(255,120,0);
    noFill();
    arc(x+z/6,y,z/6,w/2,PI/2,3*PI/2);
    noStroke();
    fill(255,175,75);
    quad(x+z/6,y, x-z/6,y-w/4, x,y+w/4, x+z/6,y+w/6);
  }
}
   
void fishEye(float x, float y, float z, float w) {
    if(dh<0) { //left eye
    strokeWeight(1);
    stroke(0);
    fill(255);
    ellipse(x-z/4,y-w/7,width/75,height/50);
    fill(0);
    ellipse(x-z/4,y-w/7,width/135,height/90);
  }
  if(dh>0) { //right eye
    strokeWeight(1);
    stroke(0);
    fill(255);
    ellipse(x+z/4,y-w/7,width/75,height/50);
    fill(0);
    ellipse(x+z/4,y-w/7,width/135,height/90);
    }
}
   
void moveFish() {
  h+=dh;
  k+=dk;
  if(h>width||h<0) {
    dh=-dh;
  }
  if(k>height||k<0){
    dk=-dk;
  }
}
   
void makeHook(float d,float e, float f) {
  stroke(155); //hook
  strokeWeight(5);
  noFill();
  arc(d-f/2,e,f,f,0,7*PI/6);
  line(d,e,d,e-f);
  strokeWeight(1);
  stroke(0); //line
  line(d,e-f,d,0);
}
   
void moveHook() {
  //start moving
  a+=s;
  b+=t;
  c=width/20;
  //control hook
  if((mouseX-pmouseX)>1) {
    s=3;
  }
  if((pmouseX-mouseX)>1) {
    s=-3;
  }
   
  if((mouseY-pmouseY)>1) {
    t=3;
  }
  if((pmouseY-mouseY)>1) {
    t=-3;
  }
  //wrap
  if(a>width){
    a=0;
    a+=s;
    score=0;
  }
  if(a<1){
    a=width;
    a+=s;
    score=0;
  }
  if(b>height){
    b=0;
    b+=t;
    score=0;
  }
  if(b<1) {
    b=height;
    b+=t;
    score=0;
  }
}


