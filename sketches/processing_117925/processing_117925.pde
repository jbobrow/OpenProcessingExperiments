
float s;
int n;

void setup(){
 size(800,300); 
 background(0);
}

void draw(){
  println(mouseX+"  "+mouseY);
  fill(255, 3);
  noStroke();
  rect(0, 0, width*2, height*2);
  
 

  colorMode(HSB);
  noStroke();
//array----------------------------------------------------------
 n=round(hour())/2;
 float[] numberh;
 numberh= new float[n];
 for(int i=0;i<n;i+=1){
  numberh[i]= map(second(), 0, 60, 0,(i+1)*height/n);
  } 
  
  float[] numberh1;
 numberh1= new float[n];
 for(int i=0;i<n;i+=1){
  numberh1[i]= map(second(), 0, 60, (i+1)*height/n,0);
  } 
 
 String[] Month;
Month= new String[12];
Month[0]= "January";
Month[1]= "February";
Month[2]= "March";
Month[3]= "April";
Month[4]= "May";
Month[5]= "June";
Month[6]= "July";
Month[7]= "August";
Month[8]= "September";
Month[9]= "October";
Month[10]= "November";
 Month[11]= "December"; 
 //---------------------------------------------------------- 

 // float s1 = map(second(), 0, 60, 0,height );
  float s2 = map(second(), 0, 60, 0, height);
  float s3 = map(second(), 0, 60, height, 0);
    float s4 = map(second(), 0, 60, 100, 360);
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 10, height-10);
   float m1 = map(minute() + norm(second(), 0, 60), 0, 60, 0, width-50);
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 10, height-10) ;
  

//text-----------------------------
//months
fill(200,60);
  textSize(100);
  text(Month[month()-1],50,100);
//years
  fill(200,60);
  textSize(180);
  text(year(),270,300);
//monutes
 pushMatrix();
 translate(7,20);
 rotate(PI/2);
  fill(90);
  textSize(60);
  text("minutes",0,0);
popMatrix();
//hours
pushMatrix();
 translate(width-70,height/2-70);
 rotate(PI/2);
  fill(90);
  textSize(80);
  text("hours",0,0);
popMatrix();

  
//---------------------------------------
 
 //line
  noFill();
  strokeWeight(1);
  stroke(s4,255,255);
  
beginShape();
curveVertex(15,m);
curveVertex(15,m);
for(int i=1;i<n;i+=2){
  curveVertex(i*(width-40)/n,s3-numberh1[i-1]+20);
  curveVertex((i+1)*(width-40)/n,-numberh[i-1]+s2+20);
}
curveVertex(width-20,h);
curveVertex(width-20,h);
endShape();

//two circles and text
fill(s4,255,255);
ellipse(0+15,m,30,30);
ellipse(width-20,h,50,50);
fill(0);
textSize(19);
text(round(minute()),0+8,m+4);
textSize(28);
text(floor(hour()),width-40,h+7);

//boxs
rectMode(CENTER);
for(int j=1;j<n;j+=2){
  fill(s4,255,255);
 rect(j*(width-40)/n,s3-numberh1[j-1]+20,10,10);
 rect((j+1)*(width-40)/n,-numberh[j-1]+s2+20,10,10);
 //fill(0);
 //text(j,j*(width-0)/n,s3);
  //text(j+1,(j+1)*(width-0)/n,s1);
}

 
}
