
void setup() {
  size(600, 400);
  background(180);
}
 
void draw() {
  background(180);
 
  int counter = 0;
  int space = 20;
  
  //big drop
  
  while (counter < 100) {
    stroke(255);
    noFill();
    ellipse(0, counter*50, 80, 80);
    counter = counter + 1;

  }
  
  counter = 0;
  
  while (counter < 100) {
    stroke(255);
    noFill();
    ellipse(100, counter*50, 80, 80);
    counter = counter + 1;

  }
  
    counter = 0;
  
  while (counter < 100) {
    stroke(255);
    noFill();
    ellipse(200, counter*50, 80, 80);
    counter = counter + 1;

  }
  
    counter = 0;
  
  while (counter < 100) {
    stroke(255);
    noFill();
    ellipse(300, counter*50, 80, 80);
    counter = counter + 1;

  }
  
    counter = 0;
  
  while (counter < 100) {
    stroke(255);
    noFill();
    ellipse(400, counter*50, 80, 80);
    counter = counter + 1;

  }
  
    counter = 0;
  
  while (counter < 100) {
    stroke(255);
    noFill();
    ellipse(500, counter*50, 80, 80);
    counter = counter + 1;

  }
  
    counter = 0;
  
  while (counter < 100) {
    stroke(255);
    noFill();
    ellipse(600, counter*50, 80, 80);
    counter = counter + 1;

  }
  
  //cross drops
    counter = 0;
  
  while (counter < 100) {
    stroke(255);
    noFill();
    ellipse(50, counter*50, 80, 80);
    counter = counter + 1;

  }
  
    counter = 0;
  
  while (counter < 100) {
    stroke(0,0,120);
    noFill();
    ellipse(150, counter*50, 80, 80);
    counter = counter + 1;

  }
  
      counter = 0;
  
  while (counter < 100) {
    stroke(255);
    noFill();
    ellipse(250, counter*50, 80, 80);
    counter = counter + 1;

  }
  
      counter = 0;
  
  while (counter < 100) {
    stroke(0,0,120);
    noFill();
    ellipse(350, counter*50, 80, 80);
    counter = counter + 1;

  }
  
      counter = 0;
  
  while (counter < 100) {
    stroke(255);
    noFill();
    ellipse(450, counter*50, 80, 80);
    counter = counter + 1;

  }
  
      counter = 0;
  
  while (counter < 100) {
    stroke(0,0,120);
    noFill();
    ellipse(550, counter*50, 80, 80);
    counter = counter + 1;

  }
  
  //rain drops

  counter = 0;
   
    while (counter < 100) {
      fill(100, 100, counter*space);
      noStroke();
      ellipse(0, counter*50, 20, 20);
      counter = counter + 1;
     
  }
  
  counter = 0; 
 
  while (counter < 100) {
    fill(100, 100, counter*space);
    noStroke();
    ellipse(100, counter*50, 20, 20);
    counter = counter + 1;
 
  }
   
  counter = 0;
   
    while (counter < 100) {
      fill(100, 100, counter*space);
      noStroke();
      ellipse(200, counter*50, 20, 20);
      counter = counter + 1;
     
  }

  counter = 0;
   
    while (counter < 100) {
      fill(100, 100, counter*space);
      noStroke();
      ellipse(300, counter*50, 20, 20);
      counter = counter + 1;
     
  }

  counter = 0;
   
    while (counter < 100) {
      fill(100, 100, counter*space);
      noStroke();
      ellipse(400, counter*50, 20, 20);
      counter = counter + 1;
     
  }

  counter = 0;
   
    while (counter < 100) {
      fill(100, 100, counter*space);
      noStroke();
      ellipse(500, counter*50, 20, 20);
      counter = counter + 1;
     
  }  

  counter = 0;
   
    while (counter < 100) {
      fill(100, 100, counter*space);
      noStroke();
      ellipse(600, counter*50, 20, 20);
      counter = counter + 1;
     
  }
  
  //small drop
  
    counter = 0;
  
  while (counter < 100) {
    stroke(255);
    noFill();
    ellipse(0, counter*50, 40, 40);
    counter = counter + 1;

  }

    counter = 0;
  
  while (counter < 100) {
    stroke(255);
    noFill();
    ellipse(100, counter*50, 40, 40);
    counter = counter + 1;

  }
  
      counter = 0;
  
  while (counter < 100) {
    stroke(255);
    noFill();
    ellipse(200, counter*50, 40, 40);
    counter = counter + 1;

  }
  
      counter = 0;
  
  while (counter < 100) {
    stroke(255);
    noFill();
    ellipse(300, counter*50, 40, 40);
    counter = counter + 1;

  }
  
      counter = 0;
  
  while (counter < 100) {
    stroke(255);
    noFill();
    ellipse(400, counter*50, 40, 40);
    counter = counter + 1;

  }
  
      counter = 0;
  
  while (counter < 100) {
    stroke(255);
    noFill();
    ellipse(500, counter*50, 40, 40);
    counter = counter + 1;

  }
  
      counter = 0;
  
  while (counter < 100) {
    stroke(255);
    noFill();
    ellipse(600, counter*50, 40, 40);
    counter = counter + 1;

  }
  
  //feet 
  noStroke();
  fill(242,213,159);
  quad(200,410,200,300,250,280,250,410);
  
  noStroke();
  fill(242,213,159);
  quad(300,410,300,300,350,320,350,460);
  
  //toes
  stroke(10);
  line(225,290,225,300);
  
  stroke(10);
  line(325,310,325,320);
  
  //sandals
  noStroke();
  fill(10);
  quad(200,350,200,325,250,325,250,350);
  
  noStroke();
  fill(10);
  quad(200,390,200,365,250,365,250,390);
  
  noStroke();
  fill(10);
  quad(300,370,300,345,350,345,350,370);
  
  noStroke();
  fill(10);
  quad(300,410,300,385,350,385,350,410);
  
}



