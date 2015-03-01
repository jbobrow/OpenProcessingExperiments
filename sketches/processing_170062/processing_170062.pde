
int myState = 0;

void setup() {
  size(700, 700);
}

void draw() {
  background(#339999);
  fill(#ffffff);
  textSize(80);
  textAlign(CENTER);
  noStroke();
  
  switch(myState) {
    case 0:
    text("Start", width/2, height/2);
    break;
    
    case 1:
    text("Where are we?", width/2, height/2);
    break;
    
    case 2:
    background(#aaccff);
    fill(#90744F);
    ellipse(width/2, height+100, 1000, 600);
    fill(#ffffff);
    text("Question 1", width/2, height/2);
    break;
    
    case 3:
    background(#9999ff);
    fill(#ffff00);
    ellipse(600, 100, 50, 50);
    fill(#444444);
    quad(-100,500,100,300,500,900,-100,900);
    quad(100,700,300,500,700,1100,100,1100);
    fill(#ffffff);
    text("Question 2", width/2, height/2);
    break;
    
    case 4:
    background(#222244);
    fill(#000000);
    rect(100,400,200,500);
    rect(0,600, 700, 500);
    rect(400,500,200,500);
    fill(#ffffff);
    ellipse(200, 100, 70, 70);
    fill(#ffffff);
    text("Question 3", width/2, height/2);
    break;
  }
}

void mousePressed() {
 
  myState = (myState+1) % 5;
  
}


