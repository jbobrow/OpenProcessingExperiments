
int Hueval = 0;    //hue color borrowed from Processing for Visual Artists
int Satval = 100;  //hue color borrowed from Processing for Visual Artists
int Brival = 256;  //hue color borrowed from Processing for Visual Artists
color MyColor;     //hue color borrowed from Processing for Visual Artists
void setup() {
  size(600,400);
  smooth();
   colorMode(HSB);
   MyColor = color(Hueval, Satval, Brival);
   colorMode(RGB);
}
void draw() {      
  doColor();
  translate(mouseX-(width/2),mouseY-(height/2));  //allows user to move object
  drawZipper();
  constrain(mouseX,0,width);
  constrain(mouseY,0,height);
  println("mouseX: " + mouseX + ", mouseY: " + mouseY);
  println("previous mouseX: " + pmouseX + ", previousMouseY: " + pmouseY );
}
void doColor() {               //hue color borrowed from Processing for Visual Artists
   Hueval = (Hueval+1) % 256;
   colorMode(HSB);
   MyColor = color(Hueval, Satval, Brival);
   colorMode(RGB);
}
void drawZipper(){           //creates rotating zipper object
  background(47,60,95);
  stroke(250,231,20);       //yellow line around shapes
  strokeWeight(4);
  line(300,198,257,453);
  line(300,198,343,453);
 pushMatrix();
  translate(width/2,height/2);
  rotate(radians(frameCount*2));  //rotates large zipper object
  ellipse(0,0,100,250);
  translate(50,0);
  rotate(radians(frameCount*5));   //rotates cage faster than rest of object
  cage1();
  fill(MyColor);                  //fills shape with changing color
 popMatrix();
}
void cage1(){            //creates smaller rotating cage
 pushMatrix();
  beginShape();
    vertex(0,15);
    vertex(10,15);
    vertex(10,-15);
    vertex(-10,-15);
    vertex(-15,0);
    vertex(0,0);
  scale(1.5);
  endShape(CLOSE);
 popMatrix();
 }


