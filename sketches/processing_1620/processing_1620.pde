

int i; 

void setup() 
{  
  size( 400 , 400 ); 
  smooth(); //
  background( 25 ); 
}

void draw(){ 

 //frameRate(15);  
 
  fill(random (44),random (130),random (198),random(30)); 
fill(random(0,255),random(0,255),random(0,255)); 
 // fill ( random(255) , random(225) , (155) , 58 ); 

   noStroke();
   fill ( random(25) , random(205) , (55) , 68 ); 
   ellipse( 160, 140 , random(90) , random(90) ); 
  
  fill(random(0,255),random(0,255),random(0,255)); 
  ellipse(130,90,5,3); 
  ellipse(120,95,5,3);
  ellipse(110,103,5,3); 
  ellipse(103,109,5,3);
  ellipse(98,116,5,3); 
  ellipse(92,124,5,3);
  ellipse(89,132,5,3); 
  ellipse(86,139,5,3); // sol yan buraya kadar
  ellipse(137,88,5,3); // sağ tarafı
  ellipse(145,85,5,3);
  ellipse(153,83,5,3);
  ellipse(162,83,5,3); 
  ellipse(170,83,5,3);
  ellipse(179,85,5,3); 
  ellipse(189,88,5,3);
  ellipse(197,92,5,3); 
  ellipse(205,95,5,3); 
  ellipse(213,102,5,3);
  ellipse(220,108,5,3);
  ellipse(225,118,5,3);
  ellipse(229,125,5,3);
  ellipse(235,132,5,3); 
  ellipse(237,139,5,3);
  ellipse(239,145,5,3);
  ellipse(240,152,5,3);
  ellipse(240,159,5,3);
  ellipse(239,165,5,3);
  ellipse(237,172,5,3);
  ellipse(235,180,5,3);
  ellipse(231,188,5,3);
  ellipse(227,195,5,3);
  ellipse(220,200,5,3);
  ellipse(214,207,5,3);
  ellipse(205,214,5,3);
  ellipse(192,220,5,3);
  ellipse(180,222,5,3);
  ellipse(170,222,5,3); // sol yan alt satır
  ellipse(86,149,5,3);
  ellipse(88,157,5,3);
  ellipse(90,164,5,3);
  ellipse(92,171,5,3);
  ellipse(94,180,5,3);
  ellipse(96,187,5,3);
  ellipse(98,193,5,3);
  ellipse(98,199,5,3);
  ellipse(96,206,5,3);  // sol kıvrım kuyruk
  ellipse(90,212,5,3);
  ellipse(84,219,5,3);
  ellipse(78,226,5,3);
  ellipse(68,232,5,3);
  ellipse(60,234,5,3);
  ellipse(52,233,5,3);
  ellipse(45,236,5,3);
  ellipse(38,240,5,3); // sol kıvrım durdu alt satır sağ kıvrım başı
  ellipse(170,230,5,3);
  ellipse(174,240,5,3);
  ellipse(179,248,5,3);
  ellipse(183,256,5,3);
  ellipse(188,262,5,3);
  ellipse(194,270,5,3);
  ellipse(193,278,5,3);
  ellipse(191,285,5,3);
  ellipse(187,292,5,3);
  ellipse(182,299,5,3);
  ellipse(176,306,5,3);
  ellipse(168,302,5,3);
  ellipse(160,299,5,3);
  ellipse(152,290,5,3);
  ellipse(148,283,5,3);
  ellipse(140,275,5,3);
  ellipse(137,269,5,3);
  ellipse(130,265,5,3);
  ellipse(120,262,5,3);
  ellipse(108,268,5,3);
  ellipse(100,276,5,3);
  ellipse(90,279,5,3);
  ellipse(76,284,5,3);
  ellipse(70,289,5,3);
  ellipse(62,289,5,3);
  ellipse(52,288,5,3);
  ellipse(45,285,5,3);
  ellipse(39,280,5,3);
  ellipse(33,274,5,3);
  ellipse(28,265,5,3);
  ellipse(26,254,5,3);
  ellipse(29,248,5,3);
 

  
 
 fill ( random(25) , random(205) , (55) , 68 ); 

 i += random( 50 ); 
     
    if ( i > 1600 ) 
    { 
        i = 0; 
    } 
     
ellipse 
 
( i%100 * 30, i/20 * 10, 10, 10 );



}


