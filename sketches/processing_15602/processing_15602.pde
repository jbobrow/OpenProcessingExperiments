
PImage a,b,c,d;


PFont f; 

void setup(){

  //image
  a = loadImage("W.jpg");
  b = loadImage("main.jpg");
  c = loadImage("coff.gif");
  
  
    size(480,600);

 
  d = loadImage("coff.gif");
  
  
  //digital clock
   f =  loadFont ("ExpoM-HM-48.vlw");
  textFont(f);
  smooth();


}
void draw(){
  
  //image
  background(255);
  image(a,0,0);
  smooth();

  image(b,0,mouseY * -1);
  
  //text
 
  
  //clock
  
  fill(0);
  
  int s = second();
  int m = minute();
  int h = hour();

  String time  = nf( h, 2)+ " : " + nf( m, 2) +" : " + nf( s, 2);

  textAlign(CENTER);
  text(time, width/2, height/2);
  
  
  
  //following mouse
  

  image(c,mouseX,mouseY,50,50);
  
     //decorate
  

stroke(#fd98dd);
noFill();

  ellipse(550,500,20,20);
  
  


  
  stroke(2);
  noFill();
  rect(100,250,280,60);
  rect(90,240,300,80);
}

