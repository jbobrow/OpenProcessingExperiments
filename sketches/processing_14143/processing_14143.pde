
void setup() {
  size(200,200);
//  colorMode(HSB,random(360),100,100);
}
void draw() {
//  translate(50,50);
//  rect(0,0,100,100);
  scale(0.1,0.1);
//  myDraw();
  colorMode(HSB,random(360),100,100);


    for(int x=0; x<1200; x=x+80){
      for(int y=0; y<1200; y=y+80){
    
    pushMatrix();
    translate(x+x,y+y);
//    rotate(radians(3));
    scale(0.9);
    
    myDraw();
    popMatrix();
    
  }
}
}
void myDraw(){


//얼굴형
stroke(0);
strokeWeight(1.5);
fill(#FFE4B5);
 
beginShape();
vertex(47,55);
vertex(47,90);
vertex(52,140);
vertex(58,150);
vertex(90,168);
vertex(95,170);
vertex(105,170);
vertex(110,168);
vertex(142,150);
vertex(147,140);
vertex(152,90);
vertex(152,55);
 
endShape(CLOSE);
 
//왼쪽머리
fill(#DAA520);
beginShape();
vertex(75,0);
vertex(77,10);
vertex(50,2);
vertex(55,15);
vertex(28,10);
vertex(45,30);
vertex(14,34);
vertex(37,50);
vertex(14,54);
vertex(32,70);
vertex(14,80);
vertex(30,87);
vertex(20,96);
vertex(30,97);
 
//endShape();
 
//이마머리
//beginShape();
vertex(48,92);
vertex(50,110);
vertex(54,92);
vertex(56,82);
vertex(57,74);
vertex(58,68);
vertex(60,80);
vertex(61,90);
vertex(63,95);
vertex(65,80);
vertex(68,60);
vertex(70,68);
vertex(76,56);
vertex(76,68);
vertex(90,60);
vertex(90,70);
vertex(100,60);
vertex(98,73);
vertex(110,60);
vertex(108,70);
vertex(120,55);
vertex(130,65);
vertex(130,60);
vertex(140,73);
vertex(142,63);
vertex(144,100);
vertex(147,80);
vertex(150,105);
vertex(152,90);
vertex(160,80);
//endShape();
 
//오른쪽머리
//beginShape();
vertex(167,100);
vertex(180,98);
vertex(173,90);
vertex(185,80);
vertex(175,75);
vertex(195,65);
vertex(180,55);
vertex(190,35);
vertex(182,38);
vertex(192,23);
vertex(170,28);
vertex(185,15);
vertex(170,17);
vertex(180,5);
vertex(160,10);
vertex(170,0);
vertex(75,0);
 
endShape(CLOSE);
 
//오른쪽귀
fill(#FFE4B5);
beginShape();
vertex(152,90);
vertex(155,85);
vertex(160,80);
vertex(162,78);
vertex(170,87);
vertex(170,88);
vertex(172,89);
vertex(170,97);
vertex(165,100);
vertex(162,104);
vertex(158,107);
vertex(155,104);
vertex(153,102);
 
endShape();
 
beginShape();
vertex(160,100);
vertex(165,92);
endShape();
 
 
//왼쪽귀
 
beginShape();
vertex(47,90);
vertex(40,80);
vertex(38,78);
vertex(30,87);
vertex(30,88);
vertex(28,89);
vertex(30,97);
vertex(35,100);
vertex(38,104);
vertex(42,107);
vertex(45,104);
vertex(47,102);
 
endShape();
 
 
beginShape();
vertex(40,100);
vertex(35,95);
vertex(35,90);
vertex(38,85);
 
endShape();
 
//이마주름
 
fill(#DCDCDC);
stroke(0);
strokeWeight(0.5);
line(75,68,72,80);
line(132,65,135,80);
 
//광대뼈
 
beginShape();
vertex(55,110);
vertex(62,118);
vertex(63,126);
endShape();
 
beginShape();
vertex(145,110);
vertex(138,118);
vertex(137,126);
endShape();
 
//눈
fill(#B0C4DE);
stroke(0);
strokeWeight(1.5);
line(67,92,84,92);
line(70,98,82,98);
 
line(116,92,133,92);
line(118,98,130,98);
 
ellipse(76,95,7,5);//좌동공
ellipse(124,95,7,5);//우동공
 
 
 
//코
stroke(0);
strokeWeight(1);
beginShape();
vertex(94,130);
vertex(97,127);
vertex(97,130);
endShape();
 
beginShape();
vertex(106,130);
vertex(103,127);
vertex(103,130);
endShape();
 
 
//입
fill(#DB7093);
beginShape();
vertex(70,140);
vertex(75,145);
vertex(95,150);
vertex(100,151);
vertex(105,150);
vertex(125,145);
vertex(130,140);
 
 
vertex(125,142);
vertex(105,145);
vertex(95,145);
vertex(75,142);
 
endShape(CLOSE);
line(97,140,103,140);
 
beginShape();
vertex(92,152);
vertex(93,153);
vertex(100,154);
vertex(107,153);
vertex(108,152);
endShape();
 
 
 
//눈썹
fill(0);
stroke(0);
strokeWeight(2);
beginShape();
vertex(56,80);
vertex(72,82);
vertex(85,88);
vertex(68,88);
vertex(65,88);
endShape(CLOSE);
 
beginShape();
vertex(144,80);
vertex(128,82);
vertex(115,88);
vertex(132,88);
vertex(135,88);
endShape(CLOSE);

}
