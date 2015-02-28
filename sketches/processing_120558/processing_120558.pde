
int eSize = 5;

int x; 
int y;

   size(400,565);
   background(255,255,180);
   
   // migisita-maru
  noStroke();
  fill(255,51,0);
  ellipse(347,513,90,90);
  
   fill(0);
  ellipse(271,533,55,55);
  
   fill(0);
  ellipse(283,487,30,30);
  
   fill(0);
  ellipse(370,445,45,45);
  
   fill(0);
  ellipse(305,435,70,70);
  
   fill(255,0,0);
  ellipse(350,400,30,30);
  
   fill(0);
  ellipse(365,365,17,17);
  
   fill(0);
  ellipse(380,400,20,20);
  
   fill(0);
  ellipse(240,490,40,40);
  
   fill(0);
  ellipse(250,450,30,30);
  
   fill(255,0,0);
  ellipse(215,535,45,45);
  
  fill(255,51,0);
  ellipse(210,460,20,20);
  
   fill(0);
  ellipse(250,400,30,30);
  
   fill(0);
  ellipse(200,420,35,35);
  
   fill(0);
  ellipse(180,500,25,25);
  
   fill(0);
  ellipse(150,530,23,23);
  
   fill(0);
  ellipse(117,550,10,10);
  
  fill(0);
  ellipse(320,375,20,20);
  
  fill(0);
  ellipse(285,350,15,15);
  
   fill(0);
  ellipse(230,360,13,13);
  
  fill(0);
  ellipse(200,330,8,8);

   fill(0);
  ellipse(180,375,15,15); 
 
   fill(0);
  ellipse(150,435,20,20); 
  
   fill(0);
  ellipse(156,390,7,7);
  
   fill(0);
  ellipse(260,310,8,8);
  
   fill(0);
  ellipse(130,480,10,10);
  
  
  
  // shikaku
   for(int x1 = 0; x1 <= width; x1 += 20){
    for(int y1 = 0; y1 <= height; y1 += 20){
      fill(0);
      if(x1 > 80 && x1 < 320){
        fill(255);
      }
      
      rect(x1, y1, eSize, eSize);
    }
  }
  
  //sen
  stroke(0);
  strokeWeight(2);
  line(0,70,400,70);
  
  stroke(0);
  strokeWeight(2);
  line(50,0,50,565);
  
  
  
  //sen-maru
  noStroke();
  fill(255,0,0);
  ellipse(285,70,30,30);
  
  fill(192,192,192);
  ellipse(230,70,14,14);
  
  fill(0);
  ellipse(50,132,18,18);
  
  fill(192,192,192);
  ellipse(50,380,35,35);
  
 
  
  
  
  
  
  


