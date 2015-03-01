


Walker w;
Walker2 w2;
Walker3 w3;
Walker4 w4;

import processing.pdf.*;


void setup(){
  frameRate(100);
  size(600,600);
  background(255);
  w = new Walker();
  w2 = new Walker2();
  w3 = new Walker3();
  w4 = new Walker4();
  beginRecord(PDF, "everything.pdf");  
}

void draw(){
  
 w.display();
w.step();
w2.display();
w2.step();
w3.display();
w3.step();
w4.display();
w4.step();

}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}

class Walker {
  float x;
  float y;
  color c;
  int mode;
 
  Walker(){
    x = width/5;
    y = height/5;
    mode = 1;
  }
  
  void display(){
    stroke(c);
    point(x,y);
  }  
  void step(){
     // here: its is a number drawn from 30 numbers. there are 9 numbers (30%) that mean a step in the right direction and 7 numbers for each of the remaining 3 wrong directions. 
     int tendencychoice = int(random(30));
     int aiming = width/5;
     
     if( y < (height/5) && x < ((width/5)+aiming) && x > ((width/5)-aiming) ){
       mode = 1;  
     } 
     
     if( x > ((width/5)*2) && y < ((height/5)+aiming) && y> ((height/5)-aiming)){
       mode = 2;  
     } 
     
     if( y > ((height/5)*2)  && x < (((width/5)*2)+aiming) &&  x > (((width/5)*2)-aiming) ){
       mode = 3;  
     } 
     
     if( x < (width/5) && y < (((height/5)*2)+aiming) && y > (((height/5)*2)-aiming)){
       mode = 4;  
     } 
     
     
     
     if(mode==1){ 
       if(tendencychoice == 0 || tendencychoice == 1 || tendencychoice == 2 || tendencychoice == 3 || tendencychoice == 4 || tendencychoice == 5 || tendencychoice == 6){
         x--;
       }else if(tendencychoice == 7 || tendencychoice == 8 || tendencychoice == 10 || tendencychoice == 11 || tendencychoice == 12 || tendencychoice == 13 || tendencychoice == 14){
         y--;
       }else if(tendencychoice == 15 || tendencychoice == 16 || tendencychoice == 17 || tendencychoice == 18 || tendencychoice == 19 || tendencychoice == 20 || tendencychoice == 21){
         y++; 
       }else{
         x++;
       }
     }

     if(mode==2){
       if(tendencychoice == 0 || tendencychoice == 1 || tendencychoice == 2 || tendencychoice == 3 || tendencychoice == 4 || tendencychoice == 5 || tendencychoice == 6){
         x--;
       }else if(tendencychoice == 7 || tendencychoice == 8 || tendencychoice == 10 || tendencychoice == 11 || tendencychoice == 12 || tendencychoice == 13 || tendencychoice == 14){
         y--;
       }else if(tendencychoice == 15 || tendencychoice == 16 || tendencychoice == 17 || tendencychoice == 18 || tendencychoice == 19 || tendencychoice == 20 || tendencychoice == 21){
         x++; 
       }else{
         y++;
       }
     }
     
     if(mode==3){
       if(tendencychoice == 0 || tendencychoice == 1 || tendencychoice == 2 || tendencychoice == 3 || tendencychoice == 4 || tendencychoice == 5 || tendencychoice == 6){
         y++;
       }else if(tendencychoice == 7 || tendencychoice == 8 || tendencychoice == 10 || tendencychoice == 11 || tendencychoice == 12 || tendencychoice == 13 || tendencychoice == 14){
         y--;
       }else if(tendencychoice == 15 || tendencychoice == 16 || tendencychoice == 17 || tendencychoice == 18 || tendencychoice == 19 || tendencychoice == 20 || tendencychoice == 21){
         x++; 
       }else{
         x--;
       }
     }
     
     if(mode==4){
       if(tendencychoice == 0 || tendencychoice == 1 || tendencychoice == 2 || tendencychoice == 3 || tendencychoice == 4 || tendencychoice == 5 || tendencychoice == 6){
         y++;
       }else if(tendencychoice == 7 || tendencychoice == 8 || tendencychoice == 10 || tendencychoice == 11 || tendencychoice == 12 || tendencychoice == 13 || tendencychoice == 14){
         x--;
       }else if(tendencychoice == 15 || tendencychoice == 16 || tendencychoice == 17 || tendencychoice == 18 || tendencychoice == 19 || tendencychoice == 20 || tendencychoice == 21){
         x++; 
       }else{
         y--;
       }
     }
     print(mode);
  }    
}




class Walker2 {
  float x;
  float y;
  color c;
  int mode;
 
  Walker2(){
    x = (width/5)*3;
    y = height/5;
    mode = 1;
  }
  
  void display(){
    stroke(c);
    point(x,y);
  }  
  void step(){
     // here: its is a number drawn from 6 numbers. there are 3 numbers (60%) that mean a step in the right direction and 1 number for each of the remaining 3 wrong directions. 
     int tendencychoice = int(random(6));
     int aiming = width/5;
     
     if( y < (height/5) && x < (((width/5)*3)+aiming) && x > (((width/5)*3)-aiming) ){
       mode = 1;  
     } 
     
     if( x > ((width/5)*4) && y < ((height/5)+aiming) && y> ((height/5)-aiming)){
       mode = 2;  
     } 
     
     if( y > ((height/5)*2)  && x < (((width/5)*4)+aiming) &&  x > (((width/5)*4)-aiming) ){
       mode = 3;  
     } 
     
     if( x < ((width/5)*3) && y < (((height/5)*2)+aiming) && y > (((height/5)*2)-aiming)){
       mode = 4;  
     } 
     
     
     
      if(mode==1){ 
       if(tendencychoice == 0){
         x--;
       }else if(tendencychoice == 1){
         y--;
       }else if(tendencychoice == 2){
         y++; 
       }else{
         x++;
       }
     }

     if(mode==2){
       if(tendencychoice == 0){
         x--;
       }else if(tendencychoice == 1){
         y--;
       }else if(tendencychoice == 2){
         x++; 
       }else{
         y++;
       }
     }
     
     if(mode==3){
       if(tendencychoice == 0){
         y++;
       }else if(tendencychoice == 1){
         y--;
       }else if(tendencychoice == 2){
         x++; 
       }else{
         x--;
       }
     }
     
     if(mode==4){
       if(tendencychoice == 0){
         y++;
       }else if(tendencychoice == 1){
         x--;
       }else if(tendencychoice == 2){
         x++; 
       }else{
         y--;
       }
     }
     print(mode);
  }    
}

class Walker3 {
  float x;
  float y;
  color c;
  int mode;
 
  Walker3(){
    x = width/5;
    y = (height/5)*3;
    mode = 1;
  }
  
  void display(){
    stroke(c);
    point(x,y);
  }  
  void step(){
     // here: its is a number drawn from 10 numbers. there are 7 numbers (70%) that mean a step in the right direction and 1 number for each of the remaining 3 wrong directions. 
     int tendencychoice = int(random(10));
     int aiming = width/5;
     
     if( y < ((height/5)*3) && x < ((width/5)+aiming) && x > ((width/5)-aiming) ){
       mode = 1;  
     } 
     
     if( x > ((width/5)*2) && y < (((height/5)*3)+aiming) && y> (((height/5)*3)-aiming)){
       mode = 2;  
     } 
     
     if( y > ((height/5)*4)  && x < (((width/5)*2)+aiming) &&  x > (((width/5)*2)-aiming) ){
       mode = 3;  
     } 
     
     if( x < (width/5) && y < (((height/5)*4)+aiming) && y > (((height/5)*4)-aiming)){
       mode = 4;  
     } 
     
     
     
      if(mode==1){ 
       if(tendencychoice == 0){
         x--;
       }else if(tendencychoice == 1){
         y--;
       }else if(tendencychoice == 2){
         y++; 
       }else{
         x++;
       }
     }

     if(mode==2){
       if(tendencychoice == 0){
         x--;
       }else if(tendencychoice == 1){
         y--;
       }else if(tendencychoice == 2){
         x++; 
       }else{
         y++;
       }
     }
     
     if(mode==3){
       if(tendencychoice == 0){
         y++;
       }else if(tendencychoice == 1){
         y--;
       }else if(tendencychoice == 2){
         x++; 
       }else{
         x--;
       }
     }
     
     if(mode==4){
       if(tendencychoice == 0){
         y++;
       }else if(tendencychoice == 1){
         x--;
       }else if(tendencychoice == 2){
         x++; 
       }else{
         y--;
       }
     }
     print(mode);
  }    
}

class Walker4 {
  float x;
  float y;
  color c;
  int mode;
 
  Walker4(){
    x = (width/5)*3;
    y = (height/5)*3;
    mode = 1;
  }
  
  void display(){
    stroke(c);
    point(x,y);
  }  
  void step(){
     // here: its is a number drawn from 30 numbers. there are 27 numbers (90%) that mean a step in the right direction and 1 number for each of the remaining 3 wrong directions. 
     int tendencychoice = int(random(30));
     int aiming = width/5;
     
     if( y < ((height/5)*3) && x < (((width/5)*3)+aiming) && x > (((width/5)*3)-aiming) ){
       mode = 1;  
     } 
     
     if( x > ((width/5)*4) && y < (((height/5)*3)+aiming) && y> (((height/5)*3)-aiming)){
       mode = 2;  
     } 
     
     if( y > ((height/5)*4)  && x < (((width/5)*4)+aiming) &&  x > (((width/5)*4)-aiming) ){
       mode = 3;  
     } 
     
     if( x < ((width/5)*3) && y < (((height/5)*4)+aiming) && y > (((height/5)*4)-aiming)){
       mode = 4;  
     } 
     
     
     
      if(mode==1){ 
       if(tendencychoice == 0){
         x--;
       }else if(tendencychoice == 1){
         y--;
       }else if(tendencychoice == 2){
         y++; 
       }else{
         x++;
       }
     }

     if(mode==2){
       if(tendencychoice == 0){
         x--;
       }else if(tendencychoice == 1){
         y--;
       }else if(tendencychoice == 2){
         x++; 
       }else{
         y++;
       }
     }
     
     if(mode==3){
       if(tendencychoice == 0){
         y++;
       }else if(tendencychoice == 1){
         y--;
       }else if(tendencychoice == 2){
         x++; 
       }else{
         x--;
       }
     }
     
     if(mode==4){
       if(tendencychoice == 0){
         y++;
       }else if(tendencychoice == 1){
         x--;
       }else if(tendencychoice == 2){
         x++; 
       }else{
         y--;
       }
     }
     print(mode);
  }    
}


