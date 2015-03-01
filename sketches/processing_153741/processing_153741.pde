
float x=200;
float y=300;
float ys;
float ya=.5;
float ysmax=-10;
float i;
float r=250;
float a=500;
float as=5;
int score;
int tall=50;
int wide=10;
//extra
int c=0;
void setup(){
  size(600,600);
  rectMode(CORNERS);
}
void draw(){
  background(50,150,250);
  fill(875);
  ellipse(300,50,500,150);
  ellipse(200,100,200,100);
  ellipse(300,70,70,25);
  ellipse(500,100,200,75);
  fill(0,150,0);
  rect(0,450,600,600);
  
  //c=20;
  //ellipse(x,y,40,30);
  y+=ys;
  ys+=ya;
  //egg effect
  pushMatrix();
  translate(500-a,y);
  rotate(ys/10);
  //ball*2
  fill(256,170,100);
  //ellipse(0,0,tall,wide);
  //ellipse(-20,-7,20,c);
  //ellipse(-20,7,20,c);
  
  fill(100+c*10,100,100);
  ellipse(0,0,15+c,10+c);
  popMatrix();
  //logic of air
  if(ys<=ysmax){
    ys=ysmax;
  }
  //block
  fill(200,100,50);
  i+=1;
  a-=as;
  rect(a,0,a+50,r);
    rect(a,r+100,a+50,600);
    //another block ahead
  if(a==0){
    //range of block hole change a block whenever it touch x=0
    r=random(75,350);
    rect(a,0,a+50,r);
    rect(a,r+100,a+50,600);
    a=500;
    i=0;
    tall=50;
    wide=10;
    c=1;
  }
  fill(0,200,0);
  rect(0,550,600,600);
  if(y>=550){
    score=0;
    c=0;
    y=100;
    ys=0;
    as=5;
    a=500;
  }
  
  
//   if (mousePressed){
//  ys=-10;
//   }
   fill(0);
   textSize(20);
   text("score=",20,20);
   text(score,90,20);
   
   //losing the game
   //in
   if((a>=250)&&(a<=260)&&(y>=r)&&(y<=r+100)){
     score++;
     c+=5;
   //miss
   }else if((a==250)&&(y<=r)||(a==250)&&(y>=r+100)){
     score=0;
     c=0;
     tall=25;
     wide=15;
    // ys=0;
     as=0;
   }
}
void mousePressed(){
  ys=-10;
}


