
import processing.pdf.*;

//background
void setup() {
  size(1200, 1700); //PDF, "ems_wallpaper.pdf"
  background(50);
  smooth();
}
//end background

//set up draw
void draw() {
  background (50);
//set up loop 
for (int i = 0; i<1200; i = i+250) {
  for (int t = 0; t<1700; t = t+250) {
    logo(i, t);
  }//end of y
}//end of x

//println("Finished.");
//exit();
} //end of void draw



//LOGOSTUFF
//logo function
void logo(float xVal, float yVal)
{
  float i = xVal;
 float t = yVal;
  
  smooth();
//stripes
noStroke();

//stripes
fill(200);
  rect(i+104, t+190, 110, 7);
  fill(170);
  rect(i+104, t+205, 110, 7);
  fill(120);
  rect(i+94, t+220, 120, 7);
//end stripes

//TALK sign
beginShape();
noStroke();
fill(255, 0, 6);
vertex(i+84, t+94);
curveVertex(i+84, t+95);
curveVertex(i+83, t+72);
curveVertex(i+84, t+37);
curveVertex(i+84, t+35);
curveVertex(i+84, t+35);
vertex(i+67, t+37);
vertex(i+63, t+21);
vertex(i+62, t+22);
vertex(i+64, t+20);
curveVertex(i+65, t+20);
curveVertex(i+72, t+18);
curveVertex(i+88, t+14);
curveVertex(i+109, t+13);
vertex(i+112, t+14);
vertex(i+113, t+15);
vertex(i+115, t+29);
vertex(i+97, t+30);
vertex(i+97, t+31);
vertex(i+96, t+33);
vertex(i+109, t+75);
//T end
vertex(i+117, t+37);
vertex(i+118, t+36);
vertex(i+119, t+34);
vertex(i+125, t+35);
vertex(i+145, t+83);
vertex(i+146, t+84);
//A end
curveVertex(i+148, t+81);
curveVertex(i+147, t+64);
curveVertex(i+149, t+45);
curveVertex(i+150, t+37);
vertex(i+150, t+36);
vertex(i+163, t+38);
vertex(i+164, t+39);
vertex(i+164, t+42);
vertex(i+158, t+73);
vertex(i+157, t+84);
vertex(i+160, t+87);
vertex(i+168, t+85);
//L end
curveVertex(i+170, t+84);
curveVertex(i+169, t+81);
curveVertex(i+172, t+73);
curveVertex(i+185, t+21);
vertex(i+185, t+20);
vertex(i+198, t+19);
vertex(i+188, t+50);
vertex(i+189, t+52);
vertex(i+191, t+54);
vertex(i+216, t+26);
vertex(i+216, t+27);
vertex(i+222, t+29);
vertex(i+221, t+31);
vertex(i+198, t+59);
vertex(i+197, t+71);
curveVertex(i+197, t+62);
curveVertex(i+199, t+63);
curveVertex(i+201, t+75);
curveVertex(i+207, t+94);
vertex(i+201, t+94);
vertex(i+191, t+94);
vertex(i+191, t+92);
vertex(i+190, t+73);
vertex(i+189, t+70);
vertex(i+187, t+71);
vertex(i+179, t+92);
vertex(i+177, t+94);
vertex(i+133, t+94);
vertex(i+132, t+93);
vertex(i+130, t+86);
vertex(i+129, t+85);
vertex(i+122, t+86);
vertex(i+120, t+87);
vertex(i+120, t+94);
vertex(i+84, t+94);
endShape();

//Hole in the A
beginShape();
fill(50);
vertex(i+120, t+75);
vertex(i+118, t+72);
vertex(i+122, t+49);
vertex(i+124, t+47);
vertex(i+130, t+70);
vertex(i+130, t+74);
vertex(i+129, t+76);
vertex(i+121, t+74);
endShape();
//end TALK

//rows of circles
noStroke();
//first row
fill(100);
ellipse(i+92, t+108, 17, 17);
ellipse(i+117, t+108, 17, 17);
ellipse(i+142, t+108, 17, 17);
ellipse(i+167, t+108, 17, 17);
ellipse(i+192, t+108, 17, 17);
//second row
fill(150);
ellipse(i+105, t+128, 17, 17);
ellipse(i+130, t+128, 17, 17);
ellipse(i+155, t+128, 17, 17);
ellipse(i+180, t+128, 17, 17);
//third row
fill(190);
ellipse(i+117, t+148, 17, 17);
ellipse(i+142, t+148, 17, 17);
ellipse(i+167, t+148, 17, 17);
//end circles

//FACES

//face left
noStroke();
fill(255, 255, 255);

beginShape();
vertex(i+139, t+183); //end of jaw
vertex(i+85, t+235);//chin
curveVertex(i+83, t+236);
curveVertex(i+77, t+239);
curveVertex(i+73, t+235);
curveVertex(i+73, t+227);
vertex(i+73, t+224);
vertex(i+71, t+222);//begin lips
curveVertex(i+70, t+222);
curveVertex(i+64, t+221);
curveVertex(i+61, t+216);
curveVertex(i+62, t+212);
vertex(i+64, t+209); //center lips
curveVertex(i+52, t+208);
curveVertex(i+49, t+206);
curveVertex(i+48, t+201);
curveVertex(i+50, t+199);//end of lips
vertex(i+55, t+198);
vertex(i+58, t+195);
vertex(i+61, t+191);
vertex(i+60, t+188);
vertex(i+58, t+187);
vertex(i+57, t+186); //nose
vertex(i+47, t+183);
vertex(i+46, t+182);
vertex(i+43, t+180);
vertex(i+42, t+177);
vertex(i+47, t+162);
vertex(i+49, t+158);
vertex(i+52, t+154);//end nose
vertex(i+41, t+148);
vertex(i+39, t+144);
vertex(i+36, t+136);
vertex(i+28, t+122);
curveVertex(i+30, t+111);
curveVertex(i+43, t+113);
curveVertex(i+67, t+109);
curveVertex(i+72, t+105);
vertex(i+77, t+97);
vertex(i+80, t+95);
vertex(i+83, t+95);
vertex(i+139, t+179);
vertex(i+139, t+183);
endShape();

//eyes left
beginShape();
fill(255, 0, 0, 150);
vertex(i+61, t+155);
curveVertex(i+64, t+156);
curveVertex(i+68, t+156);
curveVertex(i+74, t+154);
curveVertex(i+79, t+150);
vertex(i+81, t+149);
vertex(i+73, t+149);
vertex(i+67, t+147);
vertex(i+62, t+146);
vertex(i+57, t+145);
vertex(i+61, t+155);
endShape();
//end eye left

//face right
beginShape();
fill(255, 255, 255);
vertex(i+148, t+183); //end of jaw
vertex(i+200, t+235);//chin
curveVertex(i+203, t+236);
curveVertex(i+208, t+239);
curveVertex(i+213, t+235);
curveVertex(i+212, t+227);
vertex(i+213, t+224);
vertex(i+215, t+222);//begin lips
curveVertex(i+221, t+222);
curveVertex(i+223, t+221);
curveVertex(i+226, t+216);
curveVertex(i+223, t+212);
vertex(i+220, t+209); //center lips
curveVertex(i+231, t+208);
curveVertex(i+236, t+206);
curveVertex(i+238, t+201);
curveVertex(i+235, t+199);//end of lips
vertex(i+232, t+198);
vertex(i+228, t+195);
vertex(i+226, t+191);
vertex(i+224, t+188);
vertex(i+227, t+187);
vertex(i+230, t+186); //nose
vertex(i+239, t+183);
vertex(i+241, t+182);
vertex(i+243, t+180);
vertex(i+243, t+177);
vertex(i+239, t+162);
vertex(i+237, t+158);
vertex(i+234, t+154);//end nose
vertex(i+240, t+148);
vertex(i+245, t+144);
vertex(i+251, t+136);
vertex(i+254, t+122);
curveVertex(i+259, t+111);
curveVertex(i+244, t+113);
curveVertex(i+218, t+109);
curveVertex(i+213, t+105);
vertex(i+209, t+97);
vertex(i+205, t+95);
vertex(i+204, t+95);
vertex(i+146, t+179);
vertex(i+148, t+183);
endShape();
//end face right

//eyes right
beginShape();
fill(255, 0, 0, 150);
vertex(i+225, t+155);
curveVertex(i+222, t+156);
curveVertex(i+218, t+156);
curveVertex(i+212, t+154);
curveVertex(i+205, t+150);
vertex(i+215, t+149);
vertex(i+218, t+149);
vertex(i+222, t+147);
vertex(i+227, t+146);
vertex(i+230, t+145);
vertex(i+225, t+155);
endShape();
//end eye right

}
