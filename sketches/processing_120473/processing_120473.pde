
//size,etc
size(400,565);
background(255);
smooth();

//Ccore
noStroke();
fill(255,0,0);  //red
ellipse(200, 282, 400, 400);
fill(255,255,255);  //backgroundColor
ellipse(200, 282, 300, 300);
stroke(255,255,255);  //backgroundColor
for(int x1=200; x1<400; x1++){
  line(x1,0,x1,565);
}
for(int y1=0; y1<282; y1++){
  line(0,y1,200,y1);
}

//Bcore
noStroke();
fill(0,0,0);  //black
ellipse(200, 282, 300, 300);
fill(255,255,255);  //backgroundColor
ellipse(200, 282, 200, 200);
stroke(255,255,255);  //backgroundColor
for(int y2=0; y2<282; y2++){
  line(0,y2,400,y2);
}

//Acore
noStroke();
fill(255,0,0);  //red
ellipse(200, 282, 200, 200);
stroke(255,255,255);  //backgroundColor
for(int y3=0; y3<282; y3++){
  line(0,y3,200,y3);
}
noStroke();
fill(128,128,128);  //glay
ellipse(200, 282, 100, 100);

//coreEllipse
noStroke();
fill(0,0,0);  //black
ellipse(150, 232, 100, 100);

//hidariue
stroke(0,0,0);  //black
for(int y4=0; y4<282; y4++){
  line(0,y4,400,0);
}
fill(128,128,128);  //glay
ellipse(175, 75, 50, 50);
noStroke();
fill(255,0,0);  //red
ellipse(150, 50, 50, 50);

//hidarisita
//migiue
stroke(128,128,128);  //glay
for(int y5=565; y5>450; y5--){
  line(0,y5,200,565);
}

//migisita
stroke(255,0,0);  //red
for(int y6=565; y6>400; y6--){
  line(0,565,400,y6);
}
fill(0,0,0);  //black
ellipse(275, 525, 50, 50);
noStroke();
fill(128,128,128);  //glay
ellipse(250, 500, 50, 50);

//migiue
stroke(128,128,128);  //glay
for(int y7=0; y7<128; y7++){
  line(200,0,400,y7);
}

for(int y=0; y<=height; y+=20){
  for(int x=0; x<=width; x+=20){
 
    if(x > 1 && x < 399){

    }
    else{
      noStroke();
      fill(255);
      ellipse(x, y, 5, 5);
    }

  }
}


