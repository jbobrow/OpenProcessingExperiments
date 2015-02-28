
int stage = 0;

void setup() {
  size(500, 400);
  background(155);
  smooth();
}

void draw() {
  //Main Menu
  if (stage == 0){
    textSize(20);
    fill(250, 0, 0);
    textSize(45);
    text("Connect The Dot", 10, 50);
    fill(255);
    //Easy rect
    rect(350, 50, 140, 30);
    //line(350,50,350,80);
    //Normal rect
    rect(350, 175, 140, 30);
    //Hard rect
    rect(350, 300, 140, 30);
    //How to play
    rect(25, 300, 250, 30);
    textSize(25);
    fill(0, 255, 155);
    text("Easy", 375, 75);
    fill(0, 0, 255);
    text("Normal", 375, 200);
    fill(255, 0, 0);
    text("Hard", 375, 325);
    fill(0);
    text("How To Play", 50, 325);
  }else if(stage == 1){
    textSize(30);
    Text("Stage 1 OK!",200,200);
  }else if(stage == 2){
    textSize(30);
    Text("Stage 2 OK!",200,200);
  }else if(stage == 3){
    textSize(30);
    Text("Stage 3 OK!",200,200);
  }else if(stage == 4){
    textSize(30);
    Text("Stage 4 OK!",200,200);
  }
}
void mouseClicked() {

  if (diffclutyEasy()) {
    stage == 1;
  }
  else if (diffclutyNormal()) {
    stage == 2;
  }
  else if (diffclutyHard()) {
    stage == 3;
  }
  else if (HTP()) {
    stage == 4;
  }
}
boolean diffclutyEasy() {
  if (mouseX > 350 && mouseX < 490 && mouseY > 50 && mouseY < 80) {
    println("OK Easy");
    return true;
  }
  else {
    return false;
  }
}
boolean diffclutyNormal() {
  if (mouseX > 350 && mouseX < 490 && mouseY > 175 && mouseY <205) {
    println("OK Normal"); 
    return true;
  }
  else {
    return false;
  }
}
boolean diffclutyHard() {
  if (mouseX > 350 && mouseX < 490 && mouseY > 300 && mouseY < 330) {
    println("OK Hard"); 
    return true;
  }
  else {
    return false;
  }
}
boolean HTP() {
  if (mouseX > 25 && mouseX < 250 && mouseY > 300 && mouseY < 330) {
    println("OK How To Play"); 
    return true;
  }
  else {
    return false;
  }
}

