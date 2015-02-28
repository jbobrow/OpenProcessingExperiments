
int T=30,score=0,i=12,j=17,life=1,t1=1,t2=1,t3=1,t4=1,mscore=2610;
int radius=T/2;
float x=T*i,y=15+T*j;
float speed=3;//0.5, 1, 1.5, 3 posible speeds
int directionx=-1,directiony=0;
PFont f,g; 
Ghost Akabei;//Declaration of Fucking Ghosts
Ghost Pinky;
Ghost Aosuke;
Ghost Guzuta;
color r= color(255,0,0);//Color of fucking Ghosts
color p= color(240,92,205);
color b= color(9,191,234);
color o= color(234,100,9);
int[][] myArray = {{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},{1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1},//Map
                    {1,0,1,1,1,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,1,0,1},{1,0,1,1,1,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,1,0,1},{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
                    {1,0,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,0,1},{1,0,1,1,1,1,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,1,1,1,1,0,1},{1,0,0,0,0,0,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,0,0,0,0,0,1},
                    {1,1,1,1,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,1,1,1,1},{5,5,5,5,5,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,0,1,5,5,5,5,5},{1,1,1,1,1,1,0,1,0,1,3,3,3,3,3,3,3,1,0,1,0,1,1,1,1,1,1},
                    {4,4,0,0,0,0,0,0,0,1,3,3,3,3,3,3,3,1,0,0,0,0,0,0,0,4,4},{1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1},{5,5,5,5,5,1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,1,5,5,5,5,5},
                    {1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1},{1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1},{1,0,1,1,1,1,0,1,1,1,1,1,0,1,0,1,1,1,1,1,0,1,1,1,1,0,1},
                    {1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1},{1,1,1,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,0,1,0,1,0,1,1,1,1},{1,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,1},
                    {1,0,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,1,0,1},{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1},{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}};
void setup() {
  size(27*T,24*T);
  smooth();
  ellipseMode(RADIUS);
  f=loadFont("ComicSansMS-48.vlw");//Font
  g=loadFont("Boopee-Bold-48.vlw");
  Akabei = new Ghost();
  Pinky = new Ghost();
  Aosuke = new Ghost();
  Guzuta = new Ghost();
}

void draw() {
  noStroke();
  background(0);
  int k,l;
 
  
  for(k=0;k<23;k++){                            //Drawing Map
     for(l=0;l<27;l++){  
       if(myArray[k][l] == 1){
         fill(0,0,204);
         rect(T*l, T*k, T, T);
       }else if(myArray[k][l] == 0){
               fill(255,255,0); 
               ellipse(15+T*l, 15+T*k, T/6, T/6); 
       }
    } 
  }
if(life==1){
  x += speed * directionx;//x & y position
  y += speed * directiony;
  if((x==Akabei.Posx() && y==Akabei.Posy())||(x==Pinky.Posx() && y==Pinky.Posy())||(x==Aosuke.Posx() && y==Aosuke.Posy())||(x==Guzuta.Posx() && y==Guzuta.Posy()))life=0;
  if(score==mscore)life=2;
  j=floor((x)/T);//i & j subscripts of map
  i=floor((y)/T);
  if(myArray[i][j]==0 && x==15+T*j && y==15+T*i){//Score
     myArray[i][j]=2;
     score=score+10;  
  }
  if(j==1 && x==T+T/2 && i==11){//Dimensional Gate
    x=25*T+15;
    directionx=-1;
  }  
  if(j==25 && x==25*T+T/2 && i==11){
    x=T+T/2;
    directionx=1;
  } 
  println("i="+i+' '+"j="+j+' '+myArray[i][j]+" DOWN="+myArray[i+1][j]+" UP="+myArray[i-1][j]+" LEFT="+myArray[i][j-1]+" RIGHT="+myArray[i][j+1]);
  //Direction
  if(keyPressed && (key == CODED)){
    if(keyCode == LEFT && ((y-T/2)%T==0) && myArray[i][j-1]!=1){
       directionx=-1;
       directiony=0;
    }
    else if(keyCode == RIGHT && ((y-T/2)%T==0) && myArray[i][j+1]!=1){
             directionx=1;
             directiony=0;
    } 
    else if(keyCode == UP && ((x-T/2)%T==0) && myArray[i-1][j]!=1){
         directiony=-1;
         directionx=0;
    }  
    else if (keyCode == DOWN && ((x-T/2)%T==0) && myArray[i+1][j]!=1){
         directiony = 1;
         directionx = 0;
    }
  } 
  if(myArray[i][j-1]==1 && x==T/2+T*j && directionx==-1) {
    directionx = 1;
    directiony = 0;
  }
  if(myArray[i][j+1]==1 && x==T/2+T*j && directionx==1) {
    directionx = -1;
    directiony = 0;
  }
  if(myArray[i-1][j]==1 && y==T/2+T*i && directiony==-1) {
    directionx=0;
    directiony=1;
  }
  if(myArray[i+1][j]==1 && y==T/2+T*i && directiony==1){
    directionx=0;
    directiony=-1;
  }
  //Drawing face
  if (directionx == 1){
    fill(250,150,50);
    arc(x, y, radius, radius, PI/4, 7*PI/4);
  } else if(directionx == -1){
         fill(250,150,50);
         arc(x, y, radius, radius, -3*PI/4, 3*PI/4); 
  }else if(directiony == 1){ 
         fill(250,150,50);  
         arc(x, y, radius, radius, 3*PI/4,9*PI/4);
  }else if(directiony == -1){
         fill(250,150,50);
         arc(x, y, radius, radius, -PI/4, 5*PI/4); 
  } 
//Fucking Ghosts  
  if(score==0   && t1==1){
    t1=0;
    Akabei.Combat();
  }
  if(score==250 && t2==1){
    Pinky.Combat();
    t2=0;
  }
  if(score==500 && t3==1){
    Aosuke.Combat();
    t3=0;
  }
  if(score==750 && t4==1){
    Guzuta.Combat();
    t4=0;
  }
  Akabei.Pos();
  Akabei.DG();
  Akabei.Direction(Akabei.Posx(),Akabei.Posy());
  Akabei.Appear(Akabei.Posx(),Akabei.Posy(),r);
  
  Pinky.Pos();
  Pinky.DG();
  Pinky.Direction(Pinky.Posx(),Pinky.Posy());
  Pinky.Appear(Pinky.Posx(),Pinky.Posy(),p);
  
  Aosuke.Pos();
  Aosuke.DG();
  Aosuke.Direction(Aosuke.Posx(),Aosuke.Posy());
  Aosuke.Appear(Aosuke.Posx(),Aosuke.Posy(),b);
  
  Guzuta.Pos();
  Guzuta.DG();
  Guzuta.Direction(Guzuta.Posx(),Guzuta.Posy());
  Guzuta.Appear(Guzuta.Posx(),Guzuta.Posy(),o);
  
  //Text
  textFont(f,T/2+1);    
  fill(255,255,0); 
  text("Score: "+score,T/3,23*T+2*T/3);
  textFont(g,2*T/3);
  text("The Maelstrom",23*T,23*T+2*T/3);
  textFont(f,T/3);
  fill(int(random(255)),int(random(255)),int(random(255)));
  text("Dimensional"+'\n'+"      Gate   ",T/5,11*T+T/3);
  text("Dimensional"+'\n'+"      Gate   ",24*T+0.9*T,11*T+T/3); 
  
}else if(life==0){
     textFont(f,2*T);    
     fill(27,242,212);
     text("GAME"+'\n'+"OVER"+'\n'+"NOOB!",11*T-T/6,8*T+T/6);
     textFont(f,T/2+1);
     text("Score: "+score,T/3,23*T+2*T/3);
     textFont(g,2*T/3);
     text("The Maelstrom",23*T,23*T+2*T/3);  
 }else if(life==2){
     textFont(f,2*T);    
     fill(int(random(255)),int(random(255)),int(random(255)));
     text(" YOU"+'\n'+"WIN!",11*T,10*T);
     textFont(f,T/2+1);
     text("Score: "+score,T/3,23*T+2*T/3);
     textFont(g,2*T/3);
     text("The Maelstrom",23*T,23*T+2*T/3);
 }
}

 class Ghost{//Class: Fucking Ghosts
      float x11,y11; 
      int d1x,d1y,i1=13,j1=11;  
      Ghost(){//Constructor
           int ini=int(random(2));
           x11=15+T*i1;           
           y11=15+T*j1;
           d1y=0;
           if(ini==0)d1x=1;
           else d1x=-1;
        }
     void Combat(){//Go to map!
          int start=int(random(2));
          i1=13;
          j1=8;
          x11=15+T*i1;           
          y11=15+T*j1;
          d1y=0;
          if(start==0)d1x=1;
          else d1x=-1;
     }   
     void Pos(){//Position
         x11 += d1x * speed; 
         y11 += d1y * speed;
         j1=floor((x11)/T);//i1 & j1 subscripts of fucking Ghost in the map
         i1=floor((y11)/T);
     }  
     float Posx(){
       return(x11);
     }
     float Posy(){
       return(y11);
     } 
  void DG(){//Dimensional Gate
    int i2,j2;
    j2=floor((x11)/T);
    i2=floor((y11)/T);
    if(j2==1 && x11==3*T/2 && i2==11){
      x11=25*T+T/2;
      d1x=-1;
    }  
    if(j2==25 && x11==25*T+T/2 && i2==11){
      x11=3*T/2;
      d1x=1;
    }
  }  
  void Appear(float x2,float y2, color c){//Drawing Fucking Ghost
      beginShape();       
      noStroke();
      fill(c);
      arc(x2,y2,radius,radius,-PI,0);
      rect(x2-radius,y2,T,T/3);
      arc(x2-T/3,y2+T/3,T/6,T/6,0,PI);
      arc(x2,y2+T/3,T/6,T/6,0,PI);
      arc(x2+T/3,y2+T/3,T/6,T/6,0,PI);
      endShape();
  } 
  void Direction(float x1, float y1){//Contol Sructure
      int U1,D1,L1,R1,dir;
      j1=floor((x1)/T);
      i1=floor((y1)/T); 
      U1=myArray[i1-1][j1];
      D1=myArray[i1+1][j1];
      L1=myArray[i1][j1-1];
      R1=myArray[i1][j1+1];

    if((d1x==1 || d1y==-1) && U1==1 && R1==1 && x1==T*j1+T/2 && y1==T*i1+T/2){//1
      dir=int(random(2));
      if(dir==0){
        d1x=-1;
        d1y=0;
      }
      if(dir==1){
        d1x=0;
        d1y=1;
      }
    }
    if((d1x==-1 || d1y==-1) && U1==1 && L1==1 && x1==T*j1+T/2 && y1==T*i1+T/2){//2
      dir=int(random(2));
      if(dir==0){
        d1x=1;
        d1y=0;
      }
      if(dir==1){
        d1x=0;
        d1y=1;
      }     
    } 
    if((d1x==-1 || d1y==1) && D1==1 && L1==1 && x1==T*j1+T/2 && y1==T*i1+T/2){//3
      dir=int(random(2));
      if(dir==0){
        d1x=1;
        d1y=0;
      }
      if(dir==1){
        d1x=0;
        d1y=-1;
      } 
    }  
    if((d1x==1 || d1y==1) && D1==1 && R1==1 && x1==T*j1+T/2 && y1==T*i1+T/2){//4
      dir=int(random(2));
      if(dir==0){
        d1x=-1;
        d1y=0;
      }
      if(dir==1){
        d1x=0;
        d1y=-1;
      }  
    }
  
    if(U1!=1 && L1!=1 && D1!=1 && x1==T*j1+T/2 && y1==T*i1+T/2 && R1==1){//1'
      if(d1y==1||d1y==-1){
        dir=int(random(2));
        if(dir==1){
          d1x=-1;
          d1y=0;
        }
      }
      if(d1x==1){
        dir=int(random(3));
        if(dir==0){
          d1y=-1;
          d1x=0;
        }  
        if(dir==1){
          d1y=1;
          d1x=0;
        }
        else d1x=-d1x;  
      }
    }
    if(D1!=1 && L1!=1 && R1!=1 && x1==T*j1+T/2 && y1==T*i1+T/2 && U1==1){//2'
      if(d1x==1||d1x==-1){
        dir=int(random(2));
        if(dir==1){
          d1x=0;
          d1y=1;
        }
      }
      if(d1y==-1){
        dir=int(random(3));
        if(dir==0){
          d1y=0;
          d1x=1;
        }  
        if(dir==1){
          d1y=0; 
          d1x=-1;
        }
        else d1y=-d1y;  
      }
    }  
    if(D1!=1 && U1!=1 && R1!=1 && x1==T*j1+T/2 && y1==T*i1+T/2 && L1==1){//3'
      if(d1y==1||d1y==-1){
        dir=int(random(2));
        if(dir==1){
          d1x=1;
          d1y=0;
        }
      }
      if(d1x==-1){
        dir=int(random(3));
        if(dir==0){
          d1y=-1;
          d1x=0;
        }  
        if(dir==1){
          d1y=1;
          d1x=0;
        }
        else d1x=-d1x;  
      }
    } 
    if(U1!=1 && L1!=1 && R1!=1 && x1==T*j1+T/2 && y1==T*i1+T/2 && D1==1){//4'
      if(d1x==1||d1x==-1){
        dir=int(random(2));
        if(dir==1){
          d1x=0;
          d1y=-1;
        }
      }
      if(d1y==1){
        dir=int(random(3));
        if(dir==0){
          d1y=0;
          d1x=1;
        }  
        if(dir==1){
          d1y=0;
          d1x=-1;
        }
        else d1y=-d1y;  
      }
    }
    if(U1!=1 && D1!=1 && L1!=1 && R1!=1 && x1==T*j1+T/2 && y1==T*i1+T/2){
      if(d1y==1 || d1y==-1){
        dir=int(random(3));
        if(dir==1){
          d1x=1;
          d1y=0;
        }
        if(dir==2){
          d1x=-1;
          d1y=0;
        }
      }
      if(d1x==1 || d1x==-1){
        dir=int(random(3));
        if(dir==1){
          d1x=0;
          d1y=1;
        }
        if(dir==2){
          d1x=0;
          d1y=-1;
        }
      }  
    }  
  }
 }
 
  
  

