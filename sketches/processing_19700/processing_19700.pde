
void setup(){
size(250, 250);
smooth();
background(#E7FEFF);
}

float r = 0;
float s = 1; //all the s are the individual swirls 
float s2 = 1;
float s3 = 1;
float s4 = 1;
float s5 = 1;
float s6 = 1;
float s7 = 1;
float s8 = 1;
float s9 = 1;
float s10 = 1;

float x = 300;
float y = 300;
//
void draw(){
  

fill(#3C3251, random(1, 255));  
stroke(#A8D46F, random(1, 255));

scale(0.5);
frameRate(600);
rectMode(CENTER);


r += 0.0009;
s += (random(-1, 1));
s2 += (random(-1, 1));
s3 += (random(-1, 1));
s4 += (random(-1, 1));
s5 += (random(-1, 1));
s6 += (random(-1, 1));
s7 += (random(-1, 1));
s8 += (random(-1, 1));
s9 += (random(-1, 1));
s10 += (random(-1, 1));

rotate(r);

rect(x, y, s, s);
rect(x-20, y-20, s2, s2);
rect(x-40, y-40, s3, s3);
rect(x-60, y-60, s4, s4);
rect(x-80, y-80, s5, s5);
rect(x-80, y-80, s6, s6);
rect(x-100, y-100, s7, s7);
rect(x-120, y-120, s8, s8);
rect(x-140, y-140, s9, s9);
rect(x-160, y-160, s10, s10);






}

                                
