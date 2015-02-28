
int x=0;
int lazermove=0;
int lazerbounce = 50;
int lazerbounce1 =30;
int lazerbounce2 =20;
int lazermover=0;
int lazermoverr=0;

void setup(){
  size(1000,600);
  background(0);
  frameRate(10);
 
}

void draw(){
  background(0);
  lazermove=lazermove+lazerbounce;
  
  lazermover=lazermover+lazerbounce1;
  lazermoverr=lazermoverr+lazerbounce2;
  
    if(lazermove>=500){
    lazerbounce=lazerbounce* -1;
    }
    if(lazermove<=0){
    lazerbounce=lazerbounce* -1;
    }
    
    
    if(lazermover>=550){
    lazerbounce1=lazerbounce1* -1;
    }
    if(lazermover<=0){
    lazerbounce1=lazerbounce1* -1;
    }
    if(lazermoverr>=580){
    lazerbounce2=lazerbounce2* -1;
    }
     if(lazermoverr<=0){
    lazerbounce2=lazerbounce2* -1;
    }
    
 
  while( x < width){
    fill(random(0,255),0,random(0,255),120);
    stroke(255,0,255);
    triangle (500,600,550+x,-10+lazermove,650+x,-10+lazermove);
    triangle (500,600,450-x,-10+lazermove,350-x,-10+lazermove);
    fill(0,random(0,255),random(0,255),140);
    stroke(0,255,255);
    triangle (550,600,650+x,-10+lazermover,750+x,-10+lazermover);
    triangle (450,600,350-x,-10+lazermover,250-x,-10+lazermover);
    x=x+150;
    fill(0,random(0,255),random(0,255),191);
    stroke(0,255,0);
    triangle (600,600,750+x,-10+lazermoverr,850+x,-10+lazermoverr);
    triangle (400,600,250-x,-10+lazermoverr,150-x,-10+lazermoverr);
    }
    
  x = 0;
  while(x < width){
    stroke(255,255,0);    
    line(350,600,-1000+x+lazermove*10,0);
    line(650,600,1000+x-lazermove*10,0);
    stroke(255,0,0);
    line(700,600,600-x+lazermover*5,0);
    line(300,600,400+x-lazermover*5,0);
    //stroke(255,random(0,255),0);
    //fill(255,random(100,255),0,150);
    //triangle(500,0,600+x,600-lazermove,630+x,600-lazermove);
    //triangle(500,0,400-x,600-lazermove,370-x,600-lazermove);
    x=x+80;
  }
x=0;


    
}


