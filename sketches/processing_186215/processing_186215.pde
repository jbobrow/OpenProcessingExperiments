
int onethirdofwidth= 600/3;
int onehalfofheight=350/2;
void setup() {
  size(600,350);
  stroke(225,240,245);  
}

void draw(){
background(245,105,158);
smooth();
noStroke();
fill(255);
beginShape();
vertex(50*1.9, 15*1.9); 
bezierVertex(50*1.9, -5*1.9, 90*1.9, 5*1.9, 50*1.9, 40*1.9); 
vertex(50*1.9, 15*1.9); 
bezierVertex(50*1.9, -5*1.9, 10*1.9, 5*1.9, 50*1.9, 40*1.9); 
endShape();

//the rect in 6  
fill(255);
rect(460,208.75,80,80);

//the triangle in 6
  fill(245,105,158);
  triangle(500,240,485,262.5,515,262.5);

//if the mouse is on the 1
  if (mouseX<width/3)
  if(mouseY<height/2){
fill(255);
  textSize(15);
  text("knock,knock",mouseX,mouseY);
//draw a heart
smooth();
noStroke();
fill(255);
beginShape();
vertex(50*1.91, 15*1.91); 
bezierVertex(50*1.93, -5*1.91, 90*1.93, 5*1.91, 50*1.91, 40*1.93); 
vertex(50*1.91, 15*1.91); 
bezierVertex(50*1.93, -5*1.91, 90*1.93, 5*1.91, 50*1.91, 40*1.93); 
endShape();
  }

//if the mouse is on the 2

  if (mouseX>width/3)
  if (mouseX<width/3*2)
  if(mouseY<height/2){
fill(255);
textSize(15);
//you
text("( You.  )",320,100);
   
}
//if the mouse is on the 3.1
  if (mouseX>width/3*2)
  if(mouseY<height/2){
fill(255);
textSize(15);
//you
text("you.",420,100);
text("(         )",320,100);
  }
  
//if the mouse is on the 4.1
  if (mouseX<width/9)
  if(mouseY>height/2){
fill(255);
triangle(mouseX, mouseY,mouseX-15,mouseY+23,mouseX+15,mouseY+23);
  }   

//if the mouse is on the 4.2
  if (mouseX<width/9*2)
  if (mouseX>width/9)
  if(mouseY>height/2){
fill(255);
triangle(mouseX, mouseY,mouseX+27,mouseY,mouseX+13.5,mouseY+25);
  }   

//if the mouse is on the 4.3
  if (mouseX<width/9*3)
  if (mouseX>width/9*2)
  if(mouseY>height/2){
fill(255);
triangle(mouseX, mouseY,mouseX-15,mouseY+23,mouseX+15,mouseY+23);
  }   

//if the mouse is on the 5.1
  if (mouseX<width/9*4)
  if (mouseX>width/9*3)
  if(mouseY>height/2){
fill(255);
rect(mouseX, mouseY, 24, 24);
  }   
  
//if the mouse is on the 5.2
  if (mouseX<width/9*5)
  if (mouseX>width/9*4)
  if(mouseY>height/2){
fill(255);
triangle(mouseX, mouseY,mouseX-15,mouseY+23,mouseX+15,mouseY+23);
  }  

//if the mouse is on the 5.3
  if (mouseX<width/9*6)
  if (mouseX>width/9*5)
  if(mouseY>height/2){
fill(255);
triangle(mouseX, mouseY,mouseX+27,mouseY,mouseX+13.5,mouseY+25);
  }  

//if the mouse is on the 6.1&6.2
  if (mouseX<width/9*9)
  if (mouseX>width/9*6)
  if(mouseY>height/2){
fill(255);
triangle(mouseX, mouseY,mouseX-15,mouseY+23,mouseX+15,mouseY+23);
  }  
  

//2
  fill(255);
  textSize(15);
  text("All I want is",230,100);
  
  fill(255);
  textSize(15);
  text("Fill it",483,318);
  
  stroke(255);
  line(width/3,0,width/3,height);
  line(0,height/2,width,height/2);
  line(0,height/2,width,height/2);
  line(width/3*2,0,width/3*2,height);

//if it gets filled
 if (mouseX<500.1)
 if (mouseX>499.9)
 if (mouseY<240.1)
 if (mouseY>239.9){
 fill(255);
rect(0, 0, 600, 350);
fill(188,30,30);
textSize(18);
text("Happy Valentine's, Andy",186,180);
 }

}
