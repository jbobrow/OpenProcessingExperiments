


/* @pjs font="Cedarville-Cursive copy.otf";*/

int x=0;
int x1=0;
int x2=0;
int x3=0;
int x4=0;



PFont cedar;

void setup(){
 size (640,360);
 noStroke(); 
}
void draw (){

background(#10C999);
noStroke();
  fill (#3C20E0);
  ellipse (random(width), random(height), random (100,200), random (100,200));

 fill (#C92C10);
  ellipse (random(width), random(height), random (100,200), random (100,200));


 fill (#FCD805);
  ellipse (random(width), random(height), random (100,200), random (100,200));

//*THIS IS A HEART FOUND ON OPEN PROCESSING AND I COULDN'T FIGURE OUT HOW TO MAKE MY OWN CODE SO I BORROWED IT*//  
smooth();
fill(#C92C10);
beginShape();
vertex(50, 15); 
bezierVertex(50, -5, 90, 5, 50, 40); 
vertex(50, 15); 
bezierVertex(50, -5, 10, 5, 50, 40); 
endShape();

fill(#0F3901);
rect(0, 330, 640, 12);

fill(#155002);
arc(79, 330, 80, 200, PI, TWO_PI);

fill(#0F3901);
arc(79, 330, 50, 100, PI, TWO_PI);

fill(#3C20E0);
ellipse(465, 175, 140, 160);
ellipse(380, 205, 140, 160);
ellipse(318, 275, 140, 160);
ellipse(620, 240, 140, 160);
ellipse(550, 190, 140, 160);
ellipse(660, 330, 140, 160);
ellipse(294, 350, 140, 160);

fill(#C92C10);
ellipse(465, 175, 130, 150);
ellipse(380, 205, 130, 150);
ellipse(318, 275, 130, 150);
ellipse(620, 240, 130, 150);
ellipse(550, 190, 130, 150);
ellipse(660, 330, 130, 150);
ellipse(294, 350, 130, 150);

fill(#FCD805);
ellipse(465, 175, 120, 140);
ellipse(380, 205, 120, 140);
ellipse(318, 275, 120, 140);
ellipse(620, 240, 120, 140);
ellipse(550, 190, 120, 140);
ellipse(660, 330, 120, 140);
ellipse(294, 350, 120, 140);

fill(#FF6200);
arc(479, 360, 280, 280, PI, TWO_PI);

fill (#FCD805); 
ellipse(375, 340, 5, 140);
ellipse(385, 330, 5, 140);
ellipse(395, 340, 5, 140);
ellipse(405, 350, 5, 140);
ellipse(415, 360, 5, 140);
ellipse(425, 320, 5, 140);
ellipse(435, 330, 5, 140);
ellipse(445, 340, 5, 140);
ellipse(455, 350, 5, 140);
ellipse(465, 360, 5, 140);
ellipse(475, 320, 5, 140);
ellipse(485, 330, 5, 140);
ellipse(495, 340, 5, 140);
ellipse(505, 350, 5, 140);
ellipse(515, 360, 5, 140);
ellipse(525, 330, 5, 140);
ellipse(535, 340, 5, 140);
ellipse(545, 350, 5, 140);
ellipse(555, 360, 5, 140);
ellipse(565, 370, 5, 140);
ellipse(575, 330, 5, 140);
ellipse(585, 340, 5, 140);
ellipse(485, 330, 230, 5);
ellipse(495, 340, 230, 5);
ellipse(505, 350, 230, 5);
ellipse(500, 320, 230, 5);
ellipse(495, 310, 230, 5);
ellipse(490, 330, 230, 5);

fill(#C92C10);
ellipse(500, 290, 26, 116);
ellipse(430, 320, 26, 116);
ellipse(500, 290, 126, 20);
ellipse(430, 320, 126, 20);
ellipse(550, 320, 26, 116);
ellipse(545, 320, 126, 20);

fill(#FF6200);
ellipse(465, 175, 20, 20);
ellipse(380, 205, 20, 20);
ellipse(318, 275, 20, 20);
ellipse(620, 240, 20, 20);
ellipse(550, 190, 20, 20);
ellipse(660, 330, 20, 20);
ellipse(294, 350, 20, 20);

fill(#AA0581);
ellipse(465, 175, 9, 9);
ellipse(380, 205, 9, 9);
ellipse(318, 275, 9, 9);
ellipse(620, 240, 9, 9);
ellipse(550, 190, 9, 9);
ellipse(660, 330, 9, 9);
ellipse(294, 350, 9, 9);

fill(#0F3901);
rect(510, 330, 13, 13);
rect(490, 310, 13, 13);
rect(470, 330, 13, 13);
rect(490, 350, 13, 13);

fill(#155002);
rect(490, 330, 13, 13);
rect(510, 350, 13, 13);
rect(470, 350, 13, 13);

cedar = loadFont ("Cedarville-Cursive copy.otf"); 
textFont (cedar, 55); 
 fill (#10C999); 
text ("loves me", x, 40);
textFont (cedar, 35);
text ("loves me not", x1, 110); 

 
textFont (cedar, 75);  
 fill (#FCD805); 
text ("Loves Me!", x2, 200); 
textFont (cedar, 55);
text ("loves me NOT", x3, 290); 

textFont (cedar, 112); 
 fill (#C92C10); 
text ("LOVES ME!!!", 0, x4); 


x=x+1;
x1=x1+1;
x2=x2+1;
x3=x3+1;
x4=x4+1; 


if(x > height){  
  x=0;
}

if(x1 > height){  
  x1=0;
}
if(x2 > height){  
  x2=0;
}
if(x3 > height){  
  x3=0;
}
if(x4 > height){  
  x4=0;
}

}























