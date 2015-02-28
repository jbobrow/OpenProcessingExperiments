
   size(1100, 850);
   background (44, 79, 100);
    //size(2200, 1700, PDF, "wallpaper.pdf");
   
  strokeCap(ROUND);
   
int rows = 8;
int cols = 12;
int distanceX = (width/rows)+250;
int distanceY = (height/cols)+250;
float whalesize = 0.72;
int streamcols = width/60;
int streamrows = height/60;
     
     
  smooth();
   
   
 for (int l = 0; l<= streamcols; l++)
 {
 strokeWeight(3);                                          //wave background
 stroke(52, 91, 115);
 noFill();
  
   pushMatrix();
   translate(90*l, -10);
    
      
   for (int m = 0; m<= streamrows; m++)
    
   {
      
     pushMatrix();
     translate(0, 100*m);
 for (int stream = 0; stream <= 4; stream++)
 {
 arc (0+stream*16, 70-stream*3, 50, 50, 0, PI/2);
 arc (50+stream*16, 70-stream*3, 50, 100, PI, PI*1.5);
 arc (50+stream*16, 30-stream*3, 20, 20, -PI*0.5, PI/1.2);
 }
 popMatrix();
 }
 popMatrix();
 }
   
   
   
   
  for (int i= 0; i <= rows; i++){          //columns iteration
   
 noStroke();
  pushMatrix();
   
  translate(80+i*distanceX, 0);
   
float alternation = -1;                    //this keeps the whales in alternatve alighnment
   
  for (int k=0; k<= cols; k++){            //rows iteration
    pushMatrix();
    translate (alternation*94, k*distanceY);
    alternation = alternation*-1;
     
  for (float j=0; j <=2; j = j+0.2)        //rotation iteration
  {
     
    pushMatrix();
    scale(whalesize);  //this controls size of the whales
  rotate (PI*j);        //this rotates the whales
  translate (100, -30);
  fill(255);
  triangle(-56, 73, 18, 88, 18, 98);
   
  fill(152,182,203);
 ellipse(50, 87, 70, 25);
  rect(50, 75, 40, 10);
 ellipse(68, 104, 70, 27);
  rect(50, 105, 40, 10);
  ellipse(90, 95, 40, 38);
  rect(40,85, 40, 20);
  ellipse(97,97, 30,30);
 beginShape();
 curveVertex(21, 91);
 curveVertex(21,91);
 curveVertex(30,104);
 curveVertex(42,109);
 curveVertex(47,110);
 curveVertex(61, 86);
 curveVertex(61, 86);
 endShape();
 beginShape();
 curveVertex(91, 78);
 curveVertex( 91, 78);
 curveVertex( 118, 78);
 curveVertex(118,66);
 curveVertex(113, 60);
 curveVertex(108, 54);
 curveVertex(111, 52);
 curveVertex(119,53);
 curveVertex(124, 57);
 curveVertex(132, 49);
 curveVertex(142,49);
 curveVertex(138, 60);
 curveVertex(129, 70);
 curveVertex(126, 99);
 curveVertex(100,108);
 curveVertex(100,110);
 curveVertex(100,110);
 endShape();
 ellipse (60, 100, 50, 20);
 fill(255);
 ellipse(34, 84, 14, 14);
 fill(0);
 ellipse(34, 81, 9, 9);
 fill(255);
 ellipse(32, 82, 4, 4);
 fill(170,170,170);
 arc(54, 92, 80, 46, 0.1, PI/0.99);
 ellipse (80, 100, 50, 20);
 stroke(120,120,120);
 strokeWeight(1.5);
 line(20, 105, 20, 93);
 line(25,108, 25, 93);
 line(30,109, 30, 93);
 line(35,111, 35, 93);
 line(40,113, 40, 93);
 line(45,114, 45, 93);
 noStroke();
 popMatrix();
  
  }popMatrix();
  
 }popMatrix();}
 
  
  //exit();
                
