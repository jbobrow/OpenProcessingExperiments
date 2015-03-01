
float r = 0;
float backR;
float backG;
float backB;

void setup (){
size(700,700);
backR = random(0,100);
backG = random(0,100);
backB = random(0,100);
background(random(0,100),random(0,100),random(0,100));
rectMode(CENTER);

noStroke();
smooth();

}

void draw(){
  fill(backR, backG, backB, 50); //DIFFERENCE between fill and background --> fill will not wipe background 255 = full opacity default
  rect(width/2, height/2, width,height);
   translate(350, 350); //will follow mouse MOVES FRAME OF REFFERENCE NOT THE SHAPE ITSELF 
  rotate(r);
   fill(8, 0, 0);
  rect(0, 0, 100, 100);
  translate(80, 80); //will follow mouse MOVES FRAME OF REFFERENCE NOT THE SHAPE ITSELF 
  rotate(r);
   fill(8, 0, 0);
  rect(0, 0, 90, 90);
  translate(80, 80); //will follow mouse MOVES FRAME OF REFFERENCE NOT THE SHAPE ITSELF 
  rotate(r);
   fill(8, 0, 0);
  rect(0, 0, 80, 80);
  translate(80, 80); //will follow mouse MOVES FRAME OF REFFERENCE NOT THE SHAPE ITSELF 
  rotate(r);
   fill(8, 0, 0);
  rect(0, 0, 70, 70);
  translate(80, 80); //will follow mouse MOVES FRAME OF REFFERENCE NOT THE SHAPE ITSELF 
  rotate(r);
   fill(8, 0, 0);
  rect(0, 0, 60, 60);
  translate(80, 80); //will follow mouse MOVES FRAME OF REFFERENCE NOT THE SHAPE ITSELF 
  rotate(r);
   fill(8, 0, 0);
  rect(0, 0, 50, 50);

  
  fill(255); // will not show up without this
  translate(mouseX, mouseY); //will follow mouse MOVES FRAME OF REFFERENCE NOT THE SHAPE ITSELF 
  rotate(r);
  rect(0, 0, 500, 500);
  fill(8, 0, 0);
  rect(0, 0, 450, 450);
  fill(255);
  rect(0, 0, 400, 400);
  fill(8, 0, 0);
  rect(0, 0, 350, 350);
  fill(8, 0, 0);
  rect(0, 0, 300, 300);
  fill(255);
  rect(0, 0, 250, 250);
  fill(8, 0, 0);
  rect(0, 0, 150, 150);
  fill(255);
  rect(0, 0, 100, 100);
  fill(8, 0, 0);
  rect(0, 0, 50, 50);
  fill(255);
  rect(0, 0, 25, 25);
  fill(8, 0, 0);
  rect(0, 0, 12.5, 12.5);
  fill(255);
  
r = r +0.02;// speed of rotation 
}
