
float startx = 50;
float starty = 50;
boolean left = true;
boolean right = false;

void setup() {
size (250,250);
background (0);
smooth();
frameRate(15);
}

void draw() {
  if (keyPressed) {
    if(key == ' '){
      background(0);
    }
  }
  if(mousePressed) {
if(left){
    stroke (160,95,0);
strokeWeight(2);
line (startx,starty,mouseX,mouseY);
stroke (200,25,0);
strokeWeight(.5);
line(startx,starty,mouseX+30, mouseY-30);
}
}
else if(right);{
if(mousePressed){
  if(right){
 stroke (0,200,50);
strokeWeight(2);
line (200,200,mouseX,mouseY);
stroke (244,4,253);
strokeWeight(.5);
line(200,200,mouseX-30, mouseY+30);
  }
  }
}
}

void keyPressed(){
  if (key=='1'){
    right=true;
    left=false;
  }
  if(key=='2'){
    right=false;
    left=true;
  }
}


