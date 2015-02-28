
int x=100;
int y=100;
int syze=10;
int px, py;
boolean rightstuck=false;
boolean leftstuck=false;
boolean downstuck=false;
boolean upstuck=false;
int stuckdir=0;
int stuckcount=0;
int ssolvecount1=0;
int ssolvecount2=0;
int ssolvecount3=0;
int ssolvecount4=0;



void setup() {
  size(500, 500);
  background(0);
  smooth();
  frameRate(100);
}
/* rm numbers
 1 is right
 2 is down
 3 is left
 4 is up
 */



void draw() {
  px=x;
  py=y;


  //moving machine 
  rightstuck=true;
  leftstuck=true;
  downstuck=true;
  upstuck=true;
  float rm=random(1, 5);
  //------------------------------------------------------------------------------------------------ 

    if (int(rm)==1) {
      if (get(x+syze, y)==-16777216) {//the spot where its going
        if (get(x+syze, y-syze)==-16777216) {//the spot below where its going
          if (get(x+syze, y+syze)==-16777216) {//the spot above where its going
            if (get(x+syze*2, y)==-16777216) {//the spot 2 spots away from where its going
              if (get(x+syze*2, y+syze)==-16777216) {
                if (get(x+syze*2, y-syze)==-16777216) {
                  if (x+syze<width) {
                    x=x+syze;
                    rightstuck=false;
                    //        println("1 is bad");
                  }
                }
              }
            }
          }
        }
      }
    }
    //------------------------------------------------------------------------------------------------ 
    if (int(rm)==2) {
      if (get(x, y+syze)==-16777216) {
        if (get(x-syze, y+syze)==-16777216) {
          if (get(x+syze, y+syze)==-16777216) {
            if (get(x, y+syze*2)==-16777216) {
              if (get(x+syze, y+syze*2)==-16777216) {
                if (get(x-syze, y+syze*2)==-16777216) {
                  if (y+syze<width) {
                    y=y+syze;
                    downstuck=false;
                    //        println("2 is bad");
                  }
                }
              }
            }
          }
        }
      }
    }
    //------------------------------------------------------------------------------------------------ 
    if (int(rm)==3) {
      if (get(x-syze, y)==-16777216) {
        if (get(x-syze, y-syze)==-16777216) {
          if (get(x-syze, y+syze)==-16777216) {
            if (get(x-syze*2, y)==-16777216) {
              if (get(x-syze*2, y+syze)==-16777216) {
                if (get(x-syze*2, y-syze)==-16777216) {
                  if (x-syze>0) {
                    x=x-syze;
                    leftstuck=false;
                    //        println("3 is bad");
                  }
                }
              }
            }
          }
        }
      }
    }
    //------------------------------------------------------------------------------------------------ 
    if (int(rm)==4) {
      if (get(x, y-syze)==-16777216) {
        if (get(x-syze, y-syze)==-16777216) {
          if (get(x+syze, y-syze)==-16777216) {
            if (get(x, y-syze*2)==-16777216) {
              if (get(x+syze, y-syze*2)==-16777216) {
                if (get(x-syze, y-syze*2)==-16777216) {
                  if (y-syze>0) {
                    y=y-syze;
                    upstuck=false;
                    //        println("4 is bad");
                  }
                }
              }
            }
          }
        }
      }
    }
  
  //------------------------------------------------------------------------------------------------ 


  //stuck machine
  if (rightstuck==true && leftstuck==true && upstuck==true && downstuck==true) {
    stuckcount++;
  }
  else {
    stuckcount=0;
  }

  if (stuckcount>20) {
    println("stuck");


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++NEW MACHINE+++++++++++++++++++++NEW MACHINE++++++++++++++++++++++++++++++++++++++++++++++++++++++++NEW MACHINE
/*
1 is right
2 is left
3 is down
4 is up
*/

float stuckdir=random(1,5);
if(int(stuckdir)==1){
  if(get(x+syze,y)==-1){
    x=x+syze;
  }
}
if(int(stuckdir)==2){
  if(get(x-syze,y)==-1){
    x=x-syze;
  }
}
if(int(stuckdir)==3){
  if(get(x,y+syze)==-1){
    y=y+syze;
  }
}
if(int(stuckdir)==4){
  if(get(x,y-syze)==-1){
    y=y-syze;
  }
}
  }









//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++OLD MACHINE+++++++++++++++++++++OLD MACHINE++++++++++++++++++++++++++++++++++++++++++++++++++++++++OLD MACHINE
/*
    //looks to find which spot is white, and goes there
      if (get(x-syze, y)==-1) {
        if (ssolvecount1<0) {
          if (stuckdir==0) {
            stuckdir=1;//x-syze
            ssolvecount1=5;
          }
        }
      }
      if (get(x+syze, y)==-1) {
        if (ssolvecount2<0) {
          if (stuckdir==0) {
            stuckdir=2;//x+syze
            ssolvecount2=5;
          }
        }
      }
      if (get(x, y-syze)==-1) {
        if (ssolvecount3<0) {
          if (stuckdir==0) {
            stuckdir=3;//y-syze
            ssolvecount3=5;
          }
        }
      }
      if (get(x, y+syze)==-1) {
        if (ssolvecount4<0) {
          if (stuckdir==0) {
            stuckdir=4;//y+syze
            ssolvecount4=5;
          }
        }
      }
      
      ssolvecount1--;
      ssolvecount2--;
      ssolvecount3--;
      ssolvecount4--;
      


      if (stuckdir==1) {
        x=x-syze;
      }
      if (stuckdir==2) {
        x=x+syze;
      }
      if (stuckdir==3) {
        y=y-syze;
      }
      if (stuckdir==4) {
        y=y+syze;
      }
      stuckdir=0;
      
    }
    
  */




  noStroke();
  fill(255);
  rect(px, py, syze, syze);






  fill(255, 0, 0);
  rect(x, y, syze, syze);


  println(stuckcount);
  }


