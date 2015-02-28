
void setup(){
  size(800, 800);
  
}

void draw(){
  println("Mouse X:" + mouseX + "Mouse Y:" + mouseY);
  
  rectMode(CENTER);

  background(120);
  smooth();

  //spikes
  fill(12,164,211);
  noStroke();
  triangle(mouseX+390,mouseY+190,mouseX+410,mouseY+190,mouseX+400,mouseY+140);
  triangle(mouseX+375,mouseY+185,mouseX+360,mouseY+200,mouseX+355,mouseY+165);
  triangle(mouseX+425,mouseY+185,mouseX+440,mouseY+200,mouseX+445,mouseY+165);
  
  //left foot
  fill(80,70,100);
  noStroke();
  rect(mouseX+350,mouseY+560,50,30);
  
  //left toes
  fill(80,70,120);
  noStroke();
  triangle(mouseX+325,mouseY+555,mouseX+310,mouseY+550,mouseX+325,mouseY+545);
  triangle(mouseX+325,mouseY+555,mouseX+310,mouseY+560,mouseX+325,mouseY+565);
  triangle(mouseX+325,mouseY+565,mouseX+310,mouseY+570,mouseX+325,mouseY+575);

  //right toes
  fill(80,70,120);
  noStroke();
  triangle(mouseX+475,mouseY+555,mouseX+490,mouseY+550,mouseX+475,mouseY+545);
  triangle(mouseX+475,mouseY+555,mouseX+490,mouseY+560,mouseX+475,mouseY+565);
  triangle(mouseX+475,mouseY+565,mouseX+490,mouseY+570,mouseX+475,mouseY+575);

  //right foot
  fill(80,70,100);
  rect(mouseX+450,mouseY+560,50,30);

  //main body
  fill(0);  //black
  ellipse(mouseX+400,mouseY+380,200,400);

  //white spot
  fill(255);
  ellipse(mouseX+400,mouseY+425,150,300);

  //beak
  fill(255, 165, 0);  //orange
  triangle(mouseX+390,mouseY+230,mouseX+410,mouseY+230,mouseX+400,mouseY+260);
  
  //left eye
  fill(mouseX,100,mouseY);
  rect(mouseX+390,mouseY+210,10,10);
  
  //right eye
  fill(mouseX,100,mouseY);
  rect(mouseX+410,mouseY+210,10,10);
  
  //left eyebrow
  stroke(120);
  strokeWeight(5);
  line(mouseX+385,mouseY+195,mouseX+395,mouseY+200);

  //right eyebrow
  stroke(120);
  strokeWeight(5);
  line(mouseX+415,mouseY+195,mouseX+405,mouseY+200);
  
  noStroke();
  
  //left flipper
  fill(0);
  rotate(.25);
  ellipse(mouseX+370,mouseY+335,50,200);
  
  //right flipper
  fill(0);
  rotate(-.5);
  ellipse(mouseX+410,mouseY+525,50,200);
}


