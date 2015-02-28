
int rectR = 0, rectG = 0, rectB = 0;
float bgR = 255, bgG = 255, bgB = 255;
int cSize = 500;

void setup(){
  size(500,500);
}

void draw(){
  buttonPress();
  background(bgR,bgG,bgB);
  fill(0);
  ellipse(250,250,cSize,cSize);
  noStroke();
  fill(rectR,rectG,rectB);
  rect(85,200,100,100);
  rect(195,200,100,100);
  rect(305,200,100,100);
  noFill();
  rect(85,170,100,30);
  rect(195,170,100,30);
  rect(305,170,100,30);
  rect(85,300,100,30);
  rect(195,300,100,30);
  rect(305,300,100,30);
  triButtons();
}

void buttonPress(){
  if(mouseX>85 && mouseX<185 && mouseY>170 && mouseY<200 && mousePressed==true){
    rectR++;
    bgR--;
    cSize--;
  }
  if(mouseX>195 && mouseX<295 && mouseY>170 && mouseY<200 && mousePressed==true){
    rectG++;
    bgG--;
    cSize--;
  }
  if(mouseX>305 && mouseX<405 && mouseY>170 && mouseY<200 && mousePressed==true){
    rectB++;
    bgB--;
    cSize--;
  }
  if(mouseX>85 && mouseX<185 && mouseY>300 && mouseY<330 && mousePressed==true){
    rectR--;
    bgR++;
    cSize++;
  }
  if(mouseX>195 && mouseX<295 && mouseY>300 && mouseY<330 && mousePressed==true){
    rectG--;
    bgG++;
    cSize++;
  }
  if(mouseX>305 && mouseX<405 && mouseY>300 && mouseY<330 && mousePressed==true){
    rectB--;
    bgB++;
    cSize++;
  }
}

void triButtons(){
  if(mouseX>85 && mouseX<185 && mouseY>170 && mouseY<200){
    fill(255);
    triangle(85,200,135,170,185,200);
  }
  else{
    fill(160,160,160,127);
    triangle(85,200,135,170,185,200);
  }
  if(mouseX>195 && mouseX<295 && mouseY>170 && mouseY<200){
    fill(255);
    triangle(195,200,245,170,295,200);
  }
  else{
    fill(160,160,160,127);
    triangle(195,200,245,170,295,200);
  }
  if(mouseX>305 && mouseX<405 && mouseY>170 && mouseY<200){
    fill(255);
    triangle(305,200,355,170,405,200);
  }
  else{
    fill(160,160,160,127);
    triangle(305,200,355,170,405,200);
  }
  if(mouseX>85 && mouseX<185 && mouseY>300 && mouseY<330){
    fill(255);
    triangle(85,300,135,330,185,300);
  }
  else{
    fill(160,160,160,127);
    triangle(85,300,135,330,185,300);
  }
  if(mouseX>195 && mouseX<295 && mouseY>300 && mouseY<330){
    fill(255);
    triangle(195,300,245,330,295,300);
  }
  else{
    fill(160,160,160,127);
    triangle(195,300,245,330,295,300);
  }
  if(mouseX>305 && mouseX<405 && mouseY>300 && mouseY<330){
    fill(255);
    triangle(305,300,355,330,405,300);
  }
  else{
    fill(160,160,160,127);
    triangle(305,300,355,330,405,300);
  }
}


