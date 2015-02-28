
import processing.pdf.*;



int Y_AXIS = 1;
int X_AXIS = 2;

 int thirdw = width/3;
  int thirdh = height/3;
  
  int elpsSpce = thirdh/20;

void setup(){
  size(350,700);
 // beginRecord(PDF, "panel4.pdf");
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
  color c5 = color(104, 113, 101);
  
  setGradient(0, 0, width, height/2, c1, c5, Y_AXIS);
  setGradient(0, height/2, width, height/2, c3, c5, X_AXIS);
  
   stroke(109,116,103,220);
    line(thirdw, 0, thirdw, thirdh+thirdh/2);
    line(thirdw*2, thirdh*2-thirdh/4, thirdw*2, height);
    line(0, thirdh, width/2, thirdh);
    line(thirdw+thirdw/2, thirdh*2, width, thirdh*2);
    
    stroke(109,116,103,220);
      for(float i=thirdw*2; i<width; i = i + random(5)){
    line(i, 0, i, random(thirdh*2,height-thirdw)); 
  }
  noFill();
  stroke(10,10,10);
  strokeWeight(2);
  ellipse(thirdw+thirdw/4,thirdh+(thirdw/4)*2,thirdh,thirdh);
    
    for(float c = elpsSpce; c < elpsSpce*20; c = c + elpsSpce*random(3)){
       strokeWeight(random(1,5));
       ellipse(thirdw+thirdw/4,thirdh+(thirdw/4)*2,c,c);
       
    }
       noStroke();
       fill(10,10,10);
  triangle(0,thirdh/2,width/2,height/2,0,(thirdh*2)+thirdh/2);
  
  for(float numC = 0; numC < 10; numC = numC + 1){
      noStroke();
      fill(219, 229, 215,random(50,255));
      ellipse(thirdw+random(100), thirdh+(thirdh/4)*2 - random(250),elpsSpce*1,elpsSpce*1);
    }
    
  
  stroke(109,116,103);
 noFill();
 
   for(float d = elpsSpce; d <  elpsSpce*15;  d = d + elpsSpce*random(3)){
     strokeWeight(random(4));
     ellipse(thirdw-thirdw/4,thirdh*2-thirdh/4, d, d);
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

