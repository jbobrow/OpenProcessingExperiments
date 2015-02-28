
//Homework Assingment 3
//51-257 A
//Copyright 2012 Marcos Gonzalez-Bode megonzal@andrew.cmu.edu




float x,y;
  
void setup() {
  size(300,300);
    x = 20;
    y = 15;
    smooth();
}  

void draw () {
  for(float Y=y/2; Y < 299; Y+=x){
  for(float X=x/2; X < 299; X+=x){
    
    if(mousePressed && dist( X, Y, mouseX, mouseY) < y){
        strokeWeight(15);
    }
        else
    {
        strokeWeight(5);
    }
        point(X,Y);           
   }    
  }
  
  //saveFrame("Hw3.jpg");
}


void keyPressed() {
  
 //background(255);
 stroke(255,0,0);
}

