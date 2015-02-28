
float lineX = 50;
float lineY = 50;

float myX = mouseX;
float myY = mouseY;

float colour = 10;

void setup() {
    background(0);
    smooth();
      size(800, 800);
      colorMode(HSB);
}

void draw(){
  

fill(0,0,0,2);
rect(-10,-10,820,820);

  lineX = lineX+random(5)+(myX-lineX)/50.0;
  lineY = lineY+random(5)+(myY-lineY)/50.0;
  
  
myY = myY + 1;
myX = myX + 1;

if (mousePressed){
  myX = mouseX;
  myY = mouseY;
}

translate(myX, myY);
//if (mouseX > lineX){
//  myX = myX + 20;
//  rotate(PI/myX); 
//}else{
//  myX = mouseX;
//}
//if (mouseY > lineY){
//  myY = myY + 20;
//  rotate(PI/5/myY); 
//}else{
//  myY = mouseY;
//}

rotate(radians(random(30))); 
  line(myX, myY, lineX, lineY);
  line(myY, myX, lineX, lineY);
strokeWeight(7);

if (colour <255){
      colour = colour + 0.05;
} else { colour = 0;
}

  stroke(colour, 200, 200, 75);
  
if (mousePressed && (mouseButton == LEFT)) {
    lineX = lineX+10;
    lineY = lineY+10;
    translate(myX, myY);
      rotate(PI/10); 

} else if (mousePressed && (mouseButton == RIGHT)) {
   lineX = lineX-10;
   lineY = lineY-10;  
       translate(myX, myY);
     rotate(PI/-5); 

}


}




void keyPressed()
{
//    background(0);
}
