
//D. Lloyd Gray-Sept.22-creation and Computation

float r;//these 4 values allow for the random colour generation
float g;
float b;
float a;
int y = 0;//allows recording and ajustmentof vertical values
int x = 0;//allows recording andajustmentof horizontal values
int counter = 0;/*counter is here because I tried some variations using 2 
counters to stop the repeat(counter2 was to keep a running total, 
and counter was to go line by line.*/

void setup() {
  size(200,200);
    background(255);
  smooth();
}

void draw() {
  rectMode(CORNER);
 
 noStroke();

    while(x<201&&y<201){//thes parameters make the loop stop at the end of the screen
  r = random(255);//the next 5 lines generate the random fill value
  g = random(255);
  b = random(255);
  a = random(255);
      fill(r,g,b,a);//this is the value for the rect below
    rect(x,y,10,10);//draws the squares
      x = x+10;//increments the horizontal value
counter = counter + 1;
// print(counter);//this is for debugging 

 
 if(x>=200){
  y = y + 10;//increments the vertical count to start the next line
  x=0;//returns the horizontal value to 0
  print(y);
   //counter = 0;
   //x=0;
    }
    }
 }
 

   

  


