
void setup () {
background(#CED8CB);
size(200,200);

}

void draw () {  
background (255);
noStroke();
fill(#5F2A09);
bezier(40,60,100,175,133,105,148,60);
line(40,60,150,60);
fill(#FC7FBA);
triangle(64,40, 58, 35, 70, 78);
fill(#5F2A09);
triangle(40, 60, 58, 35, 70, 75);
triangle(120, 60, 140, 30, 148, 60);
triangle(110, 60, 140, 30, 148, 60);
fill(#FC7FBA);
triangle(120,60,138,46,142,60);
fill(#FFFDFC);
// eyes 
ellipse(112,80,30,30);
fill(#FFFDFC);
ellipse(90,80,30,30);
fill(0);
ellipse(90,80,10,10);
fill(0);
ellipse(112,80,10,10);
// end of eyes
//nose 
triangle(95,100,103,105,110,100);
fill(#5F2A09);
bezier(128,103,135,120,120,135,90,121);
fill(#FC7FBA);
bezier(124,107,125,120,120,125,100,119);
line(100,120,123,108);



}
