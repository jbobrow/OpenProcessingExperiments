
  /* Schabowicz PS-2 */
/*cute duck*/

 boolean on = false;
 
void setup() {
  size(400,400);
}
 void draw() {
   background(136,197,240);
    
    
 
  
  smooth();
  /*feet*/
  strokeJoin(ROUND); 
  strokeWeight(2);
  stroke(222,123,17);
  fill(222,123,17);
  triangle(150,365,170,375,140,396);
  triangle(210,365,253,368,260,396);
  
  strokeWeight(5);
  strokeJoin(ROUND); // Round corners
  stroke(245,232,117);
  fill(245,234,114);
  ellipse(200,310,150,150);/*body*/
  ellipse(200,200,120,120);/*head*/
  
  /*mouth*/
  noStroke();
  fill(222,123,17);
  ellipse(200,230,100,30);
  ellipse(244,226,16,16);
  ellipse(156,226,16,16);
  
  /*eyes*/
  strokeWeight(1);
  stroke(0);
  fill(255);
  ellipse(170,180,25,25);
  ellipse(230,180,25,25);
  
  noStroke();
  fill(17,152,222);
  ellipse(170,180,15,15);
  ellipse(230,180,15,15);
  
  fill(255);
  ellipse(168,178,5,5);
  ellipse(232,178,5,5);
  
  
  /*wings*/
 
  fill(245,234,114);
  strokeJoin(ROUND);
  strokeWeight(1);
  stroke(0);
  triangle(140,262,150,290,115,310);
  triangle(250,262,240,290,285,310);  
  
  /*bread*/
  
  rectMode(CENTER);
   fill(209,162,115);
 strokeWeight(3);
  stroke(97,62,17);
  arc((mouseX-10),(mouseY-30), 30, 30, -PI, 0);  // upper half of circle
  arc((mouseX+10),(mouseY-30),30,30, -PI,0);

 rect(mouseX,mouseY,50,50);
 noStroke();
 ellipse((mouseX-10),(mouseY-30),30,30);
 ellipse((mouseX+10),(mouseY-30),30,30);

    if (on==true) {
      fill(240,136,114);
    }
  
  
  
  
  /*bread*/

}
                                                
