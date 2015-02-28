
/*@pjs preload="apple1.png,apple_white.png,turi.gif,daruma4.png,A.png,P_2.gif,u.png"*/

PFont p;
PImage img, img2, img3;    
int  x , c;
int t = 0;
int speed; 
int eSize = 17; 



void setup() {
  size(450, 450);
  background(255); 
  frameRate(30);
  smooth();
  speed = 3;

  img = loadImage("A.png");    
  tint(246, 231, 204);
  image(img, 0, 100); 
  p = loadFont("Zapfino-48.vlw");
}


void draw() {
 background(255);
 loop();
  for (int i=0; i<100; i+=30) {    
    fill(mouseX, mouseY, 26, 0+i);
    ellipse(315, 55, i, i);
  }
 

// fill(0,0,0,127);
// textFont(p, 50); 
// text("A", 36, 278);
// textFont(p, 50); 
// text("p", 137, 270);
// textFont(p, 50); 
// text("p", 220, 270);
// textFont(p, 50); 
// text("l", 315, 280);
// textFont(p, 50); 
// text("e", 410, 280);
 
 noStroke();
 fill(255);
 rect(0, 280, 250, 60);
 fill(0,0,0,127);
  img = loadImage("u.png"); 
  //tint(246, 231, 204);
  image(img, -30,110,450,450);
  noStroke();
 stroke(4);
 line(0,280,600,280);
 
 noStroke();
 float  x= map(mouseX, 0, width, 37, 44);
 float  y= map(0, -mouseY, height, 137, 150); //A eye_l hanni

 float  x2= map(mouseX, 0, width, 60, 67);
 float  y2= map(0, -mouseY, height, 137, 150);//A eye_r hanni

 fill(0);
 img = loadImage("apple1.png"); //Aeye left
 image(img, x, y, 9, 10);
 img = loadImage("apple1.png"); //Aeye right
 image(img, x2, y2, 9, 10);
 noTint();
 img = loadImage("apple_white.png");   //e 
 image(img, 359, 205, 70, 80);
 img = loadImage("turi.gif");   //l
 noTint();
 image(img, 240, 39, 150, 175);
 fill(75, 55, 12);
 rect(300, 197, 25, 87);
 img2 = loadImage("daruma4.png");   //p2
 noTint();
 image(img2, 155, 173, 90, 122);

 fill(0);
 ellipse(190, 200, 5, 5);
 ellipse(210, 200, 5, 5); //yukidaruma_eye

 noStroke();
 fill(221, 219, 219);
 ellipse(190, y+55, 5, 5); 
 fill(221, 219, 219);
 ellipse(210, y+55, 5, 5); 

 if (y > 155 || y < 215) //yukidaruma_mabuta

 img3 = loadImage("P_2.gif"); //p
 image(img3, 100, 85);
 img = loadImage("A.png");  //A  
 tint(246, 231, 204);
 image(img, 0, 100);
 
 fill(mouseX,mouseY,26);  //kazari
  ellipse(301, 153, 9, 9);
  ellipse(333, 171, 9, 9);
  ellipse(371, 189, 9, 9);
  ellipse(265, 186, 9, 9);
    
 fill(40,mouseX,mouseY); //kazari
  ellipse(301, 184, 9, 9);
  ellipse(312, 86, 9, 9);
  ellipse(334, 123, 9, 9);
             


}
 
void mousePressed(){
  noStroke();
  fill(221, 219, 219);
  ellipse(190, 200, 15, 15); 
  fill(221, 219, 219);
  ellipse(210, 200, 15, 15); //yukidaruma mabataki
}


