
int x=120;
int y=250;
int m=10; //var for move the mouth
int speedx=3;
int speedy=3;



void setup (){
  size (400,400);
  smooth();
  }
void draw(){
  background(200);
  fill(255);
  ellipse(120,250, 120,50);
  ellipse(290,250, 120,50);
  fill(0);
  ellipse(200,350, 200,40);
  fill(200);
  ellipse(200,350-m, 200,40);
  noStroke();
  
  if (mousePressed){
     m=-10;
     fill(255,0,0);
     if (y>240){
        if (mouseX< height/2){
          x=120;
          y=y-speedy;
        }
    }
    if (y<260){
        if (mouseX> height/2){
        x=120;
        speedx=0;
        y=y+speedy;
        }
     }
  }
  else{
     fill(0);
     m=10;
     y=250;
     speedx=3;
     }
     
  ellipse(x,y, 30,30);
  ellipse(x+170,y, 30,30);
  if (x>80){
     if (mouseX< height/2){
     x=x-speedx;
     }
  }
 if (x<160){
     if (mouseX> height/2){
     x=x+speedx;
     }

 }
}          
                
