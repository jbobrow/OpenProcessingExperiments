
int mode = 1;
int modex = 5;
int code = 9;
float d;
int x,y;
int x2,y2;
int x3,y3;
PImage WIN;
PImage EPICWIN;

void setup(){
  size(600,600);
  x = 150;
  y = 300;
  x2 = 300;
  y2 = 300;
  x3 = 450;
  y3 = 300;
  EPICWIN = loadImage("EPICWIN-01.png");
  WIN = loadImage("WIN-01.png");
  }

void draw(){
fill(255,7);
 rect(0,0,width,height);
 rect(8,8,584,585);
 strokeWeight(.5);
 fill(255);
 strokeWeight(.1);
 stroke(0);
 fill(0);
 if(mode == 1){
  rect(x,y-=3,20,20);
 } else if(mode == 2){
 rect(x-=3,y,20,20);
 } else if(mode == 3){
  rect(x,y+=3,20,20);
 } else if(mode == 4){
  rect(x+=3,y,20,20);
 } 
 fill(85);
 strokeWeight(.1);
 stroke(85);
  if(modex == 5){
  rect(x2,y2-=3,20,20);
 } else if(modex == 6){
 rect(x2-=3,y2,20,20);
 } else if(modex == 7){
   rect(x2,y2+=3,20,20);
 } else if(modex == 8){
   rect(x2+=3,y2,20,20);
 } 
 fill(150);
 strokeWeight(.1);
 stroke(150);
   if(code == 9){
  rect(x3,y3-=3,20,20);
 } else if(code == 10){
 rect(x3-=3,y3,20,20);
 } else if(code == 11){
   rect(x3,y3+=3,20,20);
 } else if(code == 12){
   rect(x3+=3,y3,20,20);
 } 

 if(y > 570){
    y-=3;
    }
    if(x > 570){
       x-=3;
      }
      if(y < 10){
        y+=3;
        }
        if(x < 10){
           x+=3;
          }
   
 if(y2 > 570){
    y2-=3;
  }
  if(x2 > 570){
       x2-=3;
   }
    if(y2 < 10){
       y2+=3;
    }
      if(x2 < 10){
        x2+=3;
      }
           
 if(y3 > 570){
    y3-=3;
  }
    if(x3 > 570){
       x3-=5;
     }
     if(y3 < 10){
        y3+=3;
       }
       if(x3 < 10){
          x3+=3;
         }
  if(x == x3 && x == x2 && y == y3 && y == y2){
       image(EPICWIN,0,0);
    } else if (dist(x,y,x2,y2) < 15 && dist(x2,y2,x3,y3) < 15){
      image(WIN,0,0);
        }
         
}
void keyPressed(){
  if(key== 'w'){
   mode = 1;
  }else if(key== 'a'){
    mode = 2;
  }else if(key == 's'){
    mode = 3;
  }else if(key == 'd'){
    mode = 4;
  }
   if(key== 'y'){
   modex = 5;
  }else if(key== 'g'){
    modex = 6;
  }else if(key == 'h'){
    modex = 7;
  }else if(key == 'j'){
    modex = 8;
  }
    if(key == CODED){
    }if (keyCode == UP){
          code = 9;
  }else if(keyCode == LEFT){
    code = 10;
  }else if(keyCode == DOWN){
    code = 11;
  }else if(keyCode == RIGHT){
    code = 12;
  }
}



