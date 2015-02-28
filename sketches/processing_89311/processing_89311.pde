
int curBrush;
void setup(){
  size(500, 500);
  background(255);
  curBrush = 0;
  println("Enter 0 for standard brush, 1 for experimental brush, 2 for crazy brush.");
  println("Make a funny face!");
  
}
void draw(){
  if(curBrush == 0){
    image(brush[0], mouseX, mouseY);
  }
  else if(curBrush == 1){
    image(brush[1], mouseX, mouseY);
  }
  else if(curBrush == 2){
    image(brush[2], mouseX, mouseY);
  }
}
void mouseClicked(){
  if(curBrush == 0){
    drawBrush0();
  }
  else if(curBrush == 1){
    drawBrush1();
  }
  else if(curBrush == 2){
    drawBrush2();
  }
}
void mouseDragged(){
  if(curBrush == 0){
    drawBrush0();
  }
  else if(curBrush == 1){
    drawBrush1();
  }
  else if(curBrush == 2){
    drawBrush2();
  }
}
void keyPressed(){
  if (key == '0'){
    curBrush = 0;
    println("Brush = Brush 0");
  }
  else if(key == '1'){
    curBrush = 1;
    println("Brush = Brush 1");
  }
  else if(key == '2'){
    curBrush = 2;
    println("Brush = Brush 2");
  }
}
void drawBrush0(){
  noStroke();
  fill(random(1, 256), random(1, 256), random(1, 256));
  ellipse(mouseX, mouseY, 20, 20);
}
void drawBrush1(){
  stroke(0);
  fill(255);
  ellipse(mouseX, mouseY, 50, 50);
  fill(0);
  ellipse(mouseX, mouseY, 10, 10); 
}
void drawBrush2(){
  int rand = int(random(4));
  if(rand == 0){
    stroke(0);
    fill(random(1, 256), random(1, 256), random(1, 256));
    triangle(mouseX + 20, mouseY + 20, mouseX, mouseY, mouseX - 20, mouseY + 20);
    fill(0);
    ellipse(mouseX - 10, mouseY + 10, 10, 10);
    ellipse(mouseX + 10, mouseY + 10, 10, 10);
    println("Nose!");
  }
  else if(rand == 1){
     stroke(0);
     fill(255);
     ellipse(mouseX, mouseY, 100, 40);
     rect(mouseX - 30, mouseY + 5, 10, 15);
     rect(mouseX - 10, mouseY + 10, 10, 15);
     rect(mouseX + 5, mouseY + 10, 10, 15);
     rect(mouseX + 20, mouseY + 5, 10, 15);
     rect(mouseX - 30, mouseY - 18, 10, 15);
     rect(mouseX -15, mouseY - 15, 10, 15);
    rect(mouseX, mouseY - 15, 10, 15);
   rect(mouseX + 25, mouseY - 18, 10, 15); 
   println("Mouth!");
  }
  else if(rand == 2){
    stroke(0);
    fill(160, 82, 45);
    ellipse(mouseX, mouseY, 20, 20);
    noFill();
    bezier(mouseX, mouseY, mouseX + 20, mouseY - 30, mouseX + 45, mouseY + 15, mouseX + 50, mouseY + 30);  
    println("Mole!");
}
    else {
      noStroke();
      fill(160, 82, 45);
      for(int i = 0; i <= 20; i++){
        rect(mouseX + 4 * i, mouseY, 5, 15);
      }
      println("Eyebrow!");
    }
}


