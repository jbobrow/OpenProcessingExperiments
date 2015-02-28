
float myNum; //declare variable
float myNum2;
float myNum3;
int y = 0;
int x = 0;
int dir = 1;

void setup(){
  smooth();
    size(800, 600);
    myNum = 0;
    myNum2 = 1;
    myNum3 = 1;

}

void draw(){
   myNum2++;
    background(247, myNum2, 247);
    if (myNum2 > 250){
      myNum2 = 1;
    }
  myNum3++;
  if (myNum3 == 600){
    myNum3 = 1;
  }
  fill (myNum, 150, 150);
   ellipse(x, 100, myNum3, myNum3);
   if(x > 750){
     dir = -1;
   } else if (x < 50){
     dir = 1;
   }
    
   
   x += dir;
    
    myNum++;
    stroke(myNum/2);
   println(myNum/2);
   //line(800, myNum, myNum, height);
   //line(myNum, 0, myNum, height);
   //line(800, myNum, myNum, height);
   fill (myNum, myNum, 150);
   bezier(300, 600, myNum, myNum, 600, myNum, myNum, 600);
   //if(myNum == 800){
     //dir = -1;
   //}
   //myNum += dir;
   bezier(300, 600, myNum, myNum, 600, myNum, myNum, 180);
   bezier(800, 600, myNum, myNum, 600, myNum, myNum, 180);
   //bezier(myNum, myNum, myNum, myNum, 600, 200, 300, 180);
   //bezier(myNum, myNum, myNum, myNum, 600, 400, 500, 180);
   if (myNum == 800){
     myNum = 0;
   }
}
