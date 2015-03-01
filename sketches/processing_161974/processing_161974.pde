
PImage img1, img2;
float offset = 0;
float easing = 0.05;
float couting=1;
int firstX = 27, bottomY = 1200, heightLimit = 300, firstHeight = 70, swag = 25, blazeIt = 420;

void setup(){
  size(1000, 1300);
  img1 = loadImage("joseph.jpg");
  img2 = loadImage("joseph.jpg");
  frameRate(30);
  
//Printing:

  String a = "I got the moving colorful sound bar idea from Adam Klopenstein's 'Chaos and Order' piece found at http://www.openprocessing.org/sketch/111507";
  println(a);
  
}

void draw(){ 
  
//Normal Image
  img1.resize(0, 850);
  image(img1, 0, 0);
  
//Inverted image
  img2.resize(500, 850);
  img2.filter(INVERT);                              
  image(img2, width/2, 0);
  
  
  
  
//Left face design

//Blue Circle on left glasses
  fill(#0092FF);
  noStroke();
  ellipse(130, 280, 130, 120);
  
//Blue circle on the right glasses
  fill(#0092FF);
  noStroke();
  ellipse(330, 280, 140, 120);
  
//Triangle nose
  fill(#9B5800);
  smooth();
  strokeWeight(12);
  strokeCap(ROUND);
  triangle(230, 255, 160, 380, 300, 380);

//Top lip
  fill(#AA024B);
  strokeWeight(3);
  stroke(#000000);
  bezier(170, blazeIt+20, 185, 400, 280, 400, 315, blazeIt+10);
  
//Bottom lip
  fill(#AA024B);
  strokeWeight(3);
  stroke(#000000);
  bezier(170, blazeIt+20, 195, 477, 280, 477, 315, blazeIt+10);
  
//Lip line
  fill(#000000);
  strokeWeight(3);
  stroke(#000000);
  line(170, blazeIt+20, 315, blazeIt+10);




//Right face design (facial recognition)

//this is a series of lines
  strokeWeight(3);
  
//Chin pieces
//chin to left lip
  line(750, 580, 675, blazeIt+20);
//chin to right lip
  line(750, 580, 825, blazeIt+10);
//chin to right chin
  line(750, 580, 800, 580);
//leftchin to left cheek
  line(700, 580, 610, blazeIt+40);
//leftchin to chin
  line(700, 580, 750, 580);
//leftchin to left lip
  line(700, 580, 675, blazeIt+20);
//right chin to right lip
  line(800, 580, 825, blazeIt+10);
//right chin to right cheek
  line(800, 580, 905, blazeIt+40);
  
//Cheek pieces
//left cheek to left lip
  line(610, blazeIt+40, 675, blazeIt+20);
//left cheek to top left cheek
  line(610, blazeIt+40, 590, blazeIt-75);
//left cheek to left nose
  line(610, blazeIt+40, 680, blazeIt-50);
//top left cheek to center nose
  line(590, blazeIt-75, 740, blazeIt-40);
//top left cheek to top left nose
  line(590, blazeIt-75, 720, 290);
//top left cheek to left glasses
  line(590, blazeIt-75, 600, 210);
//right cheek to right lip
  line(905, blazeIt+40, 825, blazeIt+10);
//right cheek to top right cheek
  line(905, blazeIt+40, 930, blazeIt-75);
//top right cheek to center nose
  line(930, blazeIt-75, 740, blazeIt-40);
//top right cheek to top right nose
  line(930, blazeIt-75, 760, 290);
//right cheek to right nose
  line(905, blazeIt+40, 800, blazeIt-50);
  
//lip pieces
//left lip to center lip
  line(675, blazeIt+20, 750, blazeIt+45);
//left lip to center nose
  line(675, blazeIt+20, 740, blazeIt-40);
//right lip to center lip
  line(825, blazeIt+10, 750, blazeIt+45);
//right lip to center nose
  line(825, blazeIt+10, 740, blazeIt-40);

//nose pieces
//left nose to center nose
  line(680, blazeIt-50, 740, blazeIt-40);
//top left nose to bottom left nose
  line(720, 290, 680, blazeIt-50);
//center nose to right nose
  line(740, blazeIt-40, 800, blazeIt-50);
//right nose to top right nose
  line(800, blazeIt-50, 760, 290);

//glasses pieces
//left glasses to top left nose
  line(600, 210, 720, 290);
//left glasses to center glasses
  line(600, 210, 740, 225);
//center glasses to top left nose
  line(740, 225, 720, 290);
//center glasses to top right nose
  line(740, 225, 760, 290);
//center glasses to right glasses
  line(740, 225, 920, 210);
//right glasses to top right nose
  line(920, 210, 760, 290);
//right glasses to top right cheek
  line(920, 210, 930, blazeIt-75);




//Sound bar design
  
//Red Sound Bars
  for(int i=1; i<=2000;i= i+150){
  fill(#FF0000);
  noStroke();
  rect(i, bottomY, swag+5, -firstHeight);
  }
  
//Purple sound bars
  for(int a=27; a<2000; a= a+150){
    fill(#FC00C6);
    rect(a, bottomY, swag, -firstHeight+20);
  }
  
//Blue sounds bars
  for(int b=49; b<2000; b= b+150){
    fill(#0300FC);
    rect(b, bottomY, swag, -firstHeight-40);
  }
  
//Green sounds bars
  for(int c=71; c<2000; c= c+150){
    fill(#0BFC00);
    rect(c, bottomY, swag+3, -firstHeight+40);
  }
  
//Yellow sound bars
  for(int d=93; d<2000; d= d+150){
    fill(#FCFC00);
    rect(d, bottomY, swag+5, -firstHeight);
  }
  
//Oragne sound bars
  for(int f=115; f<2000; f= f+150){
    fill(#FF8000);
    rect(f+3, bottomY, swag+8, -firstHeight+40);
  }
    
//Moving bars
  firstHeight += 30;
   
  if(firstHeight >= heightLimit){
    firstHeight = baseHeight;
  }
  
}


