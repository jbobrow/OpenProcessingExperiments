
void setup(){
  
size(640,480);
background(169,177,164);
smooth();

}


void draw(){
  
  noStroke();                          //bg beige quad
  fill(213,208,179);
  quad(640,77,335,55,474,263,640,249);
  
  noStroke();                          //grey quad
  fill(137,139,123);
  quad(640,258,79,360,156,363,640,268);
  quad(640,340,72,480,161,480,640,349);
  
  noStroke();                          //grey triangle
  fill(137,139,123);
  triangle(640,463,591,480,640,480);
  
  noStroke();                          //blue quad
  fill(8,72,121);
  quad(0,353,0,389,640,391,640,373);
  quad(195,421,350,418,640,342,416,329);
  
  noStroke();                          //orange triangle
  fill(206,99,50);
  triangle(130,0,225,0,171,93);
  triangle(640,0,604,41,640,92);
  
  noStroke();                          //turqoise arc
  fill(92,142,128);
  arc(630,432,72,72,0,PI);
  
  noStroke();                          //black quad & triangles
  fill(0);
  quad(640,331,595,320,601,370,630,378);
  quad(526,304,484,295,493,338,513,344);
  quad(426,282,394,273,400,308,416,314);
  quad(346,260,323,252,327,282,340,286);
  quad(284,240,264,233,270,261,276,262);
  quad(229,223,214,219,217,241,226,244);
  quad(193,210,182,205,183,228,187,230);
  triangle(162,198,155,217,152,195);
  triangle(135,188,126,185,130,205);
  
  noStroke();                          //yellow quad & triangles
  fill(248,183,52);
  quad(585,318,533,307,538,352,568,362);
  quad(472,292,433,284,440,320,460,328);
  quad(384,270,357,263,364,296,376,298);
  quad(312,248,292,244,296,270,308,275);
  quad(254,231,236,225,240,250,247,252);
  quad(209,217,197,213,199,234,204,236);
  triangle(179,206,165,200,170,223);
  triangle(148,194,138,189,144,213);
  triangle(123,183,116,180,116,200);
  
  strokeWeight(14);                    //red line
  strokeCap(ROUND);
  stroke(154,40,40);
  line(436,323,351,329);
  
  strokeWeight(2); 
  stroke(0);                          //black quad lines
  noFill();
  quad(640,247,492,254,524,274,639,268);
  quad(451,249,451,256,169,258,169,236);
  
  strokeWeight(3);                    //black lines
  stroke(0);
  line(640,20,468,0);
  line(640,127,295,45);
  line(348,59,358,80);
  line(332,56,319,73);
  line(283,43,286,64);
  line(478,480,458,472);
  line(640,49,410,13);
  line(410,13,352,0);
  
  strokeWeight(2);                    //black tracks
  stroke(0);
  line(640,62,413,23);
  line(413,23,340,6);                 
  line(636,50,631,59);                            //smaller
  line(605,46,609,56);
  line(597,45,593,54);
  line(572,40,574,52);
  line(564,39,558,49);
  line(541,35,542,46);
  line(534,34,531,45);
  line(516,32,519,43);
  line(509,31,505,40);
  line(491,27,493,37);
  line(483,27,479,36);
  line(466,23,467,33);
  line(460,23,456,31);
 
  noFill();
  strokeWeight (3);
  stroke (154,40,40);
  ellipseMode (CORNER);
  arc(323, 178, 856, 269, radians(95) , radians(225));
 
  noFill();
  strokeWeight (3);
  stroke (206,99,50);
  ellipseMode (CORNER);
  arc(586,44,856,269, radians(95) , radians(225));
 
}  


