
int rectColor1 = color(0,255,0);
int rectColor2 = color(0,0,255);
int posX = 0;
int posY = 20;
boolean llensador = false;
int posVar = 0;

  int nariz1 = 165;
  int nariz2 = 250;
  int nariz3 = 123;
  int nariz4 = 250;
  int nariz5 = 143;
  int nariz6 = 270;
  
  float oreja1 = random(115,115);
  float oreja2 = random (110,110);
  float oreja3 = random(176,176);
  float oreja4 = random (108,108);
 
  
void setup(){
  size(300,500);
  background(#F6E3CE);
}
void draw(){
  println(mouseX+","+mouseY);
  background(#F6E3CE);
  stroke(#61210B);
  fill(#61210B);
  //triangle(90,157, random
  triangle(90,157, 139,144, oreja1,oreja2); //orejas
  
  triangle(147,140, 194,147, oreja3,oreja4);
  stroke(#F07A7A);
  fill(#F07A7A);
  
  triangle(112,145, 139,144, 125,123);//orejas pequeñas
  triangle(147,140, 170,141, 162,122);
  stroke(#000000);
  fill(#ECAD41); 
  ellipse(150,250, 220,220); // ojo
  stroke(#821E1E);
  fill(#F5DA81);
  
  triangle(nariz1,nariz2,nariz3,nariz4,nariz5,nariz6);//nariz
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
 line (114,255, random (81,87), random(243,250));
  //line (114,255, 85,247); //bigotes
 line (114,255, random (81,87), random(255,263));
  //line (114,255, 85,258);
 line (114,255, random (81,87), random(267,276)); 
  //line (114,255, 85,272); 
 line (173,256, random (195,205), random(245,255));
 // line (173,256, 200,250);
 line (173,256, random (195,205), random(256,266));
  //line (173,256, 200,261);
 line (173,256, random (195,205), random(268,278));
 // line (173,256, 200,273);
  
  point (94,253);//punts 
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

fill(0,0,0);
//ellipse(mouseX,mouseY,random(25,50),random(25,50));
ellipse(posVar,258,random(10,15),random(10,15));
posVar = (posVar +1)%300;
}
  void mousePressed(){
    fill(#000000);
//triangle(160,250,117,250,138,270);
nariz1 = 160;
nariz2 = 250;
nariz3 = 117;
nariz4 = 250;
nariz5 = 138;
nariz6 = 270;

oreja1 = random(112,117);
oreja2 = random (108,112);
oreja3 = random (174,178);
oreja4 = random (106,110);

    
}

void mouseReleased(){
  nariz1 = 165;
  nariz2 = 250;
  nariz3 = 123;
  nariz4 = 250;
  nariz5 = 143;
  nariz6 = 270;
}




