


PFont font;
//top images
PImage top01;
PImage top02;
PImage top03;
PImage top04;
PImage top05;
PImage top06;
PImage top07;
PImage top08;
PImage top09;
PImage top10;
PImage top11;
PImage top12;
PImage top13;
PImage top14;


//bottom images
PImage bottom01;
PImage bottom02;
PImage bottom03;
PImage bottom04;
PImage bottom05;
PImage bottom06;
PImage bottom07;
PImage bottom08;
PImage bottom09;
PImage bottom10;
PImage bottom11;
PImage bottom12;
PImage bottom13;
PImage bottom14;

void setup(){
  size(504,864);
  frameRate(10);
  smooth();
  font = loadFont("Futura-CondensedMedium-48.vlw");
  
  top01 = loadImage("top01.png");
  top02 = loadImage("top02.png");
  top03 = loadImage("top03.png");
  top04 = loadImage("top04.png");
  top05 = loadImage("top05.png");
  top06 = loadImage("top06.png");
  top07 = loadImage("top07.png");
  top08 = loadImage("top08.png");
  top09 = loadImage("top09.png");
  top10 = loadImage("top10.png");
  top11 = loadImage("top11.png");
  top12 = loadImage("top12.png");
  top13 = loadImage("top13.png");
  top14 = loadImage("top14.png");
  
  bottom01 = loadImage("bottom01.png");
  bottom02 = loadImage("bottom02.png");
  bottom03 = loadImage("bottom03.png");
  bottom04 = loadImage("bottom04.png");
  bottom05 = loadImage("bottom05.png");
  bottom06 = loadImage("bottom06.png");
  bottom07 = loadImage("bottom07.png");
  bottom08 = loadImage("bottom08.png");
  bottom09 = loadImage("bottom09.png");
  bottom10 = loadImage("bottom10.png");
  bottom11 = loadImage("bottom11.png");
  bottom12 = loadImage("bottom12.png");
  bottom13 = loadImage("bottom13.png");
  bottom14 = loadImage("bottom14.png");


}
void draw(){
  background(255);
  
   int rand02 = int(random(14));
  switch(rand02){
    case 0:
    image(bottom01,0,0);
    break;
    
    case 1:
    image(bottom02,0,0);
    break;
    
    case 2:
    image(bottom03,0,0);
    break;
    
    case 3:
    image(bottom04,0,0);
    break;
    
    case 4:
    image(bottom05,0,0);
    break;
    
    case 5:
    image(bottom06,0,0);
    break;
    
    case 6:
    image(bottom07,0,0);
    break;
    
    case 7:
    image(bottom08,0,0);
    break;
    
    case 8:
    image(bottom09,0,0);
    break;
    
    case 9:
    image(bottom10,0,0);
    break;
    
    case 10:
    image(bottom11,0,0);
    break;
    
    case 11:
    image(bottom12,0,0);
    break;
    
    case 12:
    image(bottom13,0,0);
    break;
    
    case 13:
    image(bottom14,0,0);
    break;
 
  }
    int rand01 = int(random(14));
  switch(rand01){
    case 0:
    image(top01,0,0);
    break;
    
    case 1:
    image(top02,0,0);
    break;
    
    case 2:
    image(top03,0,0);
    break;
    
    case 3:
    image(top04,0,0);
    break;
    
    case 4:
    image(top05,0,0);
    break;
    
    case 5:
    image(top06,0,0);
    break;
    
    case 6:
    image(top07,0,0);
    break;
    
    case 7:
    image(top08,0,0);
    break;
    
    case 8:
    image(top09,0,0);
    break;
    
    case 9:
    image(top10,0,0);
    break;
    
    case 10:
    image(top11,0,0);
    break;
    
    case 11:
    image(top12,0,0);
    break;
    
    case 12:
    image(top13,0,0);
    break;
    
    case 13:
    image(top14,0,0);
    break;

  }
   
  textFont(font);
  fill(0);
  int rand03 = int(random(8));
  switch(rand03){
    case 0:
    String a = "Boo!";
    text(a,10,50);
    break;
    
    case 1:
    String b = "Ahhh!";
    text(b,100,50);
    break;
    
    case 2:
    String c = "Raaarrr!";
    text(c,150,50);
    break;
    
    case 3:
    String d = "Trick";
    text(d,200,50);
    break;
    
    case 4:
    String e = "Treat";
    text(e,250,50);
    break;
    
    case 5:
    String f = "R.I.P.";
    text(f,300,50);
    break;
    
    case 6:
    String g = "Ooooo!";
    text(g,320,50);
    break;
    
    case 7:
    String h = "Happy Halloween";
    text(h,70,50);
    break;
 
  }
}


