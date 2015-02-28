
//Learning processing
//Variables and type casting

float Cr;
float Cg;
float Cb;
float Ca;
float Rad;
float x;
float y;
float move = 1;
void setup(){
  //int goldenRatio = (int) (1+sqrt(5)/2);
  //Commonly used Java type casting syntax,works the same as
  //int goldenRatio = int(1+sqrt(5)/2);
  //int side = 300;
  //size(side*goldenRatio,side);
  size(400,200);
  smooth();
  background(255);
  frameRate(500);
 
}
void draw(){
colorMode(RGB,1);
Cr = random(1);
Cg = random(1);  
Cb = random(1); 
Ca = random(1);
Rad = random(width/10); 
x = random(width);
y = random(height);
float lin=move/height;
//lin = pow(lin,2);
stroke(Cr,Cg,Cb,Ca);
strokeWeight(2*lin);
fill(Cr,Cg,Cb,Ca*lin);
rotate(x*y*move);
rect(x,move,Rad*lin,Rad*lin);
//ellipse(x,move,Rad*lin+5,Rad*lin+5);
//stroke(1);
//ellipse(x,move,Rad*lin+10,Rad*lin+10);
move = frameCount%height  ;
//int rand = int(random(1,100));
//println(move/height);

}


