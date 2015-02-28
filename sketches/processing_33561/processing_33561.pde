
//Tian Xie
//N00201482
//Parade with for loop

int x = 0;
int y = 0;

void setup(){
  size(380,380);
  background(0);
  noStroke();
  smooth();
 }
 
void draw(){
//  PImage b;
//  b=loadImage("dolphin.jpg");
//  image(b,-100,0);
  for(int j = 0; j<10; j++ ){
    for(int i = 0; i<10; i++){
     
      ellipse(x+50*i,y+50*j,20+(x-30)*.2,20+(x-30)*.2);
    }
  }
  x++;
  y++;
  
  if(x>10 && x<300){
    fill(255,255,0);
     if(x>20 && x<350){ 
       fill(255,0,0);
        if(x>30 && x<400){
          fill(200,100,50);
           if(x>40 && x<450){
             fill(150,150,200);
              if(x>50 && x<500){
               fill(30,30,100);
                if(x>60 && x<550){
                  fill(70,80,90);
                   if(x>70 && x<600){
                     fill(10,100,200);
                      if(x>80 && x<650){
                        fill(90,120,180);
                         if(x>90 && x<700){
                           fill(20,60,90);
                            if(x>100 && x<750){
                            }else{
                              fill(0,0,0);
                            }
                         }
                      }
                   }
                }
              }
           }
        }
     }
  }
}
             

