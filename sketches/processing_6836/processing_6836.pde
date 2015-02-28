

float[][] snake = new float [2000][6];
PFont font;


int maxjoint=50,currentjoint=0,l=1,a = 0,s = 1,pn,in,points;
float angle=-PI/2,px=250,py=250,ps=20;
boolean[] keys = new boolean[4];
void setup(){
  smooth();
  size(400,400);
  frameRate(60);
  snake[0][1]=width/2;
  snake[0][2]=height-((l*25))-1;
  font = loadFont("SansSerif-20.vlw"); 
textFont(font, 20); 
}

void draw(){
  println(frameRate);

  background(255);
  update_snake();
  draw_snake();
  collision();
  room();
  if(keys[a] == true) {
    angle = angle-.08;
  }
  if(keys[s] == true) {
    angle = angle+.08;
  }
  keyCode=0;

  textAlign(CENTER);
    textFont(font, 10); 
    text("1.01",12,10);
    textFont(font, 20); 
  text(points, width/2, 20);
  if(pn>9){
    stroke(255);
    strokeWeight(3);
    line(width/2-20,(l*25),width/2+20,(l*25));
    strokeWeight(2);
    if(snake[0][1]>width/2-20&&snake[0][1]<width/2+20+3&&snake[0][2]<(l*25)+3){
      l++;
      pn=0;
      snake = new float [4000][6];
      maxjoint=100;
      currentjoint=0;
      snake[0][1]=width/2;
      snake[0][2]=height/2;
      ps=random(5,20);
      px=random((l*25)+ps,width-((l*25))-ps);
      py=random((l*25)+ps,height-((l*25))-ps);
    }


  }


  

  stroke(255);
  point(0,0);
    stroke(0);
  fill(0);
  ellipseMode(CENTER);
  ellipse(px,py,ps,ps);

}
void collision() {
  for(currentjoint=maxjoint; currentjoint>60; currentjoint--) {
    if(dist(int(snake[currentjoint][1]),int(snake[currentjoint][2]),int(snake[0][1]+1*cos(angle)),int(snake[0][2]+1*sin(angle)))<1.5){
      delay(1000);
      snake = new float [2000][6];
      maxjoint=100;
      currentjoint=0;
      in=0;
      l=1;
      ps=random(5,20);
      px=random((l*25)+ps,width-((l*25))-ps);
      py=random((l*25)+ps,height-((l*25))-ps);
      angle=-PI/2;
      snake[0][1]=width/2;
  snake[0][2]=height-((l*25))-1;
      pn=0;
      points=0;
    }
  }
}
void room(){
  noFill();
  rect((l*25),(l*25),width-(l*50),height-(l*50));
}
void update_snake(){
  for(currentjoint=maxjoint ; currentjoint>0 ; currentjoint--){
    snake[currentjoint][1]=snake[currentjoint-1][1];
    snake[currentjoint][2]=snake[currentjoint-1][2];
  }
  snake[0][1]=snake[0][1]+2*cos(angle);
  snake[0][2]=snake[0][2]+2*sin(angle); 
  if(snake[0][1]>(l*25)&&snake[0][1]<width-((l*25))&&snake[0][2]>(l*25)&&snake[0][2]<height-((l*25))){
    in=1;
  }
  else{
    delay(1000);
    snake = new float [2000][6];
    maxjoint=100;
    currentjoint=0;
    in=0;
    l=1;
    snake[0][1]=width/2;
    snake[0][2]=height-((l*25))-1;
    pn=0;
    ps=random(5,20);
    px=random((l*25)+ps,width-((l*25))-ps);
    py=random((l*25)+ps,height-((l*25))-ps);
    angle=-PI/2;
    points=0;
  }


  if(dist(snake[0][1],snake[0][2],px,py)<ps/2){
        maxjoint=maxjoint+3*int(ps);
    pn++;
    points=points+int(ps);
    if(pn<15){
    newpellet();
    }else{
      px=-20;
      py=-20;
      ps=1;
    }
  }
}

void draw_snake(){
  for(currentjoint=0 ; currentjoint<maxjoint+1 ; currentjoint++){
    strokeWeight(3);  
    point(snake[currentjoint][1],snake[currentjoint][2]);
  }
}

void keyPressed() {
  if(key == 'a') {
    keys[a] = true;
  } 
  else if(key == 's') {
    keys[s] = true;
  }
}
void keyReleased() {
  if(key == 'a') {
    keys[a] = false;
  }
  else if(key == 's') {
    keys[s] = false;
  }
}
void newpellet(){
      ps=random(5,20);
    px=random((l*25)+ps,width-((l*25))-ps);
    py=random((l*25)+ps,height-((l*25))-ps);
  
  
  
}

void reset(){
}



