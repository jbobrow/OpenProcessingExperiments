
int x,y,z;
int eSize;
int R,G,B,T;//色
int speed=5;
void setup(){
  z=0;
  size(500,500);
  smooth();
  background(z);
  noFill();
  noStroke();
  strokeWeight(2);
  
  eSize = 30;
  
  R=255;
  G=255;
  B=255;
  T=50;
}



void draw(){
  rect(mouseX,mouseY,eSize,eSize);
}

void mousePressed(){
  stroke(R,G,B,T);
  
}

void mouseReleased(){
  noFill();
  noStroke();
}
  
  
void keyPressed(){
//-------大きさ-------------------------  
 //細く 小
   if(key == CODED){
     if(keyCode == DOWN){
       if(eSize < 0){
         eSize = 0;
       }
       eSize --;
     }
   //細く　大
   if(keyCode == LEFT){
     if(eSize < 0){
       eSize = 0;
     }
     eSize -=5;
   }  
   //太く 小
   if(keyCode == UP){
     eSize ++;
   }
   //太く　大
   if(keyCode == RIGHT){
     eSize +=5;
   }
  }
    switch(key){
   //元の大きさ
   case'0':
   eSize=30;
   if(z == 0){
   R=255;
   G=255;
   B=255;
   }
   if(z==255){
     R=0;
     G=0;
     B=0;
   }
   println(0);
   break;

//----------色------------------------------   
   case'r':
   R=255;
   G= 23;
   B=23;
   break;
   
   case'g':
   R=23;
   G=255;
   B=23;
   break;
   
   case'b':
   R=23;
   G=23;
   B=255;
   break;
   
   case'y':
   R=255;
   G=244;
   B=23;
   break;
   
   case'c':
   R=23;
   G=234;
   B=255;
   break;
   
   case'p':
   R=255;
   G=23;
   B=240;
   break;
   
   case'R':

     
  if(z == 0){
     z= 255;   
   R=0;
   G=0;
   B=0;
 }
    else if(z == 255){
       z=0;
     R=255;
     G=255;
     B=255;
 }
       background(z);
       println(R);
       break;
       
   
   

    }
}


