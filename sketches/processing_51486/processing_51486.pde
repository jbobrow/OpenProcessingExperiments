
//left click background eyes change color
//right click, cursor eye lifts above grid. 

void setup (){
  size (800,800);
  smooth();

  
}
void draw (){//void draw beginning//////////
background (0);
 fill (255);
 eye (mouseX,mouseY); 

 
for (int i = -90; i<= 900; i += 90){//from processing book
    for (int j= -100; j<= 800; j+= 100) {
      eye (i+(mouseX-pmouseX),j+(mouseY-pmouseY));//inspired by "tickle" example from processing.org
    
    if (mouseButton==RIGHT){
     eye2(i+(mouseX-pmouseX),j+(mouseY-pmouseY));   
  
      }
        if (mouseButton==LEFT){
          eye(i,j);
}
    }     
}
}//void draw end cap thingy//////////////////

void eye (int x, int y){
  pushMatrix();//the other keith peters helped with push matrix and pop matrix
  smooth();
stroke (0);
strokeWeight (1);
fill(255);
ellipse (x,y,75,75);//white of the eye

noStroke();
ellipse (x,y,60,60);
strokeWeight (1);
stroke (5,52,116);

fill(133,118,245);
ellipse (x,y,35,35);

translate (x,y);
for (int i=0; i<360;i+=10){
  strokeWeight (1);
  stroke (5,52,116);
  rotate (10*2*PI/360);
  line (0,0,17,0);
}

fill(0);
ellipse(0,0,12,12);
fill (255);
ellipse(5,-11,12,12);
stroke(0,15);
popMatrix();
}
 
 void eye2 (int x, int y){
  pushMatrix();
  smooth();
stroke (0);
strokeWeight (1);
fill(255);
ellipse (x,y,75,75);//white of the eye

noStroke();
ellipse (x,y,60,60);
strokeWeight (1);
stroke (52,36,29); 

fill(52,36,29);
ellipse (x,y,35,35);

translate (x,y);
for (int i=0; i<360;i+=10){
  strokeWeight (1);
  stroke (5,52,116);
  rotate (10*2*PI/360);
  line (0,0,17,0);
}

fill(0);
ellipse(0,0,12,12);
fill (255);
ellipse(5,-11,12,12);
stroke(0,15);
popMatrix();
}
 

