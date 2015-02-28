
void setup(){
  size(300,500);
  background(#F6E3CE);
}
void draw(){
  //println(mouseX+","+mouseY);
  stroke(#61210B);
  fill(#61210B);
  triangle(90,157, 139,144, 115,110); //orejas
  triangle(147,140, 194,147, 176,108);
  stroke(#F07A7A);
  fill(#F07A7A);
  triangle(112,145, 139,144, 125,123);//orejas pequeñas
  triangle(147,140, 170,141, 162,122);
  stroke(#000000);
  fill(#ECAD41); 
  ellipse(150,250, 220,220); // ojo
  stroke(#821E1E);
  fill(#F5DA81);
  triangle(165,250, 123,250, 143,270);//nariz
  fill(#000000); 
  ellipse(114, 196, 20, 40); //ojo
  ellipse(175, 196, 20, 40);
  stroke(#000000);
  fill(#000000); 
  ellipse(114, 196, 19, 39);//ojo
  ellipse(175, 196, 19, 39);
  fill(#60EF95); 
  ellipse(114, 196, 19, 39);
  ellipse(175, 196, 19, 39);
  fill(#000000); 
  ellipse(114, 196, 7, 18);
  ellipse(175, 196, 7, 18);
  fill(#D77A7A); 
  arc(148, 300 , 80, 80, 0, PI); //boca
  fill(#F07A7A); 
  arc(148, 318 , 65, 40, 0, PI); 
  line (114,255, 85,247); //bigotes
  line (114,255, 85,258); 
  line (114,255, 85,272); 
  line (173,256, 200,250);
  line (173,256, 200,261);
  line (173,256, 200,273);
  point (94,253);
  point (94,263);
  point (190,255);
  point (190,263);
  fill(#FFFFFF);
  triangle(119,300, 109,300, 114,310);//dientes
  triangle(187,300, 176,300, 182,310);
  point (138,323);
  point (138,326);
  point (138,329);
  point (150,323);
  point (150,326);
  point (150,329);
  
  
}




