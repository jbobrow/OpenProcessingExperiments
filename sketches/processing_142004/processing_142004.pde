
/*
Konkuk University
SOS iDesign
 
Name: Eunjin Park
ID: 201420079
 
*/
 
PImage img;
 
void setup(){
size (600, 600);
// noLoop();
smooth();
//img = loadImage ("bonobono.jpg"); // put the image in the same folder as the processing file
}
 
void draw(){
println(mouseX + " : " + mouseY);
//image (img, 0, 0);
// here you add your code with all shapes and colors.
 
 

 
 
strokeWeight(4);
fill(255,178,217);
beginShape();
vertex(144,225);
vertex(96,218);
vertex(71,202);
vertex(71,189);
vertex(93,157);
vertex(134,133);
vertex(146,137);
vertex(161,174);
vertex(154,220);
endShape(CLOSE);
 
fill(178,235,244);
 
beginShape();
vertex(208,256);
vertex(156,206);
vertex(149,209);
vertex(141,210);
vertex(136,219);
vertex(129,223);
vertex(145,266);
vertex(171,306);
vertex(204,338);
vertex(183,391);
vertex(176,425);
vertex(167,476);
vertex(164,533);
vertex(110,563);
vertex(110,580);
vertex(160,580);
vertex(203,569);
vertex(206,544);
vertex(218,533);
vertex(312,545);
vertex(427,539);
vertex(439,554);
vertex(442,583);
vertex(462,587);
vertex(520,586);
vertex(531,580);
vertex(505,556);
vertex(474,545);
vertex(466,469);
vertex(443,392);
vertex(420,332);
vertex(482,242);
vertex(485,231);
vertex(488,206);
vertex(479,207);
vertex(476,198);
vertex(466,203);
vertex(461,198);
vertex(398,264);
 
endShape(CLOSE);
 
beginShape();
vertex(166,479);
vertex(124,461);
vertex(98,433);
vertex(102,414);
vertex(119,415);
vertex(170,443);
endShape(CLOSE);
 
fill(178,235,244);
ellipse(309,156,282,288);
 
 
 
strokeWeight(2);
line(76,180,98,195);
line(89,165,109,182);
line(106,150,123,168);
line(123,138,138,161);
 
float mx1 = constrain (mouseX, 200, 250);
float mx2 = constrain (mouseX, 350, 410);
float my = constrain (mouseY, 105, 145);
 
 
strokeWeight(15);
point(mx1,my);
point(mx2,my);
 
 
 
fill(255,255,255);
strokeWeight(2);
ellipse(287,215,51,61);
ellipse(339,208,55,61);
 
strokeWeight(50);
point(311,175);
 
strokeWeight(2);
line(240,195+(random(-5,3)),278,198);
line(236,218+(random(-5,3)),276,212);
line(237,245+(random(-5,3)),276,228);
line(396,198+(random(-5,3)),353,200);
line(394,218+(random(-5,3)),357,212);
line(390,238+(random(-5,3)),357,224);
 
 
line(111,567,133,563);
line(111,573,136,571);
line(494,565,519,567);
line(479,574,528,580);

   
   
  if(mousePressed){
    fill(random(300), random(200), random(300));
    ellipse (mouseX, mouseY, 100, 100);
    
  }
}
