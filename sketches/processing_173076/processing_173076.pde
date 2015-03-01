
PImage  ball, first, fingerpoint, racket, floor, bonusitem, die, end; 
float x=width/2,y=height/2;// ball
float disx, disy; //ball anim
float posx, posy; //ball loc
int start=1,play,dead,clear,item; //stages
int score=0,bonus=0,r=30,a=3; //given
int i; 


int itemX[] = new int [10];  
int itemY[] = new int [10];
void setup()
{
  size(600,600);
  smooth();
  noStroke();
reset();

//images
  ball = loadImage("ball.png");
  fingerpoint = loadImage("fingerpoint.png"); 
  first = loadImage("FIRST.png"); 
  racket = loadImage("racket.png"); 
  floor = loadImage("floor.png"); 
  bonusitem = loadImage("bonusitem.png"); 
  die = loadImage("die.png"); 
  end = loadImage("clear.png");
  textSize(30); 
}
 
void draw(){
  if(start==1){
    image(first,0,0); 
    image(fingerpoint,mouseX-40,mouseY-10); 
    fingerpoint.resize(100,175);
    if(mousePressed){
      if(dist (mouseX,mouseY,width/2,height/2)<75){
        play=1;
        start=0;
        reset();
      }
    }
  }
  if(play==1){  //play stage
    image(floor,0,0); 
    for(i=0; i<itemX.length; i++){//erase reps//

//scores//
      if(score==(i+1)*100 || score ==(i+1)*100+1){
        item+=i;
        if(item>=0){
          image(bonusitem,itemX[i]-25,itemY[i]-25);
          item=+i;
        }
        if(dist(mouseX,mouseY,itemX[i],itemY[i])<125){ 
          item=-(i+i);
          bonus+=30; 
          score+=1; 
        }
      }
    }
    text (score,width-160,height-50);//actual score
    text(bonus,width-55,height-20);//bonus scores
    
    
    
    //ball scores//
    bouncyball(); 
    if(r==30){ //score moment
      score+=10;
    }
    if(score>=300){ //winning//
      play=0;
      clear=1;
    }
  }
  if(dead==1){ //dead stage
    image(die,0,0);  
    text(score,width-160,height-50);
    text(bonus,width-55,height-20);// 
    image(fingerpoint,mouseX-40,mouseY-10); 
    if(mousePressed==true){
      if(dist (mouseX,mouseY,width/2,height/2)<75){//button thingy//
        dead=0;
        play=1;
        reset();
      }
    }
  }
  if(clear==1) { 
    image(end,0,0); 
    text(score,width-160,height-50); 
    text(bonus,width-55,height-20); 
    image(fingerpoint,mouseX-40,mouseY-10); 
    if(mousePressed==true){ 
      if(dist (mouseX,mouseY,width/2,height/2)<75){ //button again//
        clear=0;
        play=1;
        reset();
      }
    }
  }
}


//drawing the ball//
void bouncyball() { 
  disx=x-mouseX;//stup
  disy=y-mouseY; //stupy
  image(racket,mouseX-115,mouseY-100); 
  if(r>95 || r<30){ //constrain
    a*=-1; 
    r+=a; 
  }
  r+=a; 
  
  
  
  
  //bal anim
  if(r==30){
    x+=disx*0.177;
    y+=disy*0.177;
    posx=disx; 
    posy=disy;
     if(dist(x,y,mouseX,mouseY)>120){
score-=10;      
play=0;
      dead=1;
    }
  }
  else { //ball animation2//
    x+=posx*0.06; 
    y+=posy*0.06;
    }
    //fill(255);

    //fill(0);
    imageMode(CENTER);
    image(ball, x,y,r,r);
    imageMode(CORNER);
    
  }
void reset(){//gobackloop
  x=width/2;
  y=height/2;
  score=0;
  posx=0;
  posy=0;
  item=0;
  bonus=0;
        for (i=0 ; i < itemX.length ; i++) {
    itemX[i]=(int)random(25,width-25); 
    itemY[i]=(int)random(25,height-25);
  }
}



