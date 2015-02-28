
int xPos = 800;
int yPos = 800;
int xLength = 20;
int yLength = 20;
int xPos2 = 800;
int yPos2 = 800;
int xLength2 = 20;
int yLength2 = 20;
color bcolr = color(250,250,250);

void setup(){
  size(600, 600);
  background(0);
}

void draw(){
//brush size
  textSize(15);
  fill(250,250,250);
  text("Brush Size",20,50);
  text("1 = 20",20,65);
  text("2 = 30",20,80);
  text("3 = 40",20,95);
  text("4 = 50",20,110);
  text("5 = 60",20,125);
  text("6 = 70",20,140);
  text("7 = 80",20,155);
  text("8 = 500",20,170);
  text("9 = 5",20,185);
  text("Press Shift then 'N' to Clear",130, 50);
//brush 1
  fill(bcolr);
  ellipse(xPos,yPos,xLength,yLength);
  noStroke();
  smooth();
  
//color shelf
//red
  fill(250,0,0);
  rect(400,40,30,30);
//green
  fill(0,250,0);
  rect(440,40,30,30);
//blue
  fill(0,0,250);
  rect(480,40,30,30);
//yellow
  fill(250,250,0);
  rect(520,40,30,30);
//white
  fill(590,250,250);
  rect(400,80,30,30);
//black
  fill(0,0,0);
  rect(440,80,30,30);
//light grey
  fill(40,40,40);
  rect(480,80,30,30);
//orange
  fill(250,30,0);
  rect(520,80,30,30);
//brown
  fill(40,30,0);
  rect(400,120,30,30);
//purple
  fill(40,0,30);
  rect(440,120,30,30);
//pink
  fill(255, 102, 204);
  rect(480,120,30,30);
//dark grey
  fill(5,5,5);
  rect(520,120,30,30);
  
//color show block
  fill(bcolr);
  rect(350,40,40,40);
  
//mouse color select code
if(mousePressed && (mouseButton==RIGHT)){
     bcolr = get(mouseX,mouseY);
}

//mouse click code
if(mousePressed && (mouseButton==LEFT)){
  xPos = mouseX;
  yPos = mouseY;
} else{
  xPos = 800;
  yPos = 800;
}

//brush size code
if(keyCode=='1'){
   xLength = 20;
   yLength = 20;
   xLength2 = 20;
   yLength2 = 20;
}else if(keyCode=='2'){
   xLength = 30;
   yLength = 30;
   xLength2 = 30;
   yLength2 = 30;
}else if(keyCode=='3'){
   xLength = 40;
   yLength = 40;
   xLength2 = 40;
   yLength2 = 40;
}else if(keyCode=='4'){
   xLength = 50;
   yLength = 50;
   xLength2 = 50;
   yLength2 = 50;
}else if(keyCode=='5'){
   xLength = 60;
   yLength = 60;
   xLength2 = 60;
   yLength2 = 60;
}else if(keyCode=='6'){
   xLength = 70;
   yLength = 70;
   xLength2 = 70;
   yLength2 = 70;
}else if(keyCode=='7'){
   xLength = 80;
   yLength = 80;
   xLength2 = 80;
   yLength2 = 80;
}else if(keyCode=='8'){
   xLength = 500;
   yLength = 500;
   xLength2 = 500;
   yLength2 = 500;
}else if(keyCode=='9'){
   xLength = 5;
   yLength = 5;
   xLength2 = 5;
   yLength2 = 5;
}

//reset code
if(keyCode==SHIFT){
  background(0,0,0);
}
}
