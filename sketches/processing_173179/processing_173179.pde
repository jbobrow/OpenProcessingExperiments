
  float i = 231;
  int j =74;
  int k =193;
  float l = 331;
  float m = 323;
  float n = 319;
  int o = 587;
  int p = 408;
  int w= 180;
  int x= 0;
  int y = 180;
 
void setup(){
  size(1200,600);
  stroke(3);
  
}

void draw(){
  
 //FONS
  background(30,144,255);
  fill(0,128,0);
  rect(0,500,width,height);
  
  // PART NATURALESA
  if(mouseX>80){
 
  frameRate(3);  
  //arbre
  noStroke();
  fill(205,133,63);
  beginShape();
  curveVertex(120,  499);
  curveVertex(120, 499);
  curveVertex(156, 479);
  curveVertex(156, 300);
  curveVertex(140, 298);
  curveVertex(200, 298);
  curveVertex(200, 298);
  curveVertex(213,488);
  curveVertex(213,488);
  curveVertex(234,  499);
  curveVertex(234, 499);
  endShape();
  fill(0,255,0);
  ellipse(131,294,60,60);
  ellipse(175,276,60,60);
  ellipse(143,264,60,60);
  ellipse(203,264,60,60);
  ellipse(216,294,60,60);
  ellipse(173,256,60,60);
  
  
  //sol i els rajos
  fill(255,140,0);
  noStroke();
  fill(255,255,0);
  ellipse(321,64,80,80);
  stroke(255,140,0);
  line(280,34,256,13);
  line(284,94,256,112);
  line(356,33,385,12);
  line(354,96,380,114);
  stroke(0,0,0);
  point(302,47);
  point(332,47);
  arc(316,72, 25, 25,radians(x), radians(w));
  
  //cireres
  noStroke();
  fill(255,0,0);
  ellipse(232,l,15,15);
  ellipse(138,286,15,15);
  ellipse(187,256,10,10);
  stroke(1);
  line(i,m,i,n);
  
  //ocell1
  stroke(1);
  strokeWeight(3);
  line(87,j,123,55);
  line(123,55,141,69);
  line(141,69,159,55);
  line(159,55,195,j);
  //ocell2
  stroke(1);
  strokeWeight(3);
  line(254,k,290,174);
  line(290,174,308,188);
  line(308,188,326,174);
  line(326,174,362,k);
  
  
  //IF que fa caure la cirera
  if(l < 485){
    l= l + 20;
  }else if(l >= 405){
    l = 331;
  }
  if(m < 475){
    m =m+20;
  }else if (m >=455){
    m= 323;
  }
  if(n < 470){
    n =n+20;
  }else if (n >=455){
    n= 319;
  }
  
  
   //IF que fa moure les ales dels ocells.
  if(j == 74){
  j=j-40;
  }else if (j == 34){
  j=j+40;
  }
  if(k == 193){
  k=k-40;
  }else if (k == 153){
  k=k+40;
  }
  
 }
 
 //PART HUMÀ
 if(mouseX>440){
   frameRate(2);
   
   
   //variables pel sol
   w= w +180;
 //humà
 noFill();
 ellipse(580,382,25,25);
 stroke(2);
 line(534,472,571,393);
 line(526,425,534,405);
 line(534,405,591,428);
 line(591,428,o,p);
 line(534,472,547,491);
 line(534,472,509,489);
 point(575,378);
 point(584,378);
 arc(580,386, 5, 5,radians(0), radians(55));
 fill(0);
 text("Hola! sóc l'esser humà", 625,300);
 text("i he arribat a la terra!",635,325);
 noFill();
 ellipse(682,307,150,75);
 triangle(617,326,597,364,632,335);

 //If per moure la ma de l'humà
 if (o == 587){
   o=o+20;
 }else if(o == 607){
   o=o-20;
 }
 if ( p == 408){
   p = p +20;
 }else if( p == 428){
   p = p-20;
 }
 
 
}

// PART CENTRAL NUCLEAR
if(mouseX > 815){
  //variables pel sol
  w = 360;
  x = 180;
  
  //BUCLE central nuclear
  frameRate(3);
  noStroke();
  
  float r = 987;
  float s = 203;
  float t = 125;
  float v = 175;
  int q = 0;
  
  while(q<10000){
    fill(150);
    ellipse(r,s,t,v);
    r=r+random(50);
    s=s-50;
    v=v + random(5);
    t=t+random(45);
    q=q+1;
}

  
// central nuclear
 noStroke();
 fill(105,105,105);
 beginShape();
  curveVertex(847,  498);
  curveVertex(847,  498);
  curveVertex(906,227);
  curveVertex(906,227);
  curveVertex(1100,227);
  curveVertex(1100,227);
  curveVertex(1142,498);
  curveVertex(1142,498);
  endShape();
  
  
  //simbol central nuclear
  fill(255,255,0);
  ellipse(1000,375,100,100);
  fill(0);
  ellipse(1000,375,20,20);
  triangle(957,361,976,338,991,369);
  triangle(1024,339,1039,361,1010,370);
  triangle(984,413,1013,413,999,386);
    
   
  }



}
   
  



