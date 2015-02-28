

void setup(){
 size(640,480);
 background(226,210,179);
 smooth(); 
}

void draw(){
 
 noStroke();
 fill(201,202,184);
 quad(0,55, width,60, width,240, 0,240);
 
 fill(208,206,186);
 quad(0,240, width,240, width,353, 0,356);
 
 fill(224,214,185);
 quad(0,356, width, 353, width,height, 0,height);
 
 fill(175,165,135,200);
 quad(30,0, 40,0, 0,17, 0,12);
 quad(146,0, 151,0, 0,97, 0,88);
 quad(248,0, 251,0, 0,275, 0,254);
 quad(343,0, 349,0, 186,height, 154,height);
 quad(438,0, 442,0, 604,height, 569,height);
 quad(605,0, 611,0, width,18, width,25);
 
 noFill();
 stroke(198,184,153);
 strokeWeight(1);
 quad(138,0, 258,73, 351,18, 305,0);
 quad(410,12, 533,13, 588,107, 382,107);
 
 line(178,24, 229,0);
 line(213,45, 294,0);
 line(351,18, 366,24);
 
 stroke(173,174,157);
 line(0,90, 317,107);
 line(317,107, width,107);
 line(147,102, 145,246);
 line(317,110, 311,254);
 line(506,107, 496,254);
 line(0,232, 312,256);
 line(312,256, width,254);
 line(96,133, 394,154);
 line(394,154, width,150);
 
 fill(248,184,52);
 noStroke();
 ellipse(425,219, 269,93);
 ellipse(426,92, 161,41);
 ellipse(423,22, 83,14);
 
 fill(43,78,138);
 noStroke();
 ellipse(385,27, 24,24);
 
 stroke(0);
 strokeWeight(2);
 line(0,8, 121,52);
 line(121,52, 0,139);
 line(429,0, 492,276);
 line(578,0, width,44);
 line(width,44, 598,50);
 line(598,50, width,53);
 line(0,408, 242,height);
 line(342,height, width,402);
 
 strokeWeight(5);
 line(0,308, width,289);
 line(600,211, width,207);
 
 stroke(221,121,57);
 strokeWeight(3);
 line(0,115, 348,132);
 
 stroke(71,93,112);
 strokeWeight(3);
 line(0,168, 36,168);
 
 strokeWeight(5);
 line(305,0, width,83);
 noFill();
 bezier(273,33, 140,142, 131,342, width,431);
 
 
  
}


