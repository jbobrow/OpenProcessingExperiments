
/*
Konkuk University
SOS iDesign

Name:JU Hwiyeon  
ID: JU Hwiyeon

*/
int value = 255;
void setup(){
size (600, 600);
smooth();
}

void draw(){
  
  background(251,202,4);
  
  strokeWeight(4);
  fill(68,223,64);
   stroke(value);
   ellipse(214,430,240,220);
  
  fill(255,255,255);
  strokeWeight (5);
   stroke(value);
  smooth();
  quad(192,600,89,219,307,219,525,600);
  bezier (89,219,89,191,112,191,128,217);
  bezier (311,219,298,188,274,188,272,218);
  
  
  fill(64,151,238);
   stroke(value);
  quad (135,385,400,385,524,600,192,600);
  
  
  fill(249,213,185);
   stroke(value);
  ellipse(235,299,160,120);
  
  noStroke();
  fill(38,108,179);
  quad(138,387,160,387,223,600,195,600);
  
  fill(200,200,200);
  
  quad(93,222,115,222,160,383,136,383);
  
  bezier(92,218,91,193,105,193,107,218);
  
  fill(0,0,0);
  ellipse (194,281,10,20);
  
  
  fill (200,200,200);
  ellipse (192,277,3,5);
  
fill(0,0,0);
  ellipse (280,281,10,20);
  
   fill (200,200,200);
  ellipse (278,277,3,5);
  
  strokeWeight(3);
  stroke(value);
  fill(249,213,200);
  quad(120,410,118,600,145,600,145,410);
  
  strokeWeight(3);
  stroke(value);
  fill(38,108,179);
  quad(120,410,118,480,145,480,145,410);
  
  
  smooth();
  strokeWeight(5);
  
  fill(135,235,133);
  quad(116,386,144,386,170,469,142,469);
  
  strokeWeight(3);
  noFill();
 stroke(value);
  bezier(195,302,227,323,275,324,291,302);
  
  noStroke();
  fill(0);
  ellipse(394,85,60,60);
  
  noStroke();
  fill(0);
  ellipse(480,85,60,60);
  
  noStroke();
  fill(255);
  ellipse(390,94,40,40);
  
    noStroke();
  fill(255);
  ellipse(473,92,40,40);
  
  stroke(0);
  fill(255,20,20);    
  ellipse(440,130,50,40);
  
  
  
  strokeWeight(3);
  smooth();
  stroke(0,0,0);
  fill(251,202,4);
  ellipse(450,114,21,40);
  
    smooth();
  stroke(0,0,0);
  fill(251,202,4);
  ellipse(416,114,21,40);
  
  smooth();
  stroke(0,0,0);
  fill(251,202,4);
  ellipse(436,104,60,20);
  
  
  fill(0);
  ellipse(430,113,20,16);

strokeWeight(3);
noFill();
bezier(364,38,349,59,343,60,331,38);

strokeWeight(3);
noFill();
bezier(544,38,529,59,523,60,511,38);



}




void keyPressed(){
  
if (value == 255) {
value = 0;
}
else {
value = 255; 
} 
fill (value);
rect(25, 25, 50, 50);
}

void mouseMoved() {
if (value == 0) {
value = 255;
}
else {
value = 0; 
} 
} 

