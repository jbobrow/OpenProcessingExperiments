
PFont font;
int flag=0;

void setup() {
  size(600, 600);
  font = loadFont("CourierNewPSMT-48.vlw");
}


void draw() {

  if (flag == 0)
  {  
    background(129);
    textFont(font, 11); 
    noStroke();

    fill(255, 255, 255);
    rect(10, 43, 6, 6);
    text("  w", 10, 50);

    fill(0, 0, 0); 
    rect(10, 59, 6, 6);
    text("  b", 10, 65);

    fill(255, 0, 0);
    rect(10, 75, 6, 6);
    text("  r", 10, 80);  

    fill(0, 203, 0);
    rect(10, 91, 6, 6);
    text("  g", 10, 95);

    fill(255, 218, 0);
    rect(10, 106, 6, 6);
    text("  y", 10, 110);

    fill(0, 202, 255);
    rect(10, 120, 6, 6);
    text("  s", 10, 125);

    fill(random(255), random(255), random(255));
    text("?", 9, 143);
    text("  x", 9, 143);
  }

  if (flag == 1)
  {
    smooth();  
    noStroke();  
    fill(255, 255, 255);  
    ellipse(mouseX, mouseY, 5, 5);

    fill(random(255), random(255), random(255));
    text("?", 9, 143);
    text("  x", 9, 143);
  }


  if (flag == 2)
  {
    smooth();  
    noStroke();  
    fill(0, 0, 0);    
    ellipse(mouseX, mouseY, 5, 5);
    fill(random(255), random(255), random(255));
    text("?", 9, 143);
    text("  x", 9, 143);
  }

  if (flag == 3)
  {
    smooth();  
    noStroke();  
    fill(255, 0, 0);  
    ellipse(mouseX, mouseY, 5, 5);
    fill(random(255), random(255), random(255));
    text("?", 9, 143);
    text("  x", 9, 143);
  }

  if (flag == 4)
  {
    smooth();  
    noStroke();  
    fill(0, 203, 0) ;
    ellipse(mouseX, mouseY, 5, 5);
    fill(random(255), random(255), random(255));
    text("?", 9, 143);
    text("  x", 9, 143);
  }

  if (flag == 5)
  {
    smooth();  
    noStroke();  
    fill(255, 218, 0);
    ellipse(mouseX, mouseY, 5, 5);
    fill(random(255), random(255), random(255));
    text("?", 9, 143);
    text("  x", 9, 143);
  }

  if (flag == 6)
  {
    smooth();  
    noStroke();  
    fill(0, 202, 255);
    ellipse(mouseX, mouseY, 5, 5);
    fill(random(255), random(255), random(255));
    text("?", 9, 143);
    text("  x", 9, 143);
  }

  if (flag == 7)
  {
    smooth();  
    noStroke();  
    fill(random(255), random(255), random(255));  
    ellipse(mouseX, mouseY, 5, 5);  
    fill(random(255), random(255), random(255));
    text("?", 9, 143);
    text("  x", 9, 143);
  }

  if (flag == 8)
  {
    smooth();  
    noStroke();  
    fill(#818181);  
    ellipse(mouseX, mouseY, 5, 5);

    fill(random(255), random(255), random(255));
    text("?", 9, 143);
    text("  x", 9, 143);
  }


  if (keyPressed == true ) {

    if (key== 'w') {
      flag = 1;
    }

    if (key== 'b') {
      flag =2;
    }

    if (key== 'r') {
      flag =3;
    }

    if (key== 'g') {
      flag =4;
    }

    if (key== 'y') {
      flag =5;
    }

    if (key== 's') {
      flag =6;
    }

    if (key== 'x') {
      flag =7;
    }
    if (key=='a') {
      flag=8;
    }
  }
}



