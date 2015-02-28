
int localX = 400;
int localY = 400;
float r = 120;
float g = 120;
float b = 120;


color p_cerulean = color(12,164,211);
color p_orange = color(255,165,0);
color p_dpurp = color(80,70,120);
color p_lpurp = color(80,70,100);
color p_eyes = color(mouseX,100,mouseY);
color back = color(120,120,120);

void setup(){
  size(800, 800);
  
}

void draw(){
  println("Mouse X:" + mouseX + "Mouse Y:" + mouseY);
  
  rectMode(CENTER);

  background(back);
  smooth();
  
  if (mousePressed && (mouseButton == LEFT)) {
    localX = mouseX;
    localY = mouseY;
  }
  
  if (mousePressed && (mouseButton == RIGHT)) {
    back=color(120 + mouseX,120 + mouseX - mouseY,120 + mouseY);
  }
    
  
  for (int i=0; i<5; i++){
  draw_creature(localX+(i*225-225),localY-(i*117-117));
  }
}

void draw_creature(int x,int y) {

  //spikes
  fill(p_cerulean);
  noStroke();
  triangle(x-10,y-210,x+10,y-210,x,y-260);
  triangle(x-25,y-215,x-40,y-200,x-45,y-235);
  triangle(x+25,y-215,x+40,y-200,x+45,y-235);
  
  //left foot
  fill(p_lpurp);
  noStroke();
  rect(x-50,y+160,50,30);
  
  //left toes
  fill(p_dpurp);
  noStroke();
  triangle(x-75,y+155,x-90,y+150,x-75,y+145);
  triangle(x-75,y+155,x-90,y+160,x-75,y+165);
  triangle(x-75,y+165,x-90,y+170,x-75,y+175);

  //right toes
  fill(p_dpurp);
  noStroke();
  triangle(x+75,y+155,x+90,y+150,x+75,y+145);
  triangle(x+75,y+155,x+90,y+160,x+75,y+165);
  triangle(x+75,y+165,x+90,y+170,x+75,y+175);

  //right foot
  fill(p_lpurp);
  rect(x+50,y+160,50,30);

  //main body
  fill(0);  //black
  ellipse(x,y-20,200,400);

  //white spot
  fill(255);
  ellipse(x,y+25,150,300);

  //beak
  fill(p_orange);  //orange
  triangle(x-10,y-170,x+10,y-170,x,y-140);
  
  //left eye
  fill(p_eyes);
  rect(x-10,y-190,10,10);
  
  //right eye
  fill(p_eyes);
  rect(x+10,y-190,10,10);
  
  //left eyebrow
  stroke(120);
  strokeWeight(5);
  line(x-15,y-205,x-5,y-200);

  //right eyebrow
  stroke(120);
  strokeWeight(5);
  line(x+15,y-205,x+5,y-200);
  
  noStroke();
  
  //left flipper
  fill(0);
  rotate(.25);
  ellipse(x-30,y-65,50,200);
  
  //right flipper
  fill(0);
  rotate(-.5);
  ellipse(x+10,y+125,50,200);
}


