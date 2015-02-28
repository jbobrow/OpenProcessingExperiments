
int radius = 50;
boolean stay = false;
int count;
int[] Xpos = {};
int[] Ypos = {};
int[] cRadius = {};
float[] bColor = {};
float r = random(0,255);
float g = random(0,255);
float b = random(0,255);


void setup(){
  size(1000,1000);
  background(0);
  noCursor();
}

void changeSize(){
  if (keyCode == UP){
    radius += 5;
  }
  if (keyCode == DOWN){
    if (radius != 0){
    radius -= 5;
    }
  }
}




void draw(){
  r = random(0,255);
  g = random(0,255);
  b = random(100,255);
  if (keyPressed==true){
    changeSize();
  }
  
  if (mousePressed == false){

        fill(0);
        ellipse(pmouseX,pmouseY,radius+6,radius+6);
        fill(0,0,255);
        ellipse(mouseX,mouseY,radius,radius);
      }
        
  else{
    fill(0,0,b);
    ellipse(mouseX,mouseY,radius,radius);
    append(Xpos,mouseX);
    append(Ypos,mouseY);
    append(bColor,b);
    append(cRadius,radius);
}


}

