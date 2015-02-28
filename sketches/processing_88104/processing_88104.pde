

int h = hour();
int m = minute();
int s = second();
int x, y, X, Y = 0;



void branchDraw(int len, int time, int x,int y, int maxTime){

  X = x + round(len*cos((float)time/maxTime*2*PI -PI/2));
  Y = y + round(len*sin((float)time/maxTime*2*PI -PI/2));
    line(x, y, X, Y);
 
    return;
}

void setup(){
  size(800, 800);
  background(255);
  smooth();
}

void draw(){
  h = hour();
  m = minute();
  s = second();
  
  background(255);

   h = hour();
   if(h > 12) {
     h = h - 12;
   }
   
  stroke(0, 0, 0, 60);

   for(int n = 1; n<=h-1; n++){
     strokeWeight(2);
     stroke(0, 0, 0);
     branchDraw(200, n, width/2, height/2, 12);
          
     int x2 = X;
     int y2 = Y;
     for(int i=1;i<=60; i++)
     {
        strokeWeight(1);
        stroke(0, 0, 0, 60);
        branchDraw(60, i, x2,y2, 60);

         int x3=X;
         int y3=Y;
         for(int k=1;k<=60; k++)
         {
           stroke(234, 0, 219, 60);
           branchDraw(45, k, x3, y3, 60);
         }                  
       }
     }  


   strokeWeight(2);
   stroke(0, 0, 0);
   branchDraw(200, h, width/2, height/2, 12);

   int x2 = X;
   int y2 = Y;
   for(int n = 1; n<=m-1; n++){
     strokeWeight(1);
     stroke(0, 0, 0, 60);
     branchDraw(75, n, x2, y2, 60);

     int x3 = X;
     int y3 = Y;
     for(int k=1;k<=60; k++)
     {
       strokeWeight(1);
       stroke(234, 0, 219, 60);
       branchDraw(45, k, x3, y3, 60);
      }
    }
    
  strokeWeight(1);
  stroke(0, 0, 0, 60);
  branchDraw(75, m, x2, y2, 60);
    
    int x3 = X;
    int y3 = Y;
    for(int n = 1; n<=s; n++)
    {
      strokeWeight(1);
      stroke(234, 0, 219, 60);
      branchDraw(45, n, x3, y3, 60);
    }
 
  fill(0);
  noStroke();
  ellipse(width/2, height/2, 200, 200);
  
}


