
int halfcir, wCen, yCen, clocir, halfcir1, halfcir2 ;
PFont g,h ;
PImage img;
PImage imgs;
PImage img3, img4;
int time = 30000;



void setup(){
  size(360,600);
  smooth();
    img = loadImage("img1.jpg");
    imgs = loadImage("img2.png");
    img3 = loadImage("img3.png");
    img4 = loadImage("img4.png");
  imageMode(CENTER);
  // f = loadFont ("Algerian-48.vlw");
  //textFont(f);

//  h =loadFont ("AgencyFB-Bold-50.vlw");
 //textFont(h);
  
}

void draw(){
  background(255);
 


    
   
  image(img,180,300,360,600);
    
    
wCen = 110;
yCen = 55;
  fill(0);
  stroke(255);
  strokeWeight(5);
  smooth();
  


    
  //watch
  ellipse(110,55,180,180);
  fill(255);
  ellipse(110,55, 10, 10);
 
  float s = map(second(), 0,60,0 , TWO_PI) - HALF_PI;
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() % 12, 0, 12,0, TWO_PI) - HALF_PI;
  stroke(255);
  clocir =140;
  halfcir = 90;
  halfcir1 = clocir/2-10;
  halfcir2 = clocir/2;
  
  strokeWeight(2);
  line(110,55, cos(s) * halfcir1 +  wCen, sin(s) * halfcir1 +yCen);
  strokeWeight(5);
  line(110, 55, cos(m) * halfcir + wCen, sin(m) * halfcir + yCen);
  line(110, 55, cos(h) * halfcir2 + wCen, sin(h) * halfcir2 +yCen);
  
  
  //watch number_up
    String aa = "30";
  String bb = "15";
  
text(bb, 240, 75);
text(aa, 110,210);

//white ball  
noFill();
stroke(255,0,0);
strokeWeight(3);
  ellipse( cos(m) * halfcir + wCen , sin(m) * halfcir + yCen, 30,30);
 
 //blue rect
  float Q = map(second(), 0,60,0 , width-150);
  
  fill(0,199,237);
  noStroke();
  
  rect(Q,  height-230, 15,15);   
  
 //rabbit
 
 image(img3, width-100, height-320, 170, 210); 
 
 
 //under watch image
 
 image(imgs,width-100, height-250, 157,196);
  
  //under second watch
 fill(255);
 noStroke();
  ellipse( width-99, height-218, 110,110);
  
    g=loadFont("Algerian-48.vlw");
  textFont(g);
 
 //second 
 
 fill(0);
    int c = second();
  
  String time = nf(c,2);

  textAlign(CENTER);
  text(time, width-99, height-202);
   
  
  //paper
 translate( 240, 10);
rotate(HALF_PI/4.0);
  image(img4, width-230, height-40,360,200);
  
  
  
  //hello R
 
  
  if(c == 00){
    fill(93,46,15);
     String zero = "Hello R";
    text(zero, width-257, height-30 );
  }
  
  
  
  
}

