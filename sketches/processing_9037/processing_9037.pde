
 
float mx;
float my;
float easing = 0.05;
int radius = 10;
int edge = 200;
int inner = edge + radius;
int i = 10;
void setup() {
size(640, 480);
background(14, 37, 62);
noStroke();
smooth();


}

void draw() { 
  background(14, 37, 62);
  if (abs(mouseX - mx) > 0.1) {
    mx = mx + (mouseX - mx) * easing;
  }
  if (abs(mouseY - my) > 0.1) {
    my = my + (mouseY- my) * easing;
  }
  
  mx = constrain(mx, inner + 30, width - inner - 40);
  my = constrain(my, inner-30, height - inner);
  
  

//eye fill
fill(8, 74, 119);
ellipse(313, 220, 285, 187);  
  //iris
fill(3, 43, 62);
ellipse(mx, my - 10, 192, 179);
  
 //pupil
fill(4, 22, 35);
ellipse(mx, my - 10, 130, 130);

fill(14, 37, 62);
beginShape();
vertex(93, 258);
vertex(75, 116);
vertex(206, 24);
vertex(572, 37);
vertex(592, 216);
vertex(457, 219);
vertex(434, 174);
vertex(403, 141);
vertex(221, 139);
vertex(165, 214);
endShape(CLOSE);

fill(14, 37, 62);
beginShape();
vertex(164, 202);
vertex(173, 240);
vertex(189, 279);
vertex(227, 317);
vertex(287, 327);
vertex(379, 320);
vertex(447, 248);
vertex(463, 218);
vertex(504, 200);
vertex(583, 200);
vertex(573, 359);
vertex(418, 453);
vertex(141, 436);
vertex(52, 267);
vertex(104, 214);
endShape(CLOSE);



//eyelid top light blue
fill(20, 95, 141);
beginShape();
vertex(163, 228);
bezierVertex(163, 157, 224, 98, 308, 98);
bezierVertex(392, 98, 457, 145, 460, 219);
bezierVertex(427, 183, 378, 122, 308, 122);
bezierVertex(238, 122, 162, 178, 163, 228);
endShape();

//bottom lid light blue
fill(20, 95, 141);
beginShape();
vertex(166, 226);
bezierVertex(185, 276,248, 323, 318, 323);
bezierVertex(388, 323, 464, 263, 464, 216);
bezierVertex(464, 287, 402, 346, 318, 346);
bezierVertex(234, 346, 169 ,300, 166, 226);
endShape();
  
if (mousePressed){ 

fill(18, 53, 89);
beginShape();
vertex(174, 235);
bezierVertex(180, 209, 177, 207, 202, 179);
bezierVertex(226, 152, 272, 126, 313, 126);
bezierVertex(392, 126, 453, 151, 458, 238);
bezierVertex(414, 233, 372, 216, 307, 211);
bezierVertex(242, 205, 176, 235, 174, 235);
endShape(CLOSE);

}

//top eye lid dark blue
fill(18, 53, 89);
beginShape();
vertex(177, 250);
bezierVertex(163, 238, 159, 225, 159, 210);
bezierVertex(159, 166, 226, 119, 313, 119);
bezierVertex(401, 119, 464, 166, 464, 210);
bezierVertex(464, 225, 460, 238, 446, 250);
bezierVertex(447, 246, 447, 242, 447, 237);
bezierVertex(447, 186, 386, 144, 311, 144);
bezierVertex(237, 144, 176, 186, 176, 237);
endShape();

//lower lid
fill(18, 53, 89);
beginShape();
vertex(169, 240);
bezierVertex(198, 265, 251, 282, 311, 282);
bezierVertex(372, 282, 424, 265, 454, 240);
bezierVertex(444, 290, 384, 329, 311, 329);
bezierVertex(239, 329, 179, 290, 169, 240);
endShape();

fill(11, 41, 66);
beginShape();
vertex(169, 243);
bezierVertex(198, 269, 251, 307, 311, 307);
bezierVertex(372, 307, 424, 269, 453, 243);
bezierVertex(444, 294, 384, 333, 311, 333);
bezierVertex(239, 333, 179, 294, 169, 243);
endShape();

//glare 1
fill(144, 187, 204, 95);
ellipse(266, 175,33, 30); 

//glare 2
fill(144, 187, 204, 95);
ellipse(253, 205, 13, 21);
//glare 2
fill(144, 187, 204, 50);
ellipse(253, 205, 13, 21);

}



