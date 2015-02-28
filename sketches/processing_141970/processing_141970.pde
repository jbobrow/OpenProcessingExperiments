
p00int h=500;
int w=500;
float x=w/2;
int y=400;
float i=250;
float j=0;
float one=1;
int hi=400;
int l=0;
int g=0;

float score=(500-hi)+10*(10-l);
int time=0;
void setup(){
  size(w,h);
}
void draw(){
  background(0,200,255);
  if (j>y){
    j=0;
    if(abs(x-i)<=40){
      y-=10;
      g++;
    }else{
      y+=30;
      l++;
    }
    i=random(20,480);
  }
  if (y<hi){
    hi=y;
  }
  
  fill(0);
  strokeWeight(2);
  stroke(0,0,0,40);
  line(0,hi,500,hi);
  textSize(12);
  text((500-hi)/5,0,hi);
  text((500-y)/5,0,y);
  stroke(0);
  text("berries lost:",50,50);
  text(l,130,50);
  text("berries holding:",50,30);
  text(g,150,30);
  text(time,0,500);
  textSize(16);
  text("if you can get 50 berries before losing 10, you'll win the game",0,15);
  fill(255,0,0);
  ellipse(i,j,10,10);
 // translate(x,y);
  fill(200,255-5*g,102-2*g);
  strokeWeight(4);
  line(x-40,y,x+40,y);
  arc(x,y,80,30,0,PI);
  x=mouseX;
  j+=5*one;
  time+=one;
  score=sq(50-hi/10)+300*(10-l)+2*(3000-time);
  
  if (g>=50){
    winning();
  }
  
  if (l>=10){
    losing();
  }
}

void keyPressed(){
  //please do NOT use this key for cheating(pressing the key 'p')
  if (key=='p'){
    if (one==1){
      one=0;
    }else if(one==0){
      one=1;
    }
  }
  if (key=='w'){
    winning();
  }
  if (key=='l'){
    losing();
  }
  if (key=='r'){
    restart();
    }
}

void restart(){
      x=w/2;
      y=400;
      i=250;
      j=0;
      hi=400;
      l=0;
      g=0;
      time=0;
      one=1;
  }
  
  void losing(){
     background(0);
     fill(150,0,0);
     textSize(80);
     text("Game Over",30,275);
     textSize(20);
     fill(150);
     text("(press any key to try again)",200,300);
     one=0;
     if (mousePressed){
       restart();
     }
   }
   
   void star(){
  stroke(100);
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
  noFill();
}

void winning(){
  one=0;
  background(0);
  fill(0,150,0);
  textSize(80);
  text("YOU WON!!",30,275);
  textSize(20);
  fill(150);
  text("(press any key to try again)",200,300);
  fill(0,0,200);
  textSize(50);
  text("your score: ",20,180);
  text(score,300,180);
  fill(100);
  textSize(30);
  text("highest bonus",20,60);
  text("saved berries bonus",20,90);
  text("time bonus",20,120);
  text(sq(50-hi/10),370,60);
  text(300*(10-l),370,90);
  text(2*(3000-time),370,120);
  
  //first star
  pushMatrix();
  translate(w/2-100,h-100);
  if(score>=2000){
    fill(200,200,0);
  }else{
    noFill();
  }
  star();
  popMatrix();
  
  //second star
  pushMatrix();
  translate(w/2,h-100);
  if(score>=2500){
    fill(200,200,0);
  }
  star();
  popMatrix();
  
  //third star
  pushMatrix();
  translate(w/2+100,h-100);
  if(score>=3000){
    fill(200,200,0);
  }
  star();
  popMatrix();
  
  if (mousePressed){
    restart();
    }
  }
