

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;
 
 
 Minim m;
AudioSample kick;
AudioSample pop;
AudioSample cling;



 
float ballX, ballY; 
float difX, difY; 
float friction = 0.01; 
boolean capt = false; 
float bounce = 1;
  boolean bUp = true;
  boolean ran = false;
  float ranX = 0;
  float ranY = 0;
  float panage = 0;
  
  float shapesel = 0;
  float stx = 0;
  float sty = 0;
  float endx = 0;
  float endy = 0;
    float stxc = 0;
    float styc = 0;
    float endxc = 0;
    float endyc = 0;
    
    
  ArrayList<Float> xC;
  ArrayList<Float> yC;
  ArrayList<Boolean> xSel;
  ArrayList<Boolean> ySel;
  int seg = 20;
    

  
 
void setup(){
  size(500, 500);
  background(230);
  int i = 0;
  int n = 0;
  
  xC = new ArrayList();
  yC = new ArrayList();

  while( i < seg+1){
   float segx = (width/seg) * i;
   float segy = (height/seg) * i;
   xC.add(segx);
   yC.add(segy);
  i++;
  
  }
  xSel = new ArrayList();
  ySel = new ArrayList();

  while( n < seg+1){
   boolean selx = false;
   boolean sely = false;
   xSel.add(selx);
   ySel.add(sely);
  n++;
  
  }
   
  
    m = new Minim(this);
  kick = m.loadSample("two-pop.wav",2048);
  if (kick == null)println("didnt load");
  
  pop = m.loadSample("bottle_pop_3.wav",2048);
  if (pop == null)println("didnt load");
  
   cling = m.loadSample("cling_1.wav",2048);
  if (cling == null)println("didnt load");
  
  

  ballX  = width/2;
  ballY  = height/2;
   
 // noCursor();
  smooth();
}
 
void draw(){
   
  //background(255);
 int k = 0;
 int L = 0;
 int colour = 0;
 int D = 0;
 int d = 0;


 

  while ( k < seg){
    L = 0;
    
    while(L < seg){
      if (xSel.get(L) && ySel.get(k)){
        fill(255); 
        
      }else{
        fill(0);
        
      }
    // rect(xC.get(L), yC.get(k), width/seg,height/seg);
     L++; 
    }
    
    k ++;
  } 
  
  fill(255, 100);
  if (shapesel == 1){
    rectb(stx,sty,endx,endy);
       // line (stxc+D, styc+D-d, width, mouseX); 
    // line ( width-D, d,height- stxc+D, width-styc+D-d);
    
    
  }
  
  if (shapesel == 2){
    strokeWeight(1);
    stroke(255,0,0,100);
    recta(stxc,styc,endxc,endyc);
 
   if (endxc < 0){
     for (int h = 0; h < 30; h++){
        //line (stxc+D, styc, width, d);\
         //      line (stxc+D, styc+D-d, width, d); 
       //  line ( width-D, d,height- stxc+D, width-styc+D-d);  
       d += height/30;
       D += endyc/0;
     }
   }
   if (endxc > 0){
     for (int g = 0; g < 20; g++){
       // line (stxc+D, styc+D-d, width, d); 
       //  line ( width, d,height- stxc+D, styc+D-d); 
       d += height/20;
       D += endyc/20;
     }
   }
  }

  if (!ran){
    difX = mouseX - ballX;
    difY = mouseY - ballY;
  }else{ 
    difX = ranX - ballX;
    difY = ranY - ballY;
  }
   

  ballX += difX * friction;
  ballY += difY * friction;
 

  panage = (ballX/width)*200-100;
  if (panage > 25 || panage < -25){
    kick.setPan(panage);
  }else {
     kick.setPan(0); 
  }
  
 
    
  ball(ballX, ballY);
  
  
   

  stroke(0);
  noFill();
  //ellipse(mouseX, mouseY, 20, 20);
}
 
void ball(float x, float y){
  
  noStroke();
   
// Clac the dist between ball and mouse
  float d = dist(ballX, ballY, mouseX, mouseY);
  if (ran){
    d = dist(ballX, ballY, ranX, ranY);
  }
 
 //Bounce lower when close to mouse
  if (bUp){
    bounce +=(30*friction);
  }else{
    bounce -=(30*friction);
  }
  if (bounce >= d/15){
    bUp = false;
  }
  if (bounce <= 1 && bUp == false){
    bUp = true;
     
    
    if (d > 20){
      
      
      ////////// Play when in rect////////////////////////////
      if (endx>0 && shapesel == 1){
          if (endy>0){
              if (ballX > stx && ballX < stx+endx && ballY > sty && ballY < sty+endy){
                  pop.trigger();
              }else{
              kick.trigger();
              }
          }else if (endy<0){
              if (ballX > stx && ballX < stx+endx && ballY < sty && ballY > sty+endy){
                  pop.trigger();
              }else{
              kick.trigger();
              }
          }
      }else if (endx<0 && shapesel == 1){
         if (endy>0){
             if (ballX < stx && ballX > stx+endx && ballY > sty && ballY < sty+endy){
                pop.trigger();
             }else{
              kick.trigger();
              }
         }else if (endy<0){
             if (ballX < stx && ballX > stx+endx && ballY < sty && ballY > sty+endy){
                pop.trigger();
            }else{
              kick.trigger();
              }
        }
        
        //////////// sound in circle
      }else if (endxc>0 && shapesel == 2){
          if (endy>0){
              if (ballX > stxc && ballX < stxc+endxc && ballY > styc && ballY < styc+endyc){
                  cling.trigger();
              }else{
              kick.trigger();
              }
          }else if (endyc<0){
              if (ballX > stxc && ballX < stxc+endxc && ballY < styc && ballY > styc+endyc){
                  cling.trigger();
              }else{
              kick.trigger();
              }
          }
      }else if (endxc<0 && shapesel == 2){
         if (endyc>0){
             if (ballX < stxc && ballX > stxc+endxc && ballY > styc && ballY < styc+endyc){
                cling.trigger();
             }else{
              kick.trigger();
              }
         }else if (endyc<0){
             if (ballX > stxc && ballX > stxc+endxc && ballY < styc && ballY > styc+endyc){
                cling.trigger();
            }else{
              kick.trigger();
              }
        }
      }else if (d>20){
        kick.trigger();
      }
      
       kick.trigger();
  
      }
  }
  
  
  
  
  // mouse follow and capture
  if(d < 1){
  capt = true;
  }

  
  fill(255);
  ellipse(x+bounce*2, y+bounce*2, 10+bounce, 10 +bounce ); 
  fill(150);
  ellipse(x, y, 10+bounce, 10 +bounce );
  
 
  
}
 

void mouseClicked(){
 /*if (!ran){
   ran = true; 
   ranX = round(random(width));
   ranY = round(random(height));
 }else{
   ran = false;
 }*/
 
 
 
}
void mousePressed(){
  
    stx = mouseX;
    sty = mouseY;
     endx = 0;
    endy = 0;
   
    
    stxc = mouseX;
    styc = mouseX;
     endxc = 0;
    endyc = 0;

  if (shapesel== 2){
    shapesel = 0;
    
  }
  
  
  shapesel++;
  
}
 void mouseDragged(){
   if (shapesel == 1){
     endx =mouseX-stx;
     endy = mouseY-sty; 
   }
  if (shapesel == 2){
      endxc =mouseX-stxc;
      endyc = mouseY-styc; 
      rect(0,0,height, width);
  }
 }
 
 void recta(float sx,float sy,float ex,float ey){
     stroke (255,100);
   for (int f = 0; f < 10; f ++){
     line ( sx, sy+random(ey),sx+ex, sy+random(ey));
     
   }
   
 }
  void rectb(float sx,float sy,float ex,float ey){
    stroke (150,100);
    noFill();
   for (int f = 0; f < 10; f ++){
     bezier ( sx, sy+random(ey),sx-20,sy+random(ey),sx+ex+20,sy+random(ey),sx+ex, sy+random(ey));
     
   }
   
 }
 
 
void mouseMoved(){

 for (int i = 0; i < seg; i++){
   
   if ( mouseX >= xC.get(i) && mouseX <= xC.get(i+1)){
     if(!xSel.get(i)){ 
       xSel.set(i,true);
     }else{
       xSel.set(i,false);
     }
   }
 }
 for (int k = 0; k < seg; k++){
   
   if ( mouseY >= yC.get(k) && mouseY <= yC.get(k+1)){
     if(!ySel.get(k)){ 
       ySel.set(k,true);
     }else{
       ySel.set(k,false);
     }
           
   }
 }
 
 
}



void stop(){
  
  kick.close();
  pop.close();
  m.stop();
  super.stop();
}

