

 
//declare global variables -----
int xWidth = 700;
int yWidth = 700;
int x;
int y;
float sine;
float cosine;
float sine1;
float cosine1;
float total;
float total2;
float k;

//setup -----
 
void setup() {
  background(200);
  size(600, 600);
  smooth();
  strokeWeight(2);
}

 
//draw -----
 
void draw() 
{
  stroke(k, 100, 100, 10);
  
  k = 100 * sin(total);
  
  
  
 total = total + 0.001;
 total2 = total2 + 0.01;
 sine = 100*sin(total) + 300;
 cosine = 100*cos(total) + 300;

 sine1 = 100*sin(total2) + 300;
 cosine1 = 100*cos(total2) + 300;
 


  
  line(sine, cosine, sine1, cosine1);  //render  A


}


