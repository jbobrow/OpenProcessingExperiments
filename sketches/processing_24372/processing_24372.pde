
import processing.pdf.*;

int num = 30;
float s=num; //the size of the boxes
float h=0; //height at which squares are drawn
float h2=num; //height at which spots are drawn
float g=0; //how far from the lhs the squares are drawn
float g2=num; //how far from the lhs the spots are drawn
int b=780; //bottom of the picture
int rhs=390; //right hand side of the 
float s2 = 8;
float s3 = 4;
int count = 0; //counts the number of lines
int count2 = 0;

color pink = color(200);
color blue = color(0,0,255,120);
color white = color(255);
color black = color(0);
color current = pink;



void setup(){
  size(390,780);
  background(255);
  //noStroke();
  //beginRecord(PDF, "AnglesWithSpots.pdf");
  noStroke();
}

void draw(){
  
  drawSquares();
  drawSpots();
 
 //endRecord();
}
  
public void drawSquares(){
  
  while(g<400){
    h=0;
    while(h<800){
      drawBox(g,h,s,s);
      h=h+2*s;
      }
    g=g+2*s;
  }
}

public void drawBox(float x, float y, float w, float h){
  
  changeColor(current);
  rect(x,y,w,h);
  rect(x+w,y+h,w,h);
  changeColor(current);
  rect(x+w,y,w,h);
  rect(x,y+h,w,h);
  
}

public void drawSpots(){
  
 changeColor(white);
 count2 = 0;
    
  while(g2<390){
    count=0;
    while(h2<750){
      quad(g2,h2-2*s3,g2+2*s3,h2,g2,h2+2*s3,g2-2*s3,h2);
      changeColor(current);
      quad(g2-s2,h2,g2-s3,h2-s3,g2,h2,g2-s3,h2+s3);
      quad(g2+s2,h2,g2+s3,h2-s3,g2,h2,g2+s3,h2+s3);
      count++;
      
      if(count == 12)
        changeColor(current);
      
       h2=h2+s;
    }
    
    if(count2 == 5)
      changeColor(current);
    h2=num;
    g2=g2+s;
    count2++;
  }
}
  


public void changeColor(color one){
  color two = one;
  if(two==pink)
    current=blue;
  if(two==blue)
    current=pink;
  if(two==black)
    current=white;
  if(two==white)
  current=black;
  fill(current);
}



