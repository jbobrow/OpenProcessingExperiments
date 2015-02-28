
float x = 0;
float y = 0;
int state=0;
float xspeed = 1.5;
float yspeed = 1.5;
int xg=0;
int yg=0;

int growy=2;
int growx=2;
int stateg=0;

void setup(){

size(800,600);
//frameRate(5);

}

void draw(){
  background(0);
 
 noStroke();
 fill(255,200,255,200);
 

  
  xg=xg+growx;
  
  if (xg >= 200){
    growx=growx*-1;
  }
  if (xg <= -30){
    growx = growx *-1;
  }
  yg=yg+growy;
  
  if (yg >= 80){
    growy=growy*-1;
  }
  if (yg <= -30){
    growy = growy *-1;
  }
  
 
 
if (state == 0){
    x=x+xspeed;
    if (x > 80){
        x=80; 
        state=1;
      }
    } else if ( state == 1){
      y=y+yspeed;
      if (y > 80){
        y=80;
        state=2;
      }
    } else if ( state == 2){
      x=x-xspeed;
      if (x < 0){
        x=0;
        state=3;
      }
    }
     else if ( state == 3){
      y=y-yspeed;
      if (y < 0){
        y=0;
        state = 0;
      }
    }
    

      
        
 
      triangle(100+x,170+y,200+xg,130,250-xg,250);
      fill(255,50,255,200);
      triangle(100+x,170+y,250-xg,250,190+x,265+y);
      fill(255,80,255,200);
      triangle(200+xg,130,250-xg,250,270+x,180+y);
     fill(255,100,255,200);
      triangle(250-xg,250,270+x,180+y,410,170+yg);
      fill(255,150,255,200);
      triangle(250-xg,250,410,170+yg,350,420-yg);
      fill(255,200,255,200);
      triangle(350,420-yg,250-xg,250,300+x,380+y);
     fill(255,150,255,200);
      triangle(300+x,380+y,250-xg,250,220+x,450+y);
      fill(255,80,255,200);
      triangle(250-xg,250,220+x,450+y,190+x,265+y);
     fill(255,50,255,200);
      triangle(410,170+yg,350,420-yg,500+xg,270);
      fill(255,170,255,200);
      triangle(500+xg,270,410,170+yg,510-x,220-y);
      fill(255,120,255,200);
      triangle(510-x,220-y,500+xg,270,700-x,140-y);
      fill(255,60,255,200);
      triangle(700-x,140-y,500+xg,270,590-x,370-y);
     fill(255,240,255,200);
      triangle(590-x,370-y,500+xg,270,510+x,340+y);
     fill(255,110,255,200);
      triangle(510+x,340+y,500+xg,270,350,420-yg);
      fill(255,190,255,200);
      triangle(590-x,370-y,510+x,340+y,620-xg,500);
      fill(255,140,255,200);
      triangle(700-x,140-y,620-xg,500,590-x,370-y);
      
      
}


