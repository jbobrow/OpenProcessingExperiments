
float x=250;
float y=250;
float a;
float b;
float c;
int colourA;
int colourB;
int colourC;

void setup() {
  size (500,500);
  smooth();
}

void draw () {
    background(127);

  rectMode(CENTER);
  fill(colourA,colourB,colourC);
  rect(x,y,90+c,70+c);//face
  fill(0);
  noStroke();
  rect(x-17,y-10,17,5);//lift eye
  fill(0);
  rect(x+17,y-10,17,5);//right eye
  fill(255);
  rect(x,y+15,17,10);
  stroke(0);
  rectMode(CORNER);
  fill(colourA,colourB,colourC);
  rect(x+53,y+20+a,15,15);
  fill(colourA,colourB,colourC);
  rect(x+50+25,y+25+a,10,10);
  
 
  colourA=colourA + int(random(-10,10));
  colourB=colourB + int(random(-10,10));
  colourC=colourC + int(random(-10,10));
  
  a=a+random(-1,1);
  b=b+random(-1,1);
  c=c+random(-1,1);
  
   x=x+a;
   y=y+b;
  if(x>width) {
    a=a*-1;
      }
      if(x<0){
        a=a*-1;}
        
   if(y>height){
     b=b*-1;
   }
   if(y<0){
     b=b*-1;
   }
   
  a=constrain(a,-10,10);
  b=constrain(b,-10,10);
  c=constrain(c,-20,20);
  colourA=constrain(colourA,0,255);
  colourB=constrain(colourB,0,255);
  colourC=constrain(colourC,0,255);
  
  if(mousePressed){
    background(127);
    rectMode(CENTER);
  fill(colourA,colourB,colourC);
  rect(mouseX,mouseY,90+c,70+c);//face
  fill(0);
  noStroke();
  rect(mouseX-17,mouseY-10,17,5);//lift eye
  fill(0);
  rect(mouseX+17,mouseY-10,17,5);//right eye
  fill(255);
  rect(mouseX,mouseY+15,17,10);
  stroke(0);
  rectMode(CORNER);
  fill(colourA,colourB,colourC);
  rect(mouseX+53,mouseY+20+a,15,15);
  fill(colourA,colourB,colourC);
  rect(mouseX+50+25,mouseY+25+a,10,10);
  x=mouseX;
  y=mouseY;
  }
  
  
  
  }


