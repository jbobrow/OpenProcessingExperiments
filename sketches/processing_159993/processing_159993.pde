
void setup() {
size (600, 600) ;
}
void draw() {

background(20) ;

//this is my pattern
for (int y = 0; y < 30; y++) {
for (int x = 0; x < 30; x++) {
ellipse(30*x, 30*y,10, 10) ;
fill(#FFFFFF) ;
}
}
// My coding
fill(#7F8119) ;
ellipse(459, 235, 90, 30) ; //bottom lip


fill(#EDDC1D) ;
ellipse(455, 186, 205, 40) ; //top lip

noStroke() ;
fill(#F70519) ;
ellipse(344, 230, 250, 250) ; //head

noStroke() ;
fill(#8340BF) ;
rect(394, 215, 5, 10) ; //bottom

noStroke() ;
fill(#8340BF) ;
rect(404, 212, 5, 10) ; //bottom2

noStroke() ;
fill(#8340BF) ;
rect(412, 209, 5, 10) ; //bottom3

noStroke() ;
fill(#F70519) ;
rect(83, 522, 70, 60) ; //backleg


fill(#F70519) ;
rect(380, 494, 45, 60) ; //frontleg

noStroke() ;
fill(#FAFF00) ;
ellipse(243, 436, 400, 300) ; //body

fill(#F70519) ;
rect(167, 530, 90, 65) ; //backfrontleg


noStroke() ;
fill(20) ;
ellipse(399, 191, 50, 50) ; // eye

noStroke() ;
fill(#FFFFFF) ;
ellipse(402, 191, 15, 15) ; //pupil

//* println(mouseX + " , " + mouseY) ;
//* text(mouseX + " , " + mouseY, 30, 20) ;
//* rect(mouseX, mouseY, 10, 10) ;

}


