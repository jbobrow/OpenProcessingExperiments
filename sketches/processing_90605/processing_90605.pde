
Walker [] myWalker;
PImage imp;


void setup() {
size(690,690);
myWalker=new Walker[20];
for (int i=0;i<myWalker.length;i++){  
myWalker [i]=new Walker(random(0,400),random(0,300),1);

imp=loadImage("22.jpg");
  } 
noStroke();
smooth();
fill(0);
}

void draw() {
image(imp,0,0);
for (int i=0;i<myWalker.length;i++){  

      
myWalker[i].moveWalker();
myWalker[i].drawWalker();
    }
}





class Walker {
float x;
float y;
float s;
   
Walker (float ax, float ay, float as) {
x=ax;
y=ay;
s=as; 
}
   
void moveWalker() {
float myX=int(random(0,2));
float myY=int(random(0,2));
x=x+myX/2;
y=y+myY/2;
     
   }
   
void drawWalker() {
pushMatrix();
translate(x,y);
scale(0.5);
stroke(0,0,0);
fill(0,0,0);
//face
ellipse(100,62,100,62);
 
//ears
triangle(60,21,78,32,59,42);
triangle(132,18,137,39,117,31);
 
//eyes
noStroke();
fill(255,255,255);
ellipse(76,45,25,25);
ellipse(122,45,25,25);
 
//eyes2
noStroke();
fill(0,0,0);
ellipse(76,45,9,9);
ellipse(122,45,9,9);
 
//
noFill();
stroke(255,255,255);
strokeWeight(3.5);
arc(99,60,70,55,radians(0),radians(180));
 
//Nose
fill(255,255,255);
noStroke();
ellipse(99,61,17,10);
 
//
stroke(255);
strokeWeight(1);
line(69,58,91,58);
line(91,61,74,62);
line(93,61,72,69);
line(102,58,126,57);
line(105,59,128,61);
line(103,61,122,66);
 

 
//body
stroke(0,0,0);
fill(0,0,0);
triangle(97,93,119,132,77,131);
ellipse(86,113,39,43);
 
//tail
noFill();
strokeWeight(3);
beginShape ();
curveVertex (32, 88);
curveVertex (34, 94);
curveVertex (19, 99);
curveVertex (11, 91);
curveVertex (20, 74);
curveVertex (40, 70);
curveVertex (45, 73);
curveVertex (49, 82);
curveVertex (54, 113);
curveVertex (60, 119);
curveVertex (67, 123);
curveVertex (77, 123);
endShape ();
 
strokeWeight(5);
beginShape ();
curveVertex (32, 88);
curveVertex (34, 94);
curveVertex (19, 99);
curveVertex (11, 91);
curveVertex (20, 74);
curveVertex (40, 70);
curveVertex (45, 73);
curveVertex (49, 82);
curveVertex (54, 113);
endShape ();
popMatrix();
   }
  
}


