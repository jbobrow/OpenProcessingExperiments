


void setup(){
  setupAudio();
  size(470,400);
}
 
void draw(){
smooth();
background (30,45,67); strokeWeight(0);

  
  getVolume(); 
  float Y=map(volume, 0, 100, 1,50);
  float Z = map(volume, 0,100, 1,255);  
float X = map(volume, 0,100, 1,170);
float M = map(volume, 0,100, 1,230);  
float O = map(volume, 0,100, 1,200);


fill(Z,235,104);ellipse(30,40,1099,1099);
fill(234,Z,65); ellipse(30,40,1054,1054);
fill(X,17,78); ellipse(30,40,950,950);
fill(124,Z,63);ellipse(30,40,922,922);
fill(28,Z,76);ellipse(30,40,873,873);
fill( 28,Y,212);ellipse(30,40,850,850);
fill(234,O,30);ellipse(30,40,800,800);
fill(274,73,M);ellipse(30,40,720,720);
fill(59,Y,255);ellipse(30,40,604,604);
fill(O,134,234);ellipse(30,40,560,560);
fill(143,256,M);ellipse(30,40,420,420);
fill(213,M,178);ellipse(30,40,320,320);
fill(X,225,50);ellipse(30,40,279,279);
fill(3,O,23);ellipse(30,40, 250,250);
fill(234,Z,21);ellipse(30,40, 222,222);
fill(34,M,156);ellipse (30,40, 160,160);
fill(Z,111,24);ellipse(30,40,100,100);
fill(162,38,X);ellipse(30,40,80,80);
fill(76,32,X);ellipse(30,40,65,65);
  smooth(); strokeWeight (5); stroke(0);
 fill(40,54,78); arc(320, 405, 100, 150, -PI, 0);  
    strokeWeight (3); fill (101,174,177); arc(305, 405, 70, 110, -PI, 0); 
 //big hair
  fill(#8E4517);
    ellipse (300, 200, 300, 300);
strokeWeight(4);
 //ear
  fill (#F7CFB6); ellipse (365, 290, 40, 50);
strokeWeight(3);
//ear 
fill(#F7CFB6);ellipse (180, 250, 50, 54);
//face
  fill (#F7CFB6); ellipse (270, 250, 200, 250);
   
rotate(-50);
strokeWeight(3);
fill(#8E4517);
//little hairs
 ellipse (340, 90, 210, 140);
  fill (140,Z,40); ellipse (230, 110, 40, 40);
strokeWeight(1);
 //eyes
 fill(#61C6D1);
  ellipse (280, 190, 10,X);
  ellipse (350, 185,10, X);
strokeWeight(2);
  fill(#F7CFB6);
  arc(320, 225, 40, 20, PI/2, PI);

 

 getVolume(); 
  float H = map(volume, 0,100, 1,50); 

 
  fill(#C17D7D);
  ellipse(330,265,50, H); 
 



}

