
PImage myImage; PImage myImage2; PImage myImage3;
boolean play =true;

void setup() {

size(1000,1000);
 myImage = loadImage("a.jpg");
myImage2 = loadImage("b.jpg");
myImage3 = loadImage("c.jpg");

}

void draw(){

 if(play==true){
image(myImage, random (-100, 1100), random (-40, 750), 400, 400);
tint(33,184,69,87);
 image(myImage2, random (-100, 1100), random (-40, 750), 400, 400);
  //tint(45, 36, 124, 5);
  //tint(45, 255, 205, 42);
  image(myImage3, random (-100, 1100), random (-40, 750), 400, 400);
  noStroke();
  ellipse(mouseX, mouseY, mouseX, mouseY);	

//noStroke();
  //variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
 }
}
	

void variableEllipse(int x, int y, int px, int py) {

float speed = abs(x-px) + abs(y-py);
stroke(speed);
ellipse(x, y, speed, speed);

}

void keyPressed(){
  if(key== 'p'){
      play=false;
    }
    if(key=='g'){
    play=true;
  }
}


