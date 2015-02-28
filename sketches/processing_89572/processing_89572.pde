
void setup (){
  size (500,400);
}
void draw(){
  stroke(242,199,54);//back eye
  fill(random(0,255),random(0,255), random(0,255));
  ellipse(250,185,35,35);
  fill(89,252,240);
  ellipse(255,180,15,15);
  
  fill(246,247,177);//head
  triangle (400,180, 100,200, 200,300);
  
   fill(random(0,255),random(0,255), random(0,255));//front eye
  ellipse(225,190,35,35);
  fill(89,252,240);
  ellipse(230,185,15,15);
  
fill(245,150,62);//Mouth
stroke(0, 0, 0);
bezier(325, 225, 250, 225, 200, 200, 243, 275);
 
fill(209,72,44);//Tounge
stroke(0, 0, 0);
bezier(250, 250, 250, 225, 200, 200, 243, 275);

fill(255);//teeth
quad (325,225, 230,220, 225,230, 315,235);

fill(255,72,44);//hair
noStroke();
bezier(100,200, 95,100, 80,80, 120,200 );//left strand
bezier(100,200, 120,110, 100,130, 130,200 );//middle strand
bezier(99,200, 120,200, 100,300, 130,200);//lowermiddle
bezier(120,200, 130,100, 130,100, 140,200 );//right strand
}
