
//RachelHill animated drawing with variables, January 28, 2014

int a = 300;             //integer #1
int b = 255;             //integer #2
int c = 200;             //integer #3
int d = 0;               //integer #4
int e = 400;             //integer #5
int f = 30;              //integer #6
int h = 1;               //integer #7
int g = 150;             //integer #8
float z = 1/2* (a + b);  //float #1
float x = 256;           //float #2
float y = 400;           //float #3
float w = 60;            //float #4

void setup(){
  size(e, e); //size of background 
  frameRate(h); //speed of animation
}

void draw(){
  background((random(x)), (random(x)), (random(x))); //background color
  
  stroke(d, (random(x)), (random(b))); //stroke color for rectangle
  fill((random(x)), (random(x)), (random(z)), (random(10)));//fill color for rectangle
  rect((random(a)), (random(z)), (random(c)), (random(c))); //rectangle sizes and location
  
  stroke(z, d, (random(x))); //stroke color for ellipse
  fill(b, d); //fill color of ellipse
  ellipse((random(a)), (random(a)), mouseX, mouseY); //ellipse size and location
  
  stroke((random(x))); //stroke color of line
  line(d, (random(y)), e, (random(y))); //line size and location 
  
  stroke((random(x)), (random(b)), d); //stroke color of triangle
  fill(b, d); //fill color of triangle
  triangle(e, e, (random(a)), (random(a)), d, e); //size and location of triangle
  if(b > 200){
    b = 0;
  }
 
  stroke(b, b, x); //stroke color for rectangle
  fill(b, d);//fill color for rectangle
  rect((random(c)), (random(c)), (random(b)), (random(b))); //rectangle sizes and location
  
  stroke(c, c, d); //stroke color for ellipse
  fill(b, d); //fill color of ellipse
  ellipse((random(a)), (random(a)), c, c); //ellipse size and location
  
  stroke((random(x)), (random(x)), (random(x))); //stroke color of line
  line((random(y)), d, (random(y)), e); //line size and location
  
  stroke((random(x)), (random(b)), d); //stroke color of triangle
  fill(b, d); //fill color of triangle
  triangle((random(c)), (random(c)), e, e, (random(w)), (random(w))); //size and location of triangle
  
  stroke(x, d, d); //stroke color for rectangle
  fill(b, d);//fill color for rectangle
  rect(e, e, (random(a)), (random(a))); //rectangle sizes and location
  
  stroke(d, (random(x)), d); //stroke color for ellipse
  fill(b, d); //fill color of ellipse
  ellipse(c, c, (random(w)),(random(w))); //ellipse size and location
  
  stroke((random(x)), f, g); //stroke color of triangle
  fill(b, d); //fill color of triangle
  triangle((random(y)), (random(y)), (random(y)), (random(y)), (random(y)), (random(y))); //size and location of triangle
 }

