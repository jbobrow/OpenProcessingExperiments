
/****************************************
*Assignment #2
*Name: Erin Penney
*Email: epenney@brynmawr.edu
*Course: CS 110 - Section #001
*Submitted: 9/18/12
*This is an abstract sketch. I used the "while" loop to make the lines appear in the beginning. Press the space bar 3 times in the beginning to watch lines appear. Then click in random locations to watch random rainbow fireworks. The lines get either bigger or smaller depending on where you click. There are also random circles. The background also randomly changes when you click. You can reset the background by pressing any key.
*
****************************************/
int y  = 80;
int x = 50;
int spacing = 50;
int ht = 20;
int end = 150;

//setup sketch  
  void setup() {
    size(500,500);
    background(150);
    smooth();
  }

//insert void draw
  void draw() {
    }

//make cool rainbow type stuff happen
  void mousePressed() {
    background(random(0,255), random(0,255), random(0,255));
    fill(random(0,255), random(0,255), random(0,255));
    noStroke();
    ellipse(random(0,500), random(0,500), 20,20);
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(random(0,500), random(0,500), 20,20);
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(random(0,500), random(0,500), 20,20);
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(random(0,500), random(0,500), 20,20);
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(random(0,500), random(0,500), 20,20);
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(random(0,500), random(0,500), 20,20);
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(random(0,500), random(0,500), 20,20);
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(random(0,500), random(0,500), 20,20);
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(random(0,500), random(0,500), 20,20);
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(random(0,500), random(0,500), 20,20);
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(random(0,500), random(0,500), 20,20);
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(random(0,500), random(0,500), 20,20);
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(random(0,500), random(0,500), 20,20);
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(random(0,500), random(0,500), 20,20);
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(random(0,500), random(0,500), 20,20);
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(random(0,500), random(0,500), 20,20);
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(random(0,500), random(0,500), 20,20);
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(random(0,500), random(0,500), 20,20);
    stroke(random(0,255), random(0,255), random(0,255));
    strokeWeight(10);
    line(0,0,mouseX,mouseY);
    stroke(random(0,255), random(0,255), random(0,255));
    line(0,500,mouseX,mouseY);
    stroke(random(0,255), random(0,255), random(0,255));
    line(500,0,mouseX,mouseY);
    stroke(random(0,255), random(0,255), random(0,255));
    line(500,500,mouseX,mouseY);
    stroke(random(0,255), random(0,255), random(0,255));
    line(250,500,mouseX,mouseY);
    stroke(random(0,255), random(0,255), random(0,255));
    line(500,250,mouseX,mouseY);
    stroke(random(0,255), random(0,255), random(0,255));
    line(0,250,mouseX,mouseY);
    stroke(random(0,255), random(0,255), random(0,255));
    line(250,0,mouseX,mouseY);
    noStroke();
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(mouseX,mouseY,20,20);
  }

//make lines appear momentarily in the beginning
  void keyPressed() {
    background(150);
    strokeWeight(5);
    if(x <= end) {
      line(x,y,x,y + ht);
      x = x + spacing;    
  }
  }
