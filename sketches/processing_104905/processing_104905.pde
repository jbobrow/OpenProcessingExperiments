
//circle background variable
int xpos;
int ypos;
int interval;
int gradientWidth;
int gradientHeight;

 
float a =400;
float b =400;
float c =50;
float d =100;

void setup() {
   
 
 size(830,800);
 
 
colorMode(HSB, 360, 100, 100);
background(12,0,100);
smooth();
 
 
//all my bunnys colors
color gray = color(208, 11, 69);
color pink = color(10, 33, 96);
color navyblue = color(231,85,16);
color black = color(231,0,0);
color tonguepink = color(12, 60, 97);
color white = color(12,0,100);
color orange1 = color(20,97,97);
color orange2 = color(28,99,99);
color orange3 = color(38,99,99);
color orange4 = color(47,100,100);
color orange5 = color(54,100,100);
 
interval = 255/3;
 
xpos = width/2;
ypos = height/2;
 
gradientWidth = width;
gradientHeight = height;


 
noStroke();
 
 
 
  fill(orange1);
  ellipse(xpos, ypos, gradientWidth, gradientHeight);
   
  fill(orange2);
  ellipse(xpos, ypos, gradientWidth-interval, gradientHeight-interval);
   
  fill(orange3);
  ellipse(xpos, ypos, gradientWidth-interval*2, gradientHeight-interval*2);
  
  fill(orange4);
  ellipse(xpos, ypos, gradientWidth-interval*3, gradientHeight-interval*3);
   
  fill(orange5);
  ellipse(xpos, ypos, gradientWidth-interval*4, gradientHeight-interval*4);
   
   fill(black);
  ellipse(xpos, ypos, gradientWidth-interval*5, gradientHeight-interval*5);
   
  
 
 
 
 
 
 
 
 
 
 
 //400,400,50,100
 
 
noStroke();
 
   
   
  //face
      fill(gray);
 
   ellipse(a+35,b-20,c+135,d+140);
 
   
  //eyes
  fill(white);
 
  ellipse(a+80,b,c,d);
    ellipse(a,b,c,d);
     
       
  fill(navyblue);
 
  ellipse(480,415,20,30);
    ellipse(a,b+15,c-30,d-70);
     
      //nose
  fill(pink);
  triangle(460, 450, 440, 430, 400, 450);
     
     
  fill(white);
//  translate(50, 72);
rotate(radians(20));
  ellipse(525, 300, 148, 72);
   
   fill(white);
//  translate(50, 72);
rotate(radians(-40));
  ellipse(300, 599, 148, 72);
 
  
   
       //mouth
  fill(black);
 
  rect(220, 590, 85, 3);
 
 
   //ears
   fill(gray);
  ellipse(250,320,44,192);
   
  
 
  fill(pink);
  ellipse(250,320,24,172);
   
      fill(gray);
   rotate(radians(40));
  ellipse(546,25,44,192);
   
    fill(pink);
 
  ellipse(546,25,24,172);
   
  
}
