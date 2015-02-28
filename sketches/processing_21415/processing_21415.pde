
////////////VARIABLES//////////////////////////////////////////////////////////////////////////////////////////////////////
//below, I am declaring the classes
Circle circleAdd;
Circle circleAdd1;
Critter critterOne;
int centerX=250;
int centerY=250;
int n=0;
int pressed = 0;

void setup() {
 size (500,500); //the size of my sketch in pixels
 smooth (); //turns on anti-aliasing for smoothing

 critterOne = new Critter(250, 250); // I just drew the initial critter
 circleAdd = new Circle(200,200);
 circleAdd1 = new Circle(250,150);
 
}

void draw() {
 background(237, 145, 33); //background color: carrot
 critterOne.display();

 if (pressed == 1){
    circleAdd.display(1,90, 30);
    stroke (244, 244, 244, 90);
    strokeWeight (1);
    line(centerX+35, centerY-15, 200,200);
   }
   else if(pressed ==2){
    circleAdd.display(1, 90, 30);
    stroke (244, 244, 244, 90);
    strokeWeight (1);
    line(centerX+35, centerY-15, 200,200);
    circleAdd1.display(1, 20, 40);
    stroke (244, 244, 244, 90);
    strokeWeight (1);
    line(200, 200, 250,150);
    }
 
 }
 

void mousePressed(){
 if (mouseX>272 && mouseX<308 && mouseY<258 && mouseY>222){
 pressed = 1;}
  else if(mouseX>170 && mouseX<230 && mouseY<230 && mouseY>170){
 pressed = 2;}
 
}




