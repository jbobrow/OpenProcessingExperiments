
import processing.pdf.*;

int Y_AXIS = 1;
int X_AXIS = 2;

 int thirdw = width/3;
  int thirdh = height/3;
  
  int elpsSpce = thirdh/20;

void setup(){
  size(350,700);
 // beginRecord(PDF, "panel3.pdf");
  background(255);
  noStroke();
  smooth();
  
  int thirdw = width/3;
  int thirdh = height/3;
  
  int elpsSpce = thirdh/20;
  
  color c1 = color(219, 229, 215);
  color c2 = color(120, 148, 155);
  color c3 = color(40, 43, 52);
  color c4 = color(133,175,185);
  
  setGradient(0, 0, width, height/2, c1, c2, Y_AXIS);
  setGradient(0, height/2, width, height/2, c4, c3, X_AXIS);
  
   stroke(255,80);
    line(thirdw, thirdh*2-thirdw/2, thirdw, height);
    line(thirdw*2, 0, thirdw*2, thirdh+thirdw/2);
    line(thirdw+thirdw/2, thirdh, width, thirdh);
    line(0, thirdh*2, thirdw+thirdw/2, thirdh*2);
    
   
  
   strokeWeight(1);
    stroke(255,100);
   for(float i=thirdw-thirdw/2; i>0; i = i - random(5)){
    line(i, height, i, random(0+thirdw, 0 + thirdh));
  }
  
 
  
  stroke(255,20);
   for(float i=thirdw*2; i>thirdw-thirdw/2; i = i - random(5)){
     
    line(i, height, i, random(0+thirdh, 0 + thirdh*2));
    
   }
   
    noStroke();
  fill(40, 43, 52,210);
    arc(thirdw*2+thirdw/4,thirdh-thirdw/4,elpsSpce*15,elpsSpce*15,PI+PI/4,(TWO_PI-PI/2)+PI/4);
    
     fill(10,10,10);
  triangle(width,thirdh/2,width/2,height/2,width,(thirdh*2)+thirdh/2);
    


 noStroke();
    fill(40, 43, 52, 50);
    arc(thirdw*2+thirdw/4,thirdh-thirdw/4,elpsSpce*15,elpsSpce*15,0+PI/4,PI-PI/4);
    fill(40, 43, 52, 150);
    arc(thirdw*2+thirdw/4,thirdh-thirdw/4,elpsSpce*15,elpsSpce*15,PI-PI/4,PI+PI/4);
    fill(40,43,52,150);
    arc(thirdw*2+thirdw/4,thirdh-thirdw/4,elpsSpce*15,elpsSpce*15,(TWO_PI-PI/2)+PI/4,TWO_PI);
    arc(thirdw*2+thirdw/4,thirdh-thirdw/4,elpsSpce*15,elpsSpce*15,0,0+PI/4);
    
 stroke(255,50);
  fill(120, 148, 155,10);
     for(float a = elpsSpce; a <  elpsSpce*15;  a = a + elpsSpce*random(3)){
     strokeWeight(random(4));
     ellipse(thirdw*2,thirdh+thirdh/4, a, a);
     
     }

stroke(133,175,185,50);
  noFill();
     for(float b = elpsSpce; b <  elpsSpce*10;  b = b + elpsSpce*random(3)){
     strokeWeight(random(2));
     ellipse(width-thirdw/4,thirdh+(thirdh/4)*3, b, b);
     
     }

  for(float numC = 0; numC < 10; numC = numC + 1){
      noStroke();
      fill(213,242,1245,random(50,255));
      ellipse(thirdw*2+thirdw/2-random(200), thirdh-(thirdh/4) +random(200),elpsSpce*2,elpsSpce*2);
    }
    
//endRecord();
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ){
  // calculate differences between color components 
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);

  // choose axis
  if(axis == Y_AXIS){
    /*nested for loops set pixels
     in a basic table structure */
    // column
    for (int i=x; i<=(x+w); i++){
      // row
      for (int j = y; j<=(y+h); j++){
        color c = color(
        (red(c1)+(j-y)*(deltaR/h)),
        (green(c1)+(j-y)*(deltaG/h)),
        (blue(c1)+(j-y)*(deltaB/h)) 
          );
        stroke(c);
        point(i, j);
        
        //set(i, j, c);
      }
    }  
  }  
  else if(axis == X_AXIS){
    // column 
    for (int i=y; i<=(y+h); i++){
      // row
      for (int j = x; j<=(x+w); j++){
        color c = color(
        (red(c1)+(j-x)*(deltaR/h)),
        (green(c1)+(j-x)*(deltaG/h)),
        (blue(c1)+(j-x)*(deltaB/h)) 
          );
          stroke(c);
          point(j, i);
          
        //set(j, i, c);
      }
    }  
  }
}  

