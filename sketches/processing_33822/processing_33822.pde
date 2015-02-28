
float posX = 400;
float posY = random(300);
int speedX = 10;
int speedY = 15;

boolean bounceBall = true;

//keeps track of each mouse click
int pressCount = 0;

void setup(){
  size(800,600);
  background(255,136,8);
  smooth();

}

void draw(){
  background(255,136,8);
  noStroke();
  ellipse(posX, posY, 50, 50);
  
  if(bounceBall == true){
    bounce();
  }
}

void bounce(){
  //x movement
  posX+=speedX;
  if(posX < 50 || posX > width - 50){
    speedX *= -1;
  }
  
  //y movement
  posY+=speedY;
  if(posY < 50 || posY > height - 50){
    speedY *= -1;
  }

}

void mousePressed(){
  bounceBall = !bounceBall;
  pressCount++;
  println(pressCount);
  
  if(pressCount == 5){
    //do something
    fill(211,59,232);
    speedX = 20;
  }
}

void keyPressed(){
  if(key == 'r' || key == 'R'){
    //reset our counter
    pressCount = 0;
    println("pressCount reset");
  }
}

                
                
