

size(250, 500);
smooth();
background(0);
strokeWeight(.5);

for(int i = 0; 
i < width; 
i++) 
{
 
 
  //colours
  float g = random(150);
  float b = random(255);
  float r = random(0);
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
  
  
  
  
  fill(r,g,b,filltransperency);
  stroke(r,g,b,stroketransperency);
  rect(rectx, recty, rectwidth, recthigh);
  rect(rectx2, recty2, rectwidth2, recthigh2);
  rect(rectx3, recty3, rectwidth3, recthigh3);
  rect(rectx4, recty4, rectwidth4, recthigh4);
  
stroke(0,97,119);
line(140,500,250,455);
line(199,500,250,475);

stroke(0,0,0,85);
line(0, 500, ran, ran);
  line(500,0,ran,ran);
  


}



