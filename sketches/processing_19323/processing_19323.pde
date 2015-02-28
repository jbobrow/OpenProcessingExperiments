
float bounceX = 150;
float bounceY = 150;
float speed = 10;
float state = 0;

void setup(){
  size (1000,1000);
  smooth();
}

void draw(){
  background(255);
  
  noFill();
  noStroke();
  rectMode(CORNERS);
  
  if (bounceX < width/2 && bounceY < height/2) {
    fill(0);
    rect(0,0,500,500);
  }
  
    if (bounceX < width/2 && bounceY > height/2) {
    fill(0);
    rect(0,500,500,1000);
  }
  
    if (bounceX > width/2 && bounceY < height/2) {
    fill(0);
    rect(500,0,1000,500);
  }
  
    if (bounceX > width/2 && bounceY > height/2) {
    fill(0);
    rect(500,500,1000,1000);
  }
  
    if (mouseX > 450 && mouseX < 550 && mouseY > 450 && mouseY < 550) {
    fill(random(0,255));
    rect(450,450,550,550);
  }
  
  
  
  
    if (mousePressed) {
      
//vertical line 1
      fill(random(0,255));
      rect(0,0,50,50);
      fill(random(0,255));
      rect(0,50,50,100);
      fill(random(0,255));
      rect(0,100,50,150);
      fill(random(0,255));
      rect(0,150,50,200);
      fill(random(0,255));
      rect(0,200,50,250);
      fill(random(0,255));
      rect(0,250,50,300);
      fill(random(0,255));
      rect(0,300,50,350);
      fill(random(0,255));
      rect(0,350,50,400);
      fill(random(0,255));
      rect(0,400,50,450);
      fill(random(0,255));
      rect(0,450,50,500);
      fill(random(0,255));
      rect(0,500,50,550);
      fill(random(0,255));
      rect(0,550,50,600);
      fill(random(0,255));
      rect(0,600,50,650);
      fill(random(0,255));
      rect(0,650,50,700);
      fill(random(0,255));
      rect(0,700,50,750);
      fill(random(0,255));
      rect(0,750,50,800);
      fill(random(0,255));
      rect(0,800,50,850);
      fill(random(0,255));
      rect(0,850,50,900);
      fill(random(0,255));
      rect(0,900,50,950);
      fill(random(0,255));
      rect(0,950,50,1000);
      
//veritcal line 2
      fill(random(0,255));
      rect(50,0,100,50);
      fill(random(0,255));
      rect(50,50,100,100);
      fill(random(0,255));
      rect(50,100,100,150);
      fill(random(0,255));
      rect(50,150,100,200);
      fill(random(0,255));
      rect(50,200,100,250);
      fill(random(0,255));
      rect(50,250,100,300);
      fill(random(0,255));
      rect(50,300,100,350);
      fill(random(0,255));
      rect(50,350,100,400);
      fill(random(0,255));
      rect(50,400,100,450);
      fill(random(0,255));
      rect(50,450,100,500);
      fill(random(0,255));
      rect(50,500,100,550);
      fill(random(0,255));
      rect(50,550,100,600);
      fill(random(0,255));
      rect(50,600,100,650);
      fill(random(0,255));
      rect(50,650,100,700);
      fill(random(0,255));
      rect(50,700,100,750);
      fill(random(0,255));
      rect(50,750,100,800);
      fill(random(0,255));
      rect(50,800,100,850);
      fill(random(0,255));
      rect(50,850,100,900);
      fill(random(0,255));
      rect(50,900,100,950);
      fill(random(0,255));
      rect(50,950,100,1000);
      
//vertical line 3
      fill(random(0,255));
      rect(100,0,150,50);
      fill(random(0,255));
      rect(100,50,150,100);
      fill(random(0,255));
      rect(100,100,150,150);
      fill(random(0,255));
      rect(100,150,150,200);
      fill(random(0,255));
      rect(100,200,150,250);
      fill(random(0,255));
      rect(100,250,150,300);
      fill(random(0,255));
      rect(100,300,150,350);
      fill(random(0,255));
      rect(100,350,150,400);
      fill(random(0,255));
      rect(100,400,150,450);
      fill(random(0,255));
      rect(100,450,150,500);
      fill(random(0,255));
      rect(100,500,150,550);
      fill(random(0,255));
      rect(100,550,150,600);
      fill(random(0,255));
      rect(100,600,150,650);
      fill(random(0,255));
      rect(100,650,150,700);
      fill(random(0,255));
      rect(100,700,150,750);
      fill(random(0,255));
      rect(100,750,150,800);
      fill(random(0,255));
      rect(100,800,150,850);
      fill(random(0,255));
      rect(100,850,150,900);
      fill(random(0,255));
      rect(100,900,150,950);
      fill(random(0,255));
      rect(100,950,150,1000);
      
  rectMode(CORNER);
  
//vertical line 
  
//vertical line 8
      fill(random(0,255));
      rect(800,0,50,50);
      fill(random(0,255));
      rect(800,50,50,50);
      fill(random(0,255));
      rect(800,100,50,50);
      fill(random(0,255));
      rect(800,150,50,50);
      fill(random(0,255));
      rect(800,200,50,50);
      fill(random(0,255));
      rect(800,250,50,50);
      fill(random(0,255));
      rect(800,300,50,50);
      fill(random(0,255));
      rect(800,350,50,50);
      fill(random(0,255));
      rect(800,400,50,50);
      fill(random(0,255));
      rect(800,450,50,50);
      fill(random(0,255));
      rect(800,500,50,50);
      fill(random(0,255));
      rect(800,550,50,50);
      fill(random(0,255));
      rect(800,600,50,50);
      fill(random(0,255));
      rect(800,650,50,50);
      fill(random(0,255));
      rect(800,700,50,50);
      fill(random(0,255));
      rect(800,750,50,50);
      fill(random(0,255));
      rect(800,800,50,50);
      fill(random(0,255));
      rect(800,850,50,50);
      fill(random(0,255));
      rect(800,900,50,50);
      fill(random(0,255));
      rect(800,950,50,50);
}
  
  noStroke();
  fill(255,0,0);
  rectMode(CORNER);
  rect(bounceX,bounceY,50,50);
  if (state == 0) {
    bounceX = bounceX + speed;
    if (bounceX > 800) {
      bounceX = 800;
      state = 1;
    }
  } else if (state == 1) {
    bounceY = bounceY + speed;
    if (bounceY > 800) {
      bounceY = 800;
      state = 2;
    }
  } else if (state == 2) {
    bounceX = bounceX - speed;
    if (bounceX < 150) {
      bounceX = 150;
      state = 3;
    }
  } else if (state == 3) {
    bounceY = bounceY - speed;
    if (bounceY < 150) {
      bounceY = 150;
      state = 0;
    }
  }

  
  //fill(random(150,255),random(150,255),random(150,255),100);
  //ellipse(mouseX,mouseY,random(50,200),random(50,200));
  
}

