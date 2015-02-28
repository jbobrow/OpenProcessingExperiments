
PImage jamesBrown;
PImage laser;
int x;
int y;
int directionx;
int directiony;
int X;
int Y;
int directionX;
int directionY;
int a;
int b;
int directiona;
int directionb;
int A;
int B;
int directionA;
int directionB;
float rectColor;
float ellColor;
float skyColor;
float sunColor;
float c,d,angle;
float gainc;
float gaind;

void setup(){
  size(800,600);
  smooth();
  
  c = 0;
  d = 0;
  angle = 0;
  frameRate(100000);
  gainc = c;
  gaind = d;
  
  x = 5;
  y = 5;
  directionx = 30;
  directiony = 30;
  X = 5;
  Y = 5;
  directionY = 3;
  directionX = 3;
  a = 5;
  b = 5;
  directiona = 40;
  directionb = 40;
  A = 5;
  B = 5;
  directionA = 100;
  directionB = 400;
  rectColor = random(30);
  laser = loadImage("S-PRC-0121 copy.jpg");
  jamesBrown = loadImage("jamesBrown.jpeg");
  ellipseMode(CENTER);
  rectMode(CENTER);
  noCursor();
  noStroke();
  
 // image(jamesBrown,mouseX,mouseY);
 fill(0);
 rect(30,800,20,100);
 frameRate(300);
 
 /*fill(14,36,9);
 ellipse(0,height,400,800);
  ellipse(width,height,400,800);
  */
 
 
 
}

void draw(){
 // background(0);

fill(0,1);
  rect(width/2,height/2,width,height);
  
  for( int i = 0; i < width; i += y){
     for( int j = 0; j < width; j += y){
     fill(255,i);
      //rect(i,j,5,5);
      
    
  
  x += directionx;
  y += directiony;
  
  if(x > (width-5)){
    directionx = -30;
    fill(255);
    }
      if(y > (height-5)){
        directiony = -30;
        fill(255);
      }
        if(x < 5){
          directionx = 30;
          fill(255);
        }
          if(y < 5){
            directiony = 30;
            fill(255);
          }
     }
           
     
       
    if(x == (mouseX+10)){
      directionx = 70;
      fill(random(255),random(255), random(255));
    }
       if(y == (mouseX+10)){
        directiony = 80;
        fill(random(255),random(255), random(255));
       }
        if(a == (mouseX+10)){
          directiona = 60;
            fill(random(255),random(255), random(255));
          }
             if(b == (mouseX+10)){
               directionb = 60;
                 fill(random(255),random(255), random(255));
            }
             ellipse(a,b,1,3);
             ellipse(a,b,1,3);
     
               
 for( int l = 0; l < width; l += X){
  // for(int m = 0; m < width; m += Y){
   
            
  X += directionY;
  Y += directionY;
  
  if(X > (width-5)){
    directionX = -3;
    fill(255);
    }
      if(Y > (height-5)){
        directionY = -2;
        fill(255);
      }
        if(X < 5){
          directionX = 5;
          fill(255);
        }
          if(Y < 5){
            directionY = 4;
            fill(255); 
          }
          
      //    ellipse(X,Y,5,1);
       //     ellipse(X,Y,1,5); 
   
   
     if(X == (mouseX+10)){
        directionX = 20;
        fill(rectColor);
      }
         if(Y == (mouseX+10)){
          directionY = 40;
          fill(rectColor);
        }    
          if( X == (mouseX+10)){
            directionX = 10;
            fill(rectColor);
          }
            if( Y == (mouseY+10)){
              directionY = 50;
              fill(rectColor);
            }
   }
 }
          
              //image(jamesBrown,mouseX,mouseY); 
             /* ellColor = map(a,0,width,0,255);{
                fill(0,10);
                rect(width/2,height/2,width,height);
                fill(107,210,33,30);
                //image(laser,mouseX,mouseY,20,20);   
                ellipse((mouseX),(mouseY),5,5); 
              } */
     if(mousePressed == true){  //------------------------------------night time
      noFill();
       rect(width/2,height/2,width,height);
       ellColor = map(a,0,width,0,255);{
                //fill(ellColor,1);
               // rect(width/2,height/2,width,height);
                fill(107,210,33,30);
                //image(laser,mouseX,mouseY,20,20);   
                ellipse((mouseX),(mouseY),5,5);  //-----------------laster green dot
                 frameRate(300);
                 fill(107,210,33,30);
                 strokeWeight(5);
                 line(width/2,height,mouseX,mouseY);  // --------------NOT WORKING, want to have laser beam!
         }
     }
       else{    //---------------------------------------------------day time
        // noLoop():
         fill(40,110,198);
       rect(width/2,height/2,width,height); 
         ellColor = map(c,0,width,0,100);{
                fill(0,10);
                rect(width/2,height/2,width,height);
                fill(107,210,33,30);  
                ellipse((mouseX),(mouseY),5,5); 
                 // fill(245,218,62);
                  frameRate(50);
                          c = cos(radians(angle)) * 500 + width/2;
                          d = sin(radians(angle)) * 500 + height;
                              fill(245,218,62,x);
                              ellipse(c,d,30,30);
                              fill(245,218,62,sunColor);
                              ellipse(c,d,50,50);
  
                              /* if (c < 20){
                                 fill(random(255));
                                }*/
  
                               gainc +=1;
                               gaind +=1;
                               angle ++;
                               
                                fill(40,110,skyColor,skyColor);
                                
                                sunColor = map(d,0,360,0,255);
                                skyColor = map(angle,0,360,0,100);
                               
                               skyColor += 100;
                                
                               
                                
                                
                              /*  if(c > 200){
                                  
                                  fill(255,ellColor);
                                   rect(width/2,height/2,width,height); 
                                }
                                
                                else{
                                   fill(40,110,198);
                                   rect(width/2,height/2,width,height);
                                } 
                                if(c < 290){
                                  
                                  fill(255,ellColor);
                                   rect(width/2,height/2,width,height); 
                                }
                                
                                else{
                                   fill(40,110,198);
                                   rect(width/2,height/2,width,height);
                                } 
                                */
                               
         
       } 
     
    
           
               //   rect((mouseX),(mouseY+20),10,20);
      
         /*    else{
               fill(255);
                ellipse(mouseX,mouseY,20,20);
                  rect((mouseX),(mouseY+20),10,20); 
         }
             
      */ 
  
  }
  
  for( int i = 0; i < width; i += a){
    
    rect(a,b,1,1);
  
        a += directiona;
        b += directionb;
  
          if(a > (width-5)){
            directiona = -70;
            fill(255);
          }
            if(b > (height-5)){
              directionb = -70;
              fill(255);
            }
              if(a < 5){
                directiona = 90;
                fill(255);
               }
                 if(b < 5){
                  directionb = 90;
                  fill(255);
                 }
  
        
      if(a == (mouseX+10)){
        directiona = 20;
        fill(rectColor);
      }
         if(b == (mouseX+10)){
          directionb = 50;
          fill(rectColor);
        }    
          if( a == mouseX){
            directiona = 10;
            fill(rectColor);
          }
            if( b == mouseY){
              directionb = 20;
              fill(rectColor);
            }
  }
  
  
  
   for( int i = 0; i < width; i += a){
    
    rect(a,b,1,1);
  
        A += directiona;
        B += directionb;
  
          if(A > (width-5)){
            directionA = -70;
            fill(255);
          }
            if(B > (height-5)){
              directionB = -70;
              fill(255);
            }
              if(A < 5){
                directionA = 90;
                fill(255);
               }
                 if(B < 5){
                  directionB = 90;
                  fill(255);
                 }
  
        
      if(A == (mouseX+10)){
        directionA = 20;
        fill(rectColor);
      }
         if(B == (mouseX+10)){
          directionB = 50;
          fill(rectColor);
        }    
          if( A == mouseX){
            directionA = 100;
            fill(rectColor);
          }
            if( B == mouseY){
              directionB = 200;
              fill(rectColor);
            }
  }
  
  
  

          
        
/*

  for(int k = 0; k < 600; k ++){
    for( int j = 0; j < 600; j ++){
     // if(a = (width-5){
      fill(255);
     }
    }
    */
     
    
  }

