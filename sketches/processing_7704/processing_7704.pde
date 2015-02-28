


float[][] stars = new float[500][3];
float[][] asteroids = new float[20][6];
float[][] ships = new float[10][3];
float x=width/2;
float y=height/2;
float xv,yv,a,d,t,ssize=20,points;
int play,start=1,dead;
PFont font;


void setup(){
  size(500,500);

  reset();
  font=loadFont("Verdana-Bold-48.vlw");
  textFont(font,32);
  textAlign(CENTER);
  noStroke();
  frameRate(60);
  rectMode(CENTER);
}


void draw(){

  if(dead==1){
    text("DEAD",width/2,height/2);
    text("Click to play again",width/2,height/2+40);
    if(mousePressed==true){
      dead=0;
      play=1;
      reset();
    }



  }
  if(play==1){
    background(0);
    stars();
    ships();
    asteroids();
    blob();
    text(int(points),width/2,height-20);
    t++;
  }
  if(start==1){
    background(0);
    text("Space Blob",width/2,height/2);
    text("Click to play",width/2,height/2+40);
    if(mousePressed==true){
      play=1;
      start=0;
      reset();
    }

  }


}




void blob(){
  a=atan2(mouseY-y,mouseX-x);
  d=dist(mouseX,mouseY,x,y);

  x=x+sqrt(d)*cos(a)*.3;
  y=y+sqrt(d)*sin(a)*.3;
  fill(255);
  ellipse(x,y,ssize,ssize);



}


void stars(){
  for(int i=0; i<500;i++){
    stroke(255);
    strokeWeight(2-stars[i][2]/2);
    stars[i][1]=stars[i][1]+1/(stars[i][2]+1);
    if(stars[i][1]>height){
      stars[i][1]=0;
    }


    point(stars[i][0],stars[i][1]);

  }




}
void asteroids(){
  noStroke();
  for(int i=0; i<20;i++){
    pushMatrix();
    fill(100,60,30);

    translate(asteroids[i][0],asteroids[i][1]);
    rotate(asteroids[i][4]);
    beginShape();
    for(float r=0;r<TWO_PI;r=r+PI/8){
      vertex(asteroids[i][2]*cos(r),asteroids[i][2]*sin(r)); 


    }
    endShape(CLOSE);


    popMatrix();

    asteroids[i][1]=asteroids[i][1]+asteroids[i][3]+t/2400;
    if(asteroids[i][1]>height+25){
      asteroids[i][0]=random(0,500);
      asteroids[i][1]=-1500;
    }
    if(dist(asteroids[i][0],asteroids[i][1],x,y)<asteroids[i][2]+ssize/2){
      play=0;
      dead=1; 



    }

  }
}

void ships(){

  for(int i=0; i<10;i++){
    pushMatrix();
    translate(ships[i][0],ships[i][1]);
    rotate(-PI/2);
        fill(200);
    triangle(-5,0,5,0,0,15);
    popMatrix();

    ships[i][0]=ships[i][0]+1;
    if(ships[i][0]>width+25){
      ships[i][0]=-1500;
      ships[i][1]=random(0,height);
    }
    if(dist(ships[i][0],ships[i][1],x,y)<ssize/2){
      ships[i][0]=-1500;
      ships[i][1]=random(0,height);
      ssize=ssize+1;
      points+=10;
    }

  }


}


void reset(){

  for(int i=0; i<500;i++){
    stars[i][0]=random(width);
    stars[i][1]=random(height);
    stars[i][2]=random(0,3);
    smooth();
  }
  for(int i=0; i<20;i++){

    asteroids[i][0]=random(0,500);
    asteroids[i][1]=random(-1500,-300);
    asteroids[i][2]=random(15,25);//size
    asteroids[i][3]=random(.5,1.5);//speed
    asteroids[i][4]=random(0,TWO_PI);//angle

  }
  for(int i=0 ;i<10;i++){

    ships[i][0]=random(-1500,-300);
    ;
    ships[i][1]=random(0,height);






  }


  x=width/2;
  y=height/2;
  t=0;
  ssize=20;
  points=0;







}



