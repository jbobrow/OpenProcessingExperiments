


size(250, 500);
smooth();
background(0);
strokeWeight(1);

for(int i = 0; 
i < width; 
i++) 
{
 
 
  //colours
  float g = random(200);
  float b = random(255);
  float r = random(255);
  float filltransperency = (20);
  float stroketransperency = (20);
  float lineg = random(250);
  
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
  
  float qx = random(500);
  float qy = random(0,160);
  float qx2 = random(500);
  float qy2 = random(0,160);
  float qx3 = random(500);
  float qy3 = random(0,160);
  float qx4 = random(500);
  float qy4 = random(0,160);
  
  float qqx = random(500);
  float qqy = random(170,330);
  float qqx2 = random(500);
  float qqy2 = random(170,330);
  float qqx3 = random(500);
  float qqy3 = random(170,330);
  float qqx4 = random(500);
  float qqy4 = random(170,330);
  
  float qqqx = random(500);
  float qqqy = random(360,500);
  float qqqx2 = random(500);
  float qqqy2 = random(360,500);
  float qqqx3 = random(500);
  float qqqy3 = random(360,500);
  float qqqx4 = random(500);
  float qqqy4 = random(360,500);
  
  
 
  
  fill(r,g,b,filltransperency);
  stroke(r,g,b,stroketransperency);
  rect(rectx, recty, rectwidth, recthigh);
  rect(rectx2, recty2, rectwidth2, recthigh2);
  rect(rectx3, recty3, rectwidth3, recthigh3);
  rect(rectx4, recty4, rectwidth4, recthigh4);
  
  

  line(0,ran, 500,ran);
  line(ran,500,ran,0);

  
  
  //first quad
  stroke(167,186,190);
  fill(255,255,255,10);
  quad(0,50,0,110,250,130,250,30);
 
  //second quad
  
  fill(255,255,255,10);
  quad(0,200,0,300,250,280,250,220);
   //quad in front
  fill(255,255,255,3);
  quad(0,200,0,300,250,130,250,30);
  //third quad
  fill(255,255,255,10);
  quad(0,390,0,450,250,470,250,370);
  //second quad in front
   fill(255,255,255,3);
   quad(250,220,0,390,0,450,250,280);
   //random white quads 2
  stroke(255,255,255,0);
  fill(255,255,255,20);
  quad(qqx,qqy,qqx2,qqy2,qqx3,qqy3,qqx4,qqy4);
  //random white quads 3
  stroke(255,255,255,0);
  fill(255,255,255,20);
  quad(qqqx,qqqy,qqqx2,qqqy2,qqqx3,qqqy3,qqqx4,qqqy4);
   //random white quads
  stroke(255,255,255,0);
  fill(255,255,255,20);
  quad(qx,qy,qx2,qy2,qx3,qy3,qx4,qy4);
  
  
  
}



