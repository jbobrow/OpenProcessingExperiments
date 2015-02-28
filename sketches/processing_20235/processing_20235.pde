
void setup () {
  size(600,600);
  background(255);
  rectMode(CENTER);
}

float corniceWidth = 400;
float corniceHeight = 10;
float baseWidth = 400;
float baseHeight = 10;
int windowSpaceing = 20;


void draw () {
}

void keyPressed () {
  if (key == 'a') {
    corniceWidth ++;
    Building();
  }
  if (key == 'w') {
    corniceHeight ++;
    Building();
  }
  if (key == 'd') {
    corniceWidth --;
    Building();
  }
  if (key == 's') {
    corniceHeight --;
    Building();
  }
  if (key == 'j') {
    baseWidth ++;
    Building();
  }
  if (key == 'i') {
    baseHeight ++;
    Building();
  }
  if (key == 'l') {
    baseWidth --;
    Building();
  }
  if (key == 'k') {
    baseHeight --;
    Building();
  }
  if (key == '1') {
    windowSpaceing +=10;
    Building();
  }
  if (key == '2') {
    windowSpaceing -=10;
    Building();
  }
}

void Building () {
  background(255);
  noStroke();
  fill(156,138,121);
  rect(width/2,512,width,200);
  stroke(1);
  fill(255);
  
  rect(width/2,height/2,400,250);//building
  
  beginShape();//door
  vertex ((width/2)-20,425);
  vertex ((width/2)-20,425-75);
  bezierVertex((width/2)-20,425-125,(width/2)+20,425-125,(width/2)+20,425-75);
  vertex((width/2)+20,425);
  endShape();
  
  rect(width/2,175,corniceWidth,corniceHeight);//cornice
  
  rect(width/2,425,baseWidth,baseHeight);//base
  
  for (float x = 150; x < 451; x += windowSpaceing) {
    fill(253,242,205);
    beginShape();
    vertex(x-10,300);
    vertex(x-10,265);
    bezierVertex(x-10,225,x+10,225,x+10,265);
    vertex(x+10,300);
    vertex(x-10,300);
    endShape();
  }
  
  
}
    

