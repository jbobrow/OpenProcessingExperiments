
PFont f;
int i;
int j;
boolean beginTrolling;

void setup(){
  size(700,700);
  background(255);
  i = 0;
  f = createFont("Georgia", 160, true);
  textFont(f);
  textAlign(CENTER);
  smooth();
  j = 0;
  beginTrolling = false;
  drawButton();
}


void drawButton(){
  fill(100,100,100);
  rect(100,100,500,500);
  fill(255);
  text("Model", 350, 350);
  println("weed");
}
  
void draw(){
  
  if(mousePressed && (mouseX > 100 && mouseX < 600 && mouseY > 100 && mouseY < 600)){
    println("big weed");
    fill(255);
    rect(0,0,700,700);
    frisbee();
  }
  
  if(beginTrolling){
    noFill();
    stroke(0);
    ellipse(350,350,400,400);
    if(j%5 == 0){
      background(255);
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(i));
      fill(0);
      text("222",0,0);
      popMatrix();
      if(j%10 == 0){
        text("HI", 550, 680);
        text("HELLO", 350, 120);
      }else{
        text("HI", 150, 680);
      }
    }
    i+=10;
    j++;
  }
}

void frisbee(){
  int a = 10;
  int b = 680;
  long t = millis();
  while(millis() - t < 1000){
    if((millis() - t) % 100 == 0){
      background(255);
      fill(0, 255, 255);
      ellipse(a, b, 10, 10);
    }
    a++;
    b--;
  }
  beginTrolling = true;
}
  

