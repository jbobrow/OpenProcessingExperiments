


void setup(){
  size(400,400);
  noCursor();
  smooth();
}

void draw(){
  
  background(mouseX,mouseY);
  
  translate(mouseX-40,mouseY-50);
  
  //shippo
  stroke(#FFFFFF);
  fill(#FF0000);
  triangle(62,50,mouseX+62,mouseY-30,mouseX+52,mouseY-35);
  fill(#FF002F);
  triangle(62,50,mouseX+50,mouseY-40,mouseX+50,mouseY-42);
  fill(#FF005E);
  triangle(62,50,mouseX+50,mouseY-40,mouseX+52,mouseY-35);
  fill(#FF008D);
  
  fill(#1800FF);
  triangle(62,50,mouseX+82,mouseY-50,mouseX+77,mouseY-40);
  fill(#001BFF);
  triangle(62,50,mouseX+72,mouseY-38,mouseX+77,mouseY-40);
  fill(#004AFF);
  triangle(62,50,mouseX+72,mouseY-38,mouseX+70,mouseY-38);
  
  fill(#00FF01);
  triangle(62,50,mouseX+62,mouseY-70,mouseX+72,mouseY-67);
  fill(#29FF00);
  triangle(62,50,mouseX+74,mouseY-62,mouseX+72,mouseY-67);
  fill(#58FF00);
  triangle(62,50,mouseX+74,mouseY-62,mouseX+74,mouseY-60);
  
  fill(#FEFF00);
  triangle(62,50,mouseX+42,mouseY-50,mouseX+45,mouseY-60);
  fill(#FFD500);
  triangle(62,50,mouseX+50,mouseY-62,mouseX+45,mouseY-60);
  fill(#FF9E00);
  triangle(62,50,mouseX+50,mouseY-62,mouseX+55,mouseY-62);
  
  
  
  //migime
  stroke(#585858);
  ellipse(23,17,16,16);
  fill(#3F2C50);
  arc(23,17,16,16,PI,TWO_PI);
  stroke(#000000);
  line(15,17,12,17);
  
  //kubi
  
  stroke(#585858);
  fill(#FFFFFF);
  rect(31,8,3,42);
  
  //kao
  noStroke();
  fill(#FFFFFF);
  ellipse(30,20,26,26);
  triangle(30,7,30,0,27,0);
  
  //hidarime
  stroke(#000000);
  ellipse(35,17,16,16);
  fill(#008EFF);
  ellipse(35,17,mouseX/22,mouseX/22);
  fill(#350D58);
  arc(35,17,16,16,PI,TWO_PI);
  line(43,17,24,17);
  
  //kuchibashi
  fill(#FFF700);
  triangle(15,25,21,20,23,25);
  triangle(23,25,19,25,21,27);
  
  //migihane
  stroke(#585858);
  fill(#436C37);
  quad(31,50,5,70,10,70,42,61);
  
  
  //doutai
  
  noStroke();
  fill(#FFFFFF);
  quad(31,50,27,55,27,65,33,73);
  quad(31,50,33,73,45,73,62,50);
  
  //hidarihane
  stroke(#000000);
  fill(#1A7400);
  quad(34,50,34,60,39,65,62,50);
  
  //ashi
  stroke(#000000);
  line(42,73,42,95);
  line(42,95,39,95);
  line(42,95,39,98);
  line(42,95,42,98);
  stroke(#585858);
  line(37,73,37,95);
  line(37,95,34,95);
  line(37,95,34,98);
  line(37,95,37,98);
  
  



}
