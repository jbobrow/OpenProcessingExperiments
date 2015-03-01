
/*
Project by
Adriani Parracciani

The project draws a NxN grid, 
made by distanced squares, 
where N is a number between 2 to 9 
(min 2x2 squares, max 9x9 squares). 
You can dynamically change the grid 
size by pressing the respective 
number on keyboard (from 2 to 9)

*/



void setup(){
size (560,560);
frameRate(1);
}
int q=int(random(2,9)); //square's number


void draw() {
int dis=q+1; //total number of spaces
int max=int((560-(dis*10))/q);//max side value
int lato=int(random(10,max));
int l=lato;
int space=(width-l*q)/dis;//calculate the space between squares
int x=space;
int y=space;
int R= int(random(255));
int G= int(random(255));
int B= int(random(255));


background(0);
fill(R,G,B);
for (int i=0; i<q; i++) {
 for (int j=0; j<q; j++) {
       rect (x,y,l,l);
       x=x+l+space;
     }
   l=lato;
   x=space;
   y=y+l+space;
  }
}

void keyPressed() {
  if (key=='2'){
    q=2;
  }
  if (key=='3'){
    q=3;
  }
  if (key=='4'){
    q=4;
  }
  if (key=='5'){
    q=5;
  }
  if (key=='6'){
    q=6;
  }
  if (key=='7'){
    q=7;
  }
  if (key=='8'){
    q=8;
  }
  if (key=='9'){
    q=9;
  }
  }

  
  
  
  
