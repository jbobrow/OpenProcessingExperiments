
void setup(){
 




size(500,500);
}
void draw(){
background(#311515);
dibujokirby(mouseX,mouseY);
}
void dibujokirby(int ink, int ink2){
//zapatos
strokeWeight(2);
fill(250,0,0);
ellipse(ink-100,ink2+130,150,70);
ellipse(ink+100,ink2+130,150,70);

//brazos
fill(250,203,202);
ellipse(ink-150,ink2+20,60,54);
ellipse(ink+150,ink2+20,60,54);


//forma basica
strokeWeight(2);
fill(250,203,202);
ellipse(ink,ink2,300,300);

//boca
fill(0);
ellipse(ink,ink2+40,25,25);

//ojos

fill(0,0,0);
ellipse(ink-30,ink2-30,25,80);
ellipse(ink+30,ink2-30,25,80);

fill(#1210C6);
ellipse(ink+30,ink2-30,23,70);
ellipse(ink-30,ink2-30,23,70);

fill(0,0,0);
ellipse(ink-30,ink2-37,24,60);
ellipse(ink+30,ink2-37,24,60);

fill(250,250,250);
ellipse(ink-30,ink2-45,15,39);
ellipse(ink+30,ink2-45,15,39);


}












