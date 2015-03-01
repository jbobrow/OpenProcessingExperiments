


size(600,300);
background(147);

fill(0);
rect(300,0,300,300);
////右-------変動----------
//---background

for(int a = 0; a<100; a++){
  noStroke();
  //red
  fill(240,0,0,100);
  rect(random(300,600),random(300),7/2,7/2);
  //blue
  fill(0,0,240,100);
  rect(random(300,600),random(300),7/2,7/2);
 //green
  fill(0,240,0,100);
  rect(random(300,600),random(300),7/2,7/2);
}
//background_rect------
for(int x =300; x<600; x+=6){
  for(int y =0; y <300; y+=6){
    noFill();
    stroke(+y*2,255-y,232+y/3,255-y);
    strokeWeight(1/2);
    rect(x,y,6,6);
  }
}
//line
stroke(250,168,81);
strokeWeight(1);
for(int i =100; i<200; i+=40){
noFill();
bezier(300,i,400,random(50,300),500,random(50,300),600,i);
}

  
//---box
for(int y = 0; y<=height; y+=5){

stroke(0);  
strokeWeight(2);
//red_box
fill(224+y,86-y,86-y,255-y);
rect(305,50+y,12,12);
rect(365,85+y,12,12);
rect(425,60+y,12,12);
rect(485,100+y,12,12);
rect(545,20+y,12,12);

//blue_box
fill(86-y,86-y,224+y,225-y*2);
rect(325,220+y,12,12);
rect(385,260+y,12,12);
rect(445,230+y,12,12);
rect(505,280+y,12,12);
rect(565,200+y,12,12);

//green_box
fill(86-y,224+y,86-y,225-y*3/2);
rect(345,120+y,12,12);
rect(405,150+y,12,12);
rect(465,135+y,12,12);
rect(525,170+y,12,12);
rect(585,190+y,12,12);
}


//左------安定------------
int eSize=270;
//background
for(int x =0; x<300; x+=6){
  for(int y =0; y <300; y+=6){
    noFill();
    stroke(204,248,250);
    strokeWeight(1/3);
    rect(x,y,6,6);
  }
}

//line--------
stroke(255);
strokeWeight(1);
line(0,120,299,120);
line(0,115,299,115);
line(0,125,299,125);
stroke(147);
strokeWeight(1);

//box---------
for(int x =-10; x<295; x+=5){
//red_box   
   fill(240,0,0,120);
   rect(x,30,5,5);
//blue_box
   fill(0,0,240,120);
   rect(x,35,5,5);
//green_box
   fill(0,240,0,120);
   rect(x,40,5,5);
}

for(int y =0; y<=height;y+=5){
  stroke(0);
  strokeWeight(2);
  fill(255);

//red_box
fill(255,200,200);
rect(5,eSize+y,12,12);
rect(65,eSize+y,12,12);
rect(125,eSize+y,12,12);
rect(185,eSize+y,12,12);
rect(245,eSize+y,12,12);

//blue_box
fill(200,200,250);
rect(25,eSize+y,12,12);
rect(85,eSize+y,12,12);
rect(145,eSize+y,12,12);
rect(205,eSize+y,12,12);
rect(265,eSize+y,12,12);

//green_box 
fill(200,250,200);
rect(45,eSize+y,12,12);
rect(105,eSize+y,12,12);
rect(165,eSize+y,12,12);
rect(225,eSize+y,12,12);
rect(285,eSize+y,12,12);
}


