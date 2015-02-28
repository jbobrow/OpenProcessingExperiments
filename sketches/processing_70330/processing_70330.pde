
size(175,179);
background(20);
noStroke();
smooth();
fill(222,39,0);     //red bottom rect//
rect(0,91,175,91);

fill(#fefa80);       
rect(0,90,175,21);      //yello mid rect//


fill(#fefa80);        
rect(0,124,128,4);       /*yello horiz rect 1*/
rect(0,161,140,5);       /*yello horiz rect 2*/
rect(0,133,2,46);        /*yello vert rect 1*/
rect(34,131,5,49);       /*yello vert rect 2*/
rect(66,129,5,50);       /*yello vert rect 3*/
rect(101,129,6,51);      /*yello vert rect 4*/



/*curve(cpx1, cpy1, x1, y1, x2, y2, cpx2, cpy2);*/
/*cpx1, cpy1 Coordinates of the first control point
x1, y1  Coordinates of the curve’s starting point
x2, y2  Coordinates of the curve’s ending point
cpx2, cpy2 Coordinates of the second control point*/


//corner palm//
beginShape();
fill(100,187,153);
curve(43,-20,43,0,-2,64,-50,64);
triangle(0,0,0,64,51,0);
endShape();


//second palm frond//
beginShape(); 
pushMatrix();
translate(67,30);
rotate(radians(35));
ellipse(0,0,40,89);
popMatrix();
//angle += 0.5;


//second palm line//
beginShape(); 
fill(238,238,204);
triangle(90,0,55,65,93,0);
endShape();


//last palm frond//
beginShape(); 
fill(100,187,153);
curveVertex(120,0); // the first control point
curveVertex(136,0); // is also the start point of curve
curveVertex(100, 50);
curveVertex(117,86);
curveVertex(175, 52);
curveVertex(175,0); // the last point of curve
curveVertex(175,0); // is also the last control point
endShape();
  
  
//last palm line//
beginShape(); 
fill(238,238,204);
triangle(145,0,153,52,149,0);
endShape();

//yello behind head//
beginShape(); 
fill(#fefa80);
vertex(113,92);
vertex(138,68);
vertex(175,60);
vertex(175,92);
endShape();
 
//chicas hair// 
beginShape();
fill(0,0,0);
curveVertex(175,50);//control point
curveVertex(175,53);
curveVertex(157,63);
curveVertex(137,69);
curveVertex(135,78);
curveVertex(131,91);
curveVertex(123,108);
curveVertex(129,131);
curveVertex(130,158);
curveVertex(159,163);
curveVertex(175,83);
curveVertex(175,83);
endShape();

//chicas neck//
beginShape();
fill(217,107 ,43);
curveVertex(161,159);
curveVertex(161,159);
curveVertex(162,170);
curveVertex(160,179);
curveVertex(175,179);
curveVertex(175,159);
endShape();

//chicas face//
beginShape();
fill(241,110,41);
curveVertex(176,83);//control point
curveVertex(175,83);
curveVertex(170,85);
curveVertex(149,87);
curveVertex(149,109);
curveVertex(145,122);
curveVertex(145,133);
curveVertex(151,146);
curveVertex(165,165);
curveVertex(163,179);
vertex(175,179);
vertex(175,83);
endShape();



//brow//
stroke(3); 
strokeWeight(3.5);
curve(154,160,156,116,175,111,170,125); 

//eye//
beginShape();
noStroke();
fill(0,0,0);
curveVertex(158,119);
curveVertex(158,119);
curveVertex(168,116);
curveVertex(174,119);
curveVertex(167,122);
curveVertex(158,119);
curveVertex(158,119);
endShape();
