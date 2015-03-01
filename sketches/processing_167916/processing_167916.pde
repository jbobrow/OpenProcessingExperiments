
final int spaceBetween = 20;
final int squareLength = 20;
final int spaceAround = 30;

final int squareNumber = 20;

final int boardHeight = (spaceAround*2) + squareLength;
final int boardLength = (((squareLength + spaceBetween)*squareNumber)-spaceBetween)+ (spaceAround)*2;

Walker w1;
Walker w2;
Walker w3;
Walker w4;
Walker w5;
Walker w6;
Walker w7;
Walker w8;
Walker w9;
Walker w10;

Walker w11;
Walker w12;
Walker w13;
Walker w14;
Walker w15;
Walker w16;
Walker w17;
Walker w18;
Walker w19;
Walker w20;


import processing.pdf.*;


void setup(){
  frameRate(10);
  size(boardLength,boardHeight);
  background(255);
  w1 = new Walker(1);
  w2 = new Walker(2);
  w3 = new Walker(3);
  w4 = new Walker(4);
  w5 = new Walker(5);
  w6 = new Walker(6);
  w7 = new Walker(7);
  w8 = new Walker(8);
  w9 = new Walker(9);
  w10 = new Walker(10);
  
  w11 = new Walker(11);
  w12 = new Walker(12);
  w13 = new Walker(13);
  w14 = new Walker(14);
  w15 = new Walker(15);
  w16 = new Walker(16);
  w17 = new Walker(17);
  w18 = new Walker(18);
  w19 = new Walker(19);
  w20 = new Walker(20);

  beginRecord(PDF, "everything.pdf");  
}

void draw(){
  
  w1.display();
  w1.step(100,5);
  w2.display();
  w2.step(100,10);
  w3.display();
  w3.step(100,15);
  w4.display();
  w4.step(100,20);
  w5.display();
  w5.step(100,25);
  
  w6.display();
  w6.step(100,30);
  w7.display();
  w7.step(100,35);
  w8.display();
  w8.step(100,40);
  w9.display();
  w9.step(100,45);
  w10.display();
  w10.step(100,50);
  
  w11.display();
  w11.step(100,55);
  w12.display();
  w12.step(100,60);
  w13.display();
  w13.step(100,65);
  w14.display();
  w14.step(100,70);
  w15.display();
  w15.step(100,75);
  
  w16.display();
  w16.step(100,80);
  w17.display();
  w17.step(100,85);
  w18.display();
  w18.step(100,90);
  w19.display();
  w19.step(100,95);
  w20.display();
  w20.step(100,100);

}

// when q is pressed, the prgramm stops running and a pdf of the drawing is saved
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
  int index;
 
  Walker(int index_){
    x = (spaceAround + (((squareLength + spaceBetween)*index_)-(squareLength + spaceBetween)));
    y = spaceAround;
    mode = 1;
    index = index_;
    
  }
  
  //with color
  void display(color c_){
    stroke(c_);
    point(x,y); 
  }
  //without color
  void display(){
    stroke(0);
    point(x,y); 
  }

  
  void step(int numberOfDraws, int numberOfWins){
     // here: its is a number drawn from 30 numbers. there are 9 numbers (30%) that mean a step in the right direction and 7 numbers for each of the remaining 3 wrong directions. 
     int tendencychoice = int(random(numberOfDraws));
     int secondDraw = int(random(3));
     int aiming = width/5;
     
     if( mode== 4 && y < ((spaceAround)+1) /*&& x < ((width/5)+aiming) && x > ((width/5)-aiming)*/ ){
       mode = 1;  
     } 
     
     if( mode == 1 && x > (     (spaceAround + ( ((squareLength + spaceBetween)*index)-spaceBetween) -1   )     ) /*&& y < ((height/5)+aiming) && y> ((height/5)-aiming)*/){
       mode = 2;  
     } 
     
     if( mode == 2 && y > ((spaceAround+squareLength)-1)  /*&& x < (((width/5)*2)+aiming) &&  x > (((width/5)*2)-aiming)*/ ){
       mode = 3;  
     } 
     
     if( mode == 3 && x < (( spaceAround + (   ((squareLength+spaceBetween)*index) - (squareLength+spaceBetween)    )) +1 ) /* && y < (((height/5)*2)+aiming) && y > (((height/5)*2)-aiming)*/ ){
       mode = 4;  
     } 
     
     
     
     if(mode==1){ 
       if(tendencychoice >= 0 && tendencychoice <= numberOfWins-1){ 
         x++;
       }else if(secondDraw == 0){
         y--;
       }else if(secondDraw == 1){
         y++; 
       }else if(secondDraw == 2){
         x--;        
       }
     }

     if(mode==2){
      if(tendencychoice >= 0 && tendencychoice <= numberOfWins-1){
         y++;
       }else if(secondDraw == 0){
         y--;
       }else if(secondDraw == 1){
         x++; 
       }else if(secondDraw == 2){
         x--;
       }
     }
     
     if(mode==3){
       if(tendencychoice >= 0 && tendencychoice <= numberOfWins-1){
         x--;
       }else if(secondDraw == 0){
         y--;
       }else if(secondDraw == 1){
         x++; 
       }else if(secondDraw == 2){
         y++;
       }
     }
     
     if(mode==4){
       if(tendencychoice >= 0 && tendencychoice <= numberOfWins-1){
         y--;
       }else if(secondDraw == 0){
         x--;
       }else if(secondDraw == 1){
         x++; 
       }else if(secondDraw == 2){
         y++;
       }
     }
     print(mode);
  }    
}




