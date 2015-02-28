




size(250, 500);

smooth();
background(0);
strokeWeight(1);

for(int i = 0; 
i < width; 
i++) 
{
 
 
  //colours
  float g = random(168);
  float b = random(255);
  float r = random(95);
  float filltransperency = random(20);
  float stroketransperency = (20);
  
  //sizes
  
  float rectx = random(500);
  float recty = 0; 
  float rectwidth = random(100);
  float recthigh = random(500);
  
  float recty2 = random(500);
  float rectx2 = 0;
  float rectwidth2 = random(500);
  float recthigh2 = random(100);
  
  float recty3 = random(0);
  float rectx3 = random(500);
  float rectwidth3 = random(500);
  float recthigh3 = random(100);
  
  float recty4 = random(0);
  float rectx4 = random(500);
  float rectwidth4 = random(100);
  float recthigh4 = random(500);
  
  float ran = random(500);
  float white = random(255);
  
  
  //grid
  float x = 0;
  float y = 0;
  float x2 = 500;
  float xx = 0;
  float yy = 0;
  float yy2 = 500;
  
  fill(r,g,b,filltransperency);
  stroke(r,g,b,stroketransperency);
  rect(rectx, recty, rectwidth, recthigh);
  rect(rectx2, recty2, rectwidth2, recthigh2);
  rect(rectx3, recty3, rectwidth3, recthigh3);
  rect(rectx4, recty4, rectwidth4, recthigh4);
 
  
 line(0,ran,500,ran);
  line(ran, 500, ran, 0);
  
  

  
  stroke(93,126,177);
  
  //bottom lines
  line(0,450,125,400);
  line(0,470,130,405);
  line(0,495,135,410);
  //next
  line(85,470,88,315);
  line(90,473,95,325);
  line(95,470,105,340);
  //next
  line(85,320,135,422);
  line(85,320,128,427);
  line(85,320,121,432);
  //next
  line(83,465,200,420);
  line(80,455,195,419);
  line(83,445,200,416);
  //long lines
  line(185,430,100,70);
  line(190,430,110,50);
  line(195,435,120,30);
  //next
  line(120,30,35,90);
  line(110,50,50,90);
  line(100,70,65,90);
  
  line(35,90,205,80);
  line(35,90,50,125);
  
  line(40,115,200,125);
  line(205,75,200,125);
  line(40,108,205,110);
  line(40,100,210,90);
  
  line(206,80,250,200);
  line(203,90,250,225);
  line(200,108,250,253);
  line(200,125,250,290);
  
  
  
 
  
  
}



