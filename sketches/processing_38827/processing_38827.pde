
//D. Lloyd Gray-Sept.22-creation and Computation

float r;//these 4 values allow for the random colour generation
float g;
float b;
float a;
int y = 0;//allows recording and ajustmentof vertical values
int x = 0;//allows recording andajustmentof horizontal values
int counter = 0;

void setup() {
  size(200,200);
    background(255);
  smooth();

}

void draw() {
  rectMode(CORNER);
 
 noStroke();
if (mousePressed)
    while(x<201&&y<201){//thes parameters make the loop stop at the end of the screen
  r = random(255);//the next 5 lines generate the random fill value
  g = random(255);
  b = random(255);
  a = random(255);
      fill(r,g,b,a);//this is the value for the rect below
    rect(x,y,10,10);//draws the squares
      x = x+10;//increments the horizontal value
      print(x);
    }
   x=0;
}

 

   

  


