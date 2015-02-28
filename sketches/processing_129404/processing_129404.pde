
int x=0;


void setup(){
  size(1000,600);
  background(0);
  noLoop();
}

void draw(){
 
  while( x < width){
    fill(255,0,255,120);
    stroke(255,0,255);
    triangle (500,600,550+x,-10,650+x,-10);
    triangle (500,600,450-x,-10,350-x,-10);
    fill(0,255,255,140);
    stroke(0,255,255);
    triangle (550,600,650+x,-10,750+x,-10);
    triangle (450,600,350-x,-10,250-x,-10);
    x=x+150;
    fill(0,255,0,191);
    stroke(0,255,0);
    triangle (600,600,750+x,-10,850+x,-10);
    triangle (400,600,250-x,-10,150-x,-10);
    }
    
  x = 0;
  while(x < width){
    stroke(255,255,0);    
    line(350,600,-1000+x,0);
    line(650,600,1000+x,0);
    stroke(255,0,0);
    line(700,600,600-x,0);
    line(300,600,400+x,0);
    stroke(255,255,144);
    fill(255,255,144,100);
    noStroke();
    triangle(500,0,600+x,600,630+x,600);
    triangle(500,0,400-x,600,370-x,600);
    x=x+80;
  }



    
}


