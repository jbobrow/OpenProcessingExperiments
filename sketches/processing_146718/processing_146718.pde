

void setup(){
  size(1000,1000);
  //sky:
  noStroke();
  fill(#0A66FF);
  rect(0,0,1000,500);
  //grass:
  noStroke();
  fill(#03FF2E);
  rect(0,500,1000,500);
  //house
  stroke(#000000);
  fill(#FFFFFF);
  rect(275,650,200,200);
  //door
  rect(300,700,75,150);
  //champ
  rect(425,535,50,100);
  //roof
  triangle(370, 515, 225, 675, 525, 675);
  //smoke
  ellipse(470,500,45,25);
  ellipse(550,400,90,50);
  ellipse(670,300,135,75);
  ellipse(770,100,175,100);
}  

void draw(){
  //Sun
  stroke(255);
  fill(255,0,0,25);
  translate(width/64, height/64);
  float zoom = map(mouseX, 0, width, 0.1, 4.5);
  scale(zoom);
  ellipse(mouseX,mouseY,200,200);  
}





