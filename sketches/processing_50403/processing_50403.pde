
void setup () {
  size (600,600);
  background (255);
  noLoop();
  smooth();
}
void draw() {
  rectMode(CORNER);
  fill(234,158,185);
  rect(50,50,500,500);
  
  
  //hair
  beginShape();
  strokeWeight(7);
  fill(142,70,12);
 triangle(300,100,140,390,450,390);
 endShape();

  
  //dress
  beginShape();
  strokeWeight(7);
  fill(191,30,97);
  triangle(300,200,170,420,430,420);
endShape();

 //stripe
 strokeWeight(20);
 bezier(380,348,321,421,279,416,220,350);
 
  //leftleg
  beginShape();
  strokeWeight(7);
  fill(222,146,113);
  bezier(175,423,90,556,217,660,234,425);
  endShape();
  
  //rightleg
  beginShape();
  strokeWeight(7);
  fill(222,146,113);
  bezier(428,418,523,569,411,632,369,420);
  endShape();
 
 
  // head
  strokeWeight (10);
  fill(222,146,113);
  ellipse (300,200,300,250);
  
  //bangs
 beginShape();
 fill(142,70,12);
 arc(286,63,338,226,0.668,2.340);
 endShape();
 
 //centerbow
 beginShape();
 fill(168,16,20);
 ellipse(302,90,70,70);
 endShape();
 
 
 
  //lefteye
  beginShape();
  strokeWeight(5);
  fill(191,30,97);
  ellipse(224,200,140,140);
  endShape();
  beginShape();
  fill(0);
  ellipse(224,200,100,100);
  endShape();
  beginShape();
  fill(255);
  ellipse(234,190,50,50);
  endShape();
  
  //righteye
  beginShape();
  strokeWeight(5);
  fill(191,30,97);
  ellipse(380,200,140,140);
  endShape();
  beginShape();
  fill(0);
  ellipse(380,200,100,100);
  endShape();
  beginShape();
  fill(255);
  ellipse(390,190,50,50);
  endShape();
  
  //leftbow
  beginShape();
  strokeWeight(10);
  fill(168,16,20);
  bezier(204,130,165,-49,188,-30,274,116);
  endShape();
  
  //rightbow
  beginShape();
  strokeWeight(10);
  fill(168,16,20);
  bezier(328,120,412,-71,411,0,394,128);
  endShape();
  
  //mouth
  beginShape();
  strokeWeight(7);
  noFill();
  bezier(286,276,285,322,327,327,327,273);
  endShape();
  
   //rightarm
  beginShape();
  strokeWeight(7);
 fill(222,146,113);
  bezier(204,372,78,276,129,221,219,341);
  endShape();
  
  //leftarm
  beginShape();
  strokeWeight(7);
  fill(222,146,113);
  bezier(408,384,535,250,450,268,387,350);
}

  


