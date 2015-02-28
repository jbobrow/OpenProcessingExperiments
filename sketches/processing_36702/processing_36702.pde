
void setup () {
  size(600, 400);
  background(20, 88, 222);

  rectMode(CORNER); //creating soil
  fill(150, 50, 15);
  rect(0, 200, 600, 200);
  fill(255);//creating building
  rect(150, 50, 500, 200); 
strokeWeight(3);
  fill(70, 250, 50); //creating trees
  ellipse(100, 200, 60, 60);
  line(100, 200, 100, 300);
  ellipse(50, 100, 80, 80);
  line(50, 100, 50, 300);
    ellipse(70, 250, 80, 80);
     line(70, 250, 70, 350);
}

float count=0;
float num=5;

void draw() {
  fill(255,0,0); //creating column
  noStroke();
  if (count < num) { 
    rect(250+count * (width-185)/num, 250, 100/num, height/num);
  }
  if (random(6)>3) { //creating facade pattern from top
    if (count%4==0);
    fill(0, 250,10 );
    rect(150+count*width/20, 50, (width-100)/50, random(height-200));
  }
  if (random(15)<3) { //creating facade pattern from bottom
    fill(0, 10, 250);
    rect(150+count*width/50, 250, (width-300)/50, random(-height+200));
    count=count+0.6; // slowly increment the counter
  }
    ellipse(260, 300, 20, 20); //creating lamps
ellipse(310, 300, 20, 20); 
ellipse(560, 300, 20, 20);
}


