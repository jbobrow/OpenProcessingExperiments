

  
Mia cat;

import org.gicentre.handy.*;
HandyRenderer h;
HandyRenderer e;




void setup(){
  size(600, 600);
  
  strokeWeight(3);
  float eyeWidth = 50;
  float eyeHeight = 30;
  
float x1, y1, x2, y2, x3, y3, x4, y4;
    x1 = width/3;
    y1 = 20;
    x2 = 480;
    y2 = 20;
    x3 = 300;
    y3 = 340;
    
   
  
  
  cat = new Mia(eyeWidth, eyeHeight, x1, y1, x2, y2, x3, y3);
  
  h = new HandyRenderer(this);
  e = new HandyRenderer(this);
  
  //background
  h.setRoughness(1);
  h.setFillGap(0.5);
  h.setFillWeight(0.1);
  h.setBackgroundColour(color(#EAE482));
  h.rect(0, 0, width, height); 
  
  fill(#E0442C);
  h.setRoughness(2);
  h.setFillWeight(1);
  h.setFillGap(2);
  h.setIsAlternating(true);
  h.triangle(0, height/3, width*1.7, height, 0, height);
  h.triangle(x3, height, width, height, width, height*0.8);
  
  
 //draw head
 cat.drawNeck();
 cat.drawHead();
 
 cat.drawFace();
 cat.drawEar();
 
 
//add left eye
  pushMatrix();
  translate(x3-eyeWidth*0.5,((y3-y1)*0.5 +y1-eyeHeight*0.5)) ;
  cat.drawEye();
  popMatrix();
  
//add right eye  
  pushMatrix();
  translate(x3+eyeWidth*1.5,((y3-y1)*0.5 +y1-eyeHeight*0.5)) ;
  cat.drawEye();
  popMatrix();

  //draw mouse 
  pushMatrix();
  translate(x3, (y3*0.65));
  cat.drawMouth();
  popMatrix(); 
} 


void draw(){

 
}






class Mia{
  float x1, y1, x2, y2, x3, y3, x4, y4;
  boolean nose;
  float w, h;
  int steps = 20;
  
  
  
  Mia(float _w, float _h, float _x1, float _y1, float _x2, float _y2, float _x3, float _y3 ){
    
    w = _w;
    h = _h;
    x1= _x1;
    y1=_y1;
    x2= _x2;
    y2=_y2;
    x3= _x3;
    y3=_y3;
    
  }
  
  void drawHead(){
    noFill();

    stroke(0);

    beginShape();
    bezier(x1, y1, x1, y1, x3, y3/1.5, x2, y2 );
    bezier(x1, y1, x1*0.5, y3, x2, y3, x2,y2 );

    endShape(CLOSE);
  }
  
  
  void drawFace(){
    //draw face

    fill(#F03200);
    getRight(10, 10);
    
    fill(#FFFFFF);
    //noStroke();
    getLeft(15, 10, true);

  }
  
  void drawEar(){
    
    fill(0);
    getLeft(12, 3, false);
    getRight(17, 17);
  }
  
  void drawEye(){
  fill(#FD9F00);
  e.setRoughness(1);
  e.setFillGap(0.5);
  e.setFillWeight(0.1);
  e.setBackgroundColour(color(#FD9F00));
  e.ellipse(0, 0, w, h);
  fill(#000000);
  rectMode(CENTER);
  e.rect(0, 0, 10, h);
  }
  
  
  void drawMouth(){
    noFill();
    stroke(0);
    strokeWeight(4);
    e.setRoughness(3);
    e.arc(0, 0, w, h,HALF_PI, PI);
    
  }
  
  void drawNeck(){
    
    rectMode(CORNER);
    fill(0);
    e.setFillGap(0.8);
    pushMatrix();
    rotate(0.1);
    e.rect(x3, y3*0.55,w*0.8,w*10);
    popMatrix();
    
  }
  
  
  
  
  //function to get points on curve
  
  PVector[] findPoint(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, int steps){
  
  PVector [] m ={};
  
for (int i = 0; i < steps; i++) {
  float t = i / float(steps);
  float x = bezierPoint(x1, x2, x3, x4, t);
  float y = bezierPoint(y1, y2, y3, y4, t);
  m =(PVector[])append(m, new PVector(x, y));
  
//  ellipse(m[i].x, m[i].y, 5, 5);
  
  }
  return m;
}

//function to fill partial face with color 



void getLeft(int count1, int count2, boolean nose){
  


PVector temp1= findPoint(x1, y1, x1, y1, x3, y3/1.5, x2, y2, steps )[count1];
PVector temp2 = findPoint(x1, y1, x1*0.5, y3, x2, y3, x2,y2, steps )[count2];

beginShape();

curveVertex(temp2.x, temp2.y);
for(int i = count2;i > 0; i -- ){
  PVector result = findPoint(x1, y1, x1*0.5, y3, x2, y3, x2,y2, steps )[i];
  curveVertex(result.x, result.y);
}
curveVertex(x1, y1);
for(int i = 0;i < count1; i ++ ){
  PVector result = findPoint(x1, y1, x1, y1, x3, y3/1.5, x2, y2, steps )[i];
  curveVertex(result.x, result.y);
}

if(nose == true){
vertex(findPoint(x1, y1, x1, y1, x3, y3/1.5, x2, y2, steps )[count1-2].x, findPoint(x1, y1, x1, y1, x3, y3/1.5, x2, y2, steps )[count1-2].y);
quadraticVertex(temp2.x +30, temp1.y +100, temp2.x +50, temp1.y +115);
vertex(temp2.x, temp1.y +120);
//curveVertex(temp1.x, temp1.y);

curveVertex(temp2.x, temp2.y);

}

if(nose == false){
curveVertex(temp1.x, temp1.y);

}

endShape(CLOSE);

}


void getRight(int count1, int count2){


PVector temp1= findPoint(x1, y1, x1, y1, x3, y3/1.5, x2, y2, steps )[count1];
PVector temp2 = findPoint(x1, y1, x1*0.5, y3, x2, y3, x2,y2, steps )[count2];


beginShape();


curveVertex(temp1.x, temp1.y);


for(int i = count1;i < steps; i ++ ){
  PVector result = findPoint(x1, y1, x1, y1, x3, y3/1.5, x2, y2, steps )[i];
  curveVertex(result.x, result.y);
}
curveVertex(x2, y2);

for(int i = steps-1;i>= count2; i -- ){
  PVector result = findPoint(x1, y1, x1*0.5, y3, x2, y3, x2,y2, steps )[i];
  curveVertex(result.x, result.y);
}

curveVertex(temp2.x, temp2.y);

endShape(CLOSE);

}


  
    
}
  


