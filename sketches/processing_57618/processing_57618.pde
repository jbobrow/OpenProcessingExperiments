
//float is for decimal numbers
//int is for intergers
float beginX = 10.0;  // starting x coordinate
float beginY = 10.0;  // starting y coordinate
float endX = 570.0;   // ending x coordinate
float endY = 2000.0;   // ending y coordinate
float distX;          // declaring a symbol to use later, the X-axis distance to move
float distY;          // Y-axis distance to move
//float exponent = 2.5;   // determines curve shape ( y=x^exponent)
float x = 0.0;        // Current x-coordinate, 
float y = 0.0;        // Current y-coordinate
float step = 0.01;    // each step size, the smaller the number- smoother the curve
float pct = 0.0;      // Percentage traveled (0.0 to 1.0)
int size=200;    //used for subtracting coordinates


float percent=0.0; //percent travelled new variable for a and b
float a= 0.0;//declaring new variables
float b= 0.0;

float distC;
float distD;
float pt; // percent travelled for variable c and d
float c= 0.0; //declaring variables
float d= 0.0;
float beginC=0.0;
float beginD=0.0;
float steps = .05;

void setup() 
{
  size(600,600);
  background(150);
  //noStroke();
  strokeWeight(1);
  stroke(1,0,1,10);
  smooth();
  frameRate(60);
  
}

void draw() 
{
  //spreading
  distX = endX - beginX; //defining distance for equation below
  distY = endY - beginY;
  pct += step; //pct traveled=step+pct traveled
  if (pct < 1.0) {//when curve is not 100% finsihed drawing... do the bottom
    x = beginX + (pct * distX);
    y = beginY + (pct * distY);//defining x and y positions along curve at a given time and % travelled
  }
 // distA= width;
 // distB= height;
  percent += step; //pct traveled=step+pct traveled
 // if (percent < 1.0) {//when curve is not 100% finsihed drawing... do the bottom
  //  a = (percent*distA);
  //  b = (percent*distB);
     a = (percent*mouseX);
    b = (percent*mouseY);
 //}
 
  //if (c=mouseX){xdirection*=-1;}
 // if (d=mouseY){ydirection*=-1;}
  
 // if (x=endX){
  fill(15,15,25,10);
  ellipse(300,300, size-x, size-y); //width and height is determined by above exponential curve, y grows greater as time passes
  ellipse(10,300, size-x, size-y); // making the shape follow the curve ellipse(x,y,20,20)
  ellipse(590,300, size-x, size-y);
  
  fill(255,10);
  ellipse(a,b,random(10,20),random(10,20)); //width and height is determined by above exponential curve, y grows greater as time passes


  //circle outlines
  fill(8,2);
  stroke(0,0,8,30);
  strokeWeight(1.5);
  ellipse(random(0,width),random(0,height),random(mouseY,mouseX),random(mouseY,mouseX));
  
  //scattered ellipses
  stroke(0,0,0,20);
  strokeWeight(4);
  smooth();
  frameRate(100);
  fill(0,20);
  ellipse(mouseY,mouseX,random(20,35),random(20,37));
  
  stroke(0,10);
  strokeWeight(2);
  frameRate(100);
  fill(0,15);
  ellipse(random(mouseX-100,mouseX),random(mouseY-100,mouseY),random(50,75),random(50,75));
  
  stroke(0,10);
  strokeWeight(2);
  frameRate(100);
  fill(0,15);
  ellipse(random(mouseX,mouseX+200),random(mouseY,mouseY+200),random(40,80),random(40,80));
  
  stroke(0,10);
  strokeWeight(2);
  frameRate(100);
  fill(0,3);
  ellipse(random(mouseY,mouseY-100),random(mouseX,mouseX-100),random(50,75),random(50,75));
}
void mousePressed(){
 saveFrame("img###.jpg");
 
 //distC = width-beginC; 
  //distD = height-beginD;
  //pt += steps; 
  //if (pt < 1.0) {
    //c = beginC + (pt * distC);
    //d = beginD + (pt * distD);//defining x and y positions along curve at a given time and % travelled
 // }
 //noFill();
 //fill(0,12);
 //stroke(1,1,8,20);
 //strokeWeight(1);
 // ellipse(450,300, c,d);
  //ellipse(150,300, c,d); 
}


