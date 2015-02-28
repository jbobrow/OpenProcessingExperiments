
Circles myCircle1;
Circles myCircle2;
Circles myCircle3;
Circles myCircle4;
Circles myCircle5;

Squares mySquare1;
Squares mySquare2;
Squares mySquare3;
Squares mySquare4;

PImage myImage;
int a = 100;
int b = 100;
int mouseClicks = 0;
int ellipseX1;
int ellipseY1;
int ellipseX2;
int ellipseY2;
int ellipseX3;
int ellipseY3;
int ellipseX4;
int ellipseY4;
int ellipseX5;
int ellipseY5;
int rectX1;
int rectY1;
int rectX2;
int rectY2;
int rectX3;
int rectY3;
int rectX4;
int rectY4;
int x = 0;
int y = 0;
/*boolean testRect1 = false;
boolean testRect2 = false;
boolean testRect3 = false;*/
boolean player1win = false;
boolean player2win = false;
int drawRect1;
int drawRect2;
int drawRect3;
int drawRect4;
int drawRect5;
int drawRect6;
int drawRect7;
int drawRect8;
int drawRect9;
 
void setup(){
  size(600, 600);
  background(77, 50, 191);
  tint(0, 153, 204, 126);
  myImage = loadImage("processing.jpg");
}
void draw(){
  background(77, 50, 191);
  smooth();
  strokeWeight(3);
  fill(0);
  drawCell1();
  drawCell2();
  drawCell3();
  drawCell4();
  drawCell5();
  drawCell6();
  drawCell7();
  drawCell8();
  drawCell9();
  
  image(myImage, 401, 401, 198, 198);
  
  /*testRect1();
  testRect2();
  testRect3();
  testRect4();
  testRect5();
  testRect6();
  testRect7();
  testRect8();
  testRect9();*/
  
  
//draws first circle
  if(mouseClicks == 0|| mouseClicks == 2|| mouseClicks == 4|| mouseClicks == 6|| mouseClicks == 8){
    fill(0);
    ellipse(mouseX, mouseY, a, a);// allows follows mouse

  }
  if(mouseClicks > 0){
    fill(0);
    //ellipse(ellipseX1, ellipseY1, a, a);
     myCircle1.display();
}
//draws first square
if(mouseClicks == 1|| mouseClicks == 3|| mouseClicks == 5|| mouseClicks == 7|| mouseClicks == 9){   
  rect(mouseX, mouseY, b, b);
}
if(mouseClicks > 1){
      fill(0);
      //rect(rectX1, rectY1, b, b);
      mySquare1.display();
}
//draws second circle
if(mouseClicks == 0|| mouseClicks == 2|| mouseClicks == 4|| mouseClicks == 6|| mouseClicks == 8){
 ellipse(mouseX, mouseY, a, a);// allows follows mouse
}
  if(mouseClicks > 2){
  //ellipse(ellipseX2, ellipseY2, a, a);
            myCircle2.display();
}
//draws second square
if(mouseClicks == 1|| mouseClicks == 3|| mouseClicks == 5|| mouseClicks == 7|| mouseClicks == 9){   
  rect(mouseX, mouseY, b, b);
}
  if(mouseClicks > 3){
  //rect(rectX2, rectY2, b, b);
        mySquare2.display();
}
//draws third circle 
if(mouseClicks == 0|| mouseClicks == 2|| mouseClicks == 4|| mouseClicks == 6|| mouseClicks == 8){
   ellipse(mouseX, mouseY, a, a);// allows follows mouse
}
  if(mouseClicks > 4){
 // ellipse(ellipseX3, ellipseY3, a, a);
           myCircle3.display();
}
//draws third square 
if(mouseClicks == 1|| mouseClicks == 3|| mouseClicks == 5|| mouseClicks == 7|| mouseClicks == 9){   
  rect(mouseX, mouseY, b, b);
}
  if(mouseClicks > 5){
   //rect(rectX3, rectY3, b, b);
         mySquare3.display();

}
//draws fourth circle
if(mouseClicks == 0|| mouseClicks == 2|| mouseClicks == 4|| mouseClicks == 6|| mouseClicks == 8){
  ellipse(mouseX, mouseY, a, a);// allows follows mouse
}
  if(mouseClicks > 6){
 // ellipse(ellipseX4, ellipseY4, a, a);
           myCircle4.display();
}
//draws fourth square    
if(mouseClicks == 1|| mouseClicks == 3|| mouseClicks == 5|| mouseClicks == 7|| mouseClicks == 9){   
  rect(mouseX, mouseY, b, b);
}
  if(mouseClicks > 7){
  //rect(rectX4, rectY4, b, b);
        mySquare4.display();

}
//draws fifth circle    
if(mouseClicks == 0|| mouseClicks == 2|| mouseClicks == 4|| mouseClicks == 6|| mouseClicks == 8){
  ellipse(mouseX, mouseY, a, a);// allows follows mouse
}
  if(mouseClicks > 8){
  //ellipse(ellipseX5, ellipseY5, a, a);
            myCircle5.display();
} 
    
if ((drawRect1 == 1 && drawRect2 == 1 && drawRect3 == 1) || (drawRect1 == 1 && drawRect4 == 1 && drawRect7 == 1)) // this is only testing two ways of winning but you would write out all of the possible ways of winning
{
player1win = true; //a global boolean variable to keep track of who wins
fill(0); 
rect(0, 0, width, height);
}
}
 
void mousePressed(){
 ellipse(mouseX, mouseY, 50, 50);
 mouseClicks ++;
if(mouseClicks == 1){
  /*ellipseX1 = mouseX;
  ellipseY1 = mouseY;*/
  myCircle1 = new Circles(mouseX, mouseY);
}
if(mouseClicks == 2){
 /* rectX1 = mouseX;
  rectY1 = mouseY;*/
    mySquare1 = new Squares(mouseX, mouseY);

  
}
if(mouseClicks == 3){
  /*ellipseX2 = mouseX;
  ellipseY2 = mouseY;*/
    myCircle2 = new Circles(mouseX, mouseY);

}
if(mouseClicks == 4){
  /*rectX2 = mouseX;
  rectY2 = mouseY;*/
      mySquare2 = new Squares(mouseX, mouseY);

}
if(mouseClicks == 5){
  /*ellipseX3 = mouseX;
  ellipseY3 = mouseY;*/
    myCircle3 = new Circles(mouseX, mouseY);

}
if(mouseClicks == 6){
  /*rectX3 = mouseX;
  rectY3 = mouseY;*/
      mySquare3 = new Squares(mouseX, mouseY);

}
if(mouseClicks == 7){
  /*ellipseX4 = mouseX;
  ellipseY4 = mouseY;*/
    myCircle4 = new Circles(mouseX, mouseY);

}
if(mouseClicks == 8){
 /* rectX4 = mouseX;
  rectY4 = mouseY;*/
      mySquare4 = new Squares(mouseX, mouseY);

}
if(mouseClicks == 9){
  /*ellipseX5 = mouseX;
  ellipseY5 = mouseY;*/
    myCircle5 = new Circles(mouseX, mouseY);

}
/*drawRect1 = testRect1(mouseX, mouseY);
drawRect2 = testRect2(mouseX, mouseY);
drawRect3 = testRect3(mouseX, mouseY);
drawRect4 = testRect4(mouseX, mouseY);
drawRect5 = testRect5(mouseX, mouseY);
drawRect6 = testRect6(mouseX, mouseY);
drawRect7 = testRect7(mouseX, mouseY);
drawRect8 = testRect8(mouseX, mouseY);
drawRect9 = testRect9(mouseX, mouseY);*/
}

void drawCell1(){
stroke(0);
  fill(211, 30, 194);
  rect(0, 0, 200, 200);
}
void drawCell2(){
stroke(0);
  fill(27);
  rect(200, 0, 200, 200);
}
void drawCell3(){
stroke(0);
  fill(255, 0, 0);
  rect(200, 0, 200, 200);
}
void drawCell4(){
stroke(0);
  fill(203, 41, 90);
  rect(0, 200, 200, 200);
}
void drawCell5(){
stroke(0);
  fill(61, 151, 178);
  rect(200, 200, 200, 200);
}
void drawCell6(){
stroke(0);
  fill(41, 185, 47);
  rect(400, 200, 200, 200);
}
void drawCell7(){
stroke(0);
  fill(224, 218, 32);
  rect(0, 400, 200, 200);
}
void drawCell8(){
stroke(0);
  fill(245, 137, 22);
  rect(200, 400, 200, 200);
}
void drawCell9(){
stroke(0);
  fill(255, 0, 0);
  rect(400, 400, 200, 200);
}
/*int testRect0(int x, int y, int mouseClicks){ //test the top left rectangle, write 8 other functions to test the other areas
if(x > 0 && x < width/3 && y > 0 && y < height/3 && (mouseClicks == 0 || mouseClicks == 2 || mouseCLicks == 4 || mouseClicks == 6 || mouseClicks == 8)){
return 1; //there's a x in the area
}
else if(x > 0 && x < width/3 && y > 0 && y< height/3 && (mouseClicks == 1 || mouseClicks == 3 || mouseCLicks == 5 || mouseClicks == 7 || mouseClicks == 9)){
return 2; //there's an o in the area
}
else{
return 0; //nothing is in the area
}
}*/


class Circles{
  int x;
  int y;
  
  Circles(int _x, int _y){
    x = _x;
    y =_y;
  }
  
  void display(){
    fill(0);
    ellipse(x, y, 100, 100);
  }
}

class Squares{
  int w;
  int z;
  
  Squares(int _w, int _z){
    w = _w;
    z = _z;
  }
  
  void display(){
    fill(0);
    rect(w, z, 100, 100);
  }
}


