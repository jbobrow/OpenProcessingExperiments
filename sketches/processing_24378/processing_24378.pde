


size(250, 500);
smooth();
background(0);
strokeWeight(1);

for(int i = 0; 
i < width; 
i++) 
{


  //colours
  float g = random(186);
  float b = random(255);
  float r = random(170);
  float filltransperency = random(20);
  float stroketransperency = (20);
  float white = (255);
  

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

  float quadx = 0;
  float quadx2 = 8.3;
  float quady = 230;
  float quady2 = 330;
  float quady3 = 346.7;
  float quady4 = 236.7;

  fill(r,g,b,filltransperency);
  stroke(r,g,b,stroketransperency);
  rect(rectx, recty, rectwidth, recthigh);
  rect(rectx2, recty2, rectwidth2, recthigh2);
  rect(rectx3, recty3, rectwidth3, recthigh3);
  rect(rectx4, recty4, rectwidth4, recthigh4);

   
   line(0,ran, 500,ran);
  line(ran,500,ran,0);
  
  stroke(103,124,140);
  fill(255,255,255,3);
  //lines
  line(0,250,30,330);
  line(0,283,40,395);
  //first wall
  fill(white,white,white,3);
  quad(0,230,0,330,50,467,50,333);
  fill(white,white,white,10);
  quad(50,333,50,467,220,300,220,260);
  fill(white,white,white,2);
  quad(160,160,160,180,220,300,220,258);
  fill(white,white,white,3);
  quad(130,170,130,190,160,180,160,160);
  fill(white,white,white,2);
  quad(120,150,120,170,130,190,130,170);
  fill(white,white,white,3);
  quad(50,150,50,170,120,170,120,150);
  fill(white,white,white,2);
  quad(30,80,30,100,50,170,50,150);
  fill(white,white,white,10);
  quad(30,80,30,100,250,110,250,50);
 
}

