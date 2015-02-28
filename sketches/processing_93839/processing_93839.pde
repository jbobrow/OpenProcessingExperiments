
//fields
int clicker = 0;
// Weight in Kilograms
float weight = 0;
//methods
void setup() {
  size(800, 800);
  background(155);
}
void mousePressed() {
  clicker++;
}

void draw() {
  if (clicker == 0) {
    fill(255);
    textSize(24);
    text("Click to see the average weight of humans by continent", 10, 30);
  }
  else {
    if (clicker == 1) {
      background(0);
      mousePressed();
    }
  }
  if (clicker>1) {
    if (mouseX > 0 && mouseX <= 160) {
      amountAsia();
    }
    else {
      if (mouseX > 160 && mouseX <= 320) {
        amountAfrica();
      }
      else {
        if (mouseX > 320 && mouseX <= 480) {
          amountWorld();
        }
        else {
          if (mouseX > 480 && mouseX <= 640) {
            amountEurope();
          }
          else {
            if (mouseX > 640 && mouseX <= 800) {
              amountNorthAmerica();
            }
          }
        }
      }
    }
    //Asia
    if (mouseX > 0 && mouseX <= 160) {
      textSize(24);
      fill(255, 0, 0);
      text("Asia", 50, 25);  
      fill(0);
      text("Africa", 190, 25);  
      fill(0);
      text("World", 350, 25);  
      fill(0);
      text("Europe", 480, 25);  
      fill(0);
      text("North America", 590, 25);
    }
    else {
      //Africa
      if (mouseX > 160 && mouseX <= 320) {
        textSize(24);
        fill(0);
        text("Asia", 50, 25);  
        fill(255, 0, 0);
        text("Africa", 190, 25);  
        fill(0);
        text("World", 350, 25);  
        fill(0);
        text("Europe", 480, 25);  
        fill(0);
        text("North America", 590, 25);
      }
      else {
        //World
        if (mouseX > 320 && mouseX <= 480) {
          textSize(24);      
          fill(0);
          text("Asia", 50, 25);  
          fill(0);
          text("Africa", 190, 25);  
          fill(255, 0, 0);
          text("World", 350, 25);  
          fill(0);
          text("Europe", 480, 25);  
          fill(0);
          text("North America", 590, 25);
        }
        else {
          //Europe
          if (mouseX > 480 && mouseX <= 640) {
            textSize(24);
            fill(0);
            text("Asia", 50, 25);  
            fill(0);
            text("Africa", 190, 25);  
            fill(0);
            text("World", 350, 25);  
            fill(255, 0, 0);
            text("Europe", 480, 25);  
            fill(0);
            text("North America", 590, 25);
          }
          else {
            //North America
            if (mouseX > 640 && mouseX <= 800) {
              textSize(24);
              fill(0);
              text("Asia", 50, 25);  
              fill(0);            
              text("Africa", 190, 25);  
              fill(0);
              text("World", 350, 25);  
              fill(0);
              text("Europe", 480, 25); 
              fill(255, 0, 0); 
              text("North America", 590, 25);
              fill(255);
            }
          }
        }
      }
    }
  }
}
void amountWorld() {
  weight = 62.0;
  create(weight);
}
void amountNorthAmerica() {
  weight = 80.7;
  create(weight);
}
void amountEurope() {
  weight = 70.8;
  create(weight);
}
void amountAfrica() {
  weight = 60.7;
  create(weight);
}
void amountAsia() {
  weight = 57.7;
  create(weight);
}
void create(float weight) {
  fill(155);
  noStroke();
  rectMode(CENTER);
  rect(400,400,800,800);
  ellipseMode(CENTER);
  fill(255);
  ellipse(400,290,80,80);
  rect(400,350,20,50);
  rect(400,375,200,20);
  rect(375,500,20,150);
  rect(425,500,20,150);
  ellipse(400,400,(int)(weight * 2),(int)(weight * 2.3));
  fill(255);
  stroke(255);
  noFill();
  rect(400,630,120,80);
  rect(400,580,200,20);
  fill(255);
  textSize(24);
  text(weight + "Kgs.", 355, 635);
  fill(0);
  rect(700,700,200,200);
  fill(255);
  ellipse(700,700,100,100);
  stroke(0);
  line(700,700,700,800);
  line(700,700,(int)(cos(2 * PI *(weight/120) + PI/3) * 100) + 700,(int)(sin(2 * PI *(weight/120) + PI/3) * 100) + 700); 
}

