
//Append Exercise "Obeservation Lab" by Xiaofeng Lin
//advised by Jennifer Presto
PImage lab; 

float[] xPos = new float[0];
float[] yPos = new float[0];

float[] xPos01 = new float[0];
float[] yPos01 = new float[0];

int r;

void setup() {
  size(500, 500);
  lab = loadImage("platform01.jpg");
}

void draw() {
  image(lab, 0, 0, 500, 500);
  println(xPos.length);
  fill(0, 0, random(100, 200), 40);
  stroke(0);

  if (mousePressed) {
    xPos = (float[])append(xPos, mouseX);
    yPos = (float[])append(yPos, mouseY);
  }
  for (int i=0; i < xPos.length-1; i++) {
    r = int(random(5, 10));
    strokeWeight(1);
    ellipse(xPos[i], yPos[i], r, r);

    for (int j = i + 1; j < xPos.length - 1; j++) {

      
      if (dist(xPos[i], yPos[i], xPos[j], yPos[j]) < r) {

        //fill xPos01 and yPos01 with locations of collisions
        if(xPos01.length < 40){
          xPos01 = (float[])append(xPos01, (xPos[i]+xPos[j])/2);
          yPos01 = (float[])append(yPos01, (yPos[i]+yPos[j])/2);
        } 
        
        fill(255, 0, 0);
        ellipse(xPos[i], yPos[i], r, r);
        ellipse(xPos[j], yPos[j], r, r);
        fill(0, 0, random(100, 200), 40); 
      }
    }

    //draw circles at collision points according to xPos01 and yPos01 
    for (int Q = 0; Q < xPos01.length; Q++) {

      fill(0, 255, 0);
      ellipse(xPos01[Q], yPos01[Q], 4, 4);
    }


    strokeWeight(.1);
    line(xPos[i], yPos[i], xPos[i+1], yPos[i+1]);
    if (!mousePressed) {
      xPos[i] += random(-1, 1);
      yPos[i] += random(-1, 1);
    }


    //red-button    
    if (mouseX > 33 && mouseX < 123 && mouseY > 455 && mouseY < 485) {
      stroke(255, 0, 0);
    }
    //green-button    
    if (mouseX > 131 && mouseX < 221 && mouseY > 455 && mouseY < 485) {
      stroke(0, 0, 255);
    }
    //blue-button    
    if (mouseX > 230 && mouseX < 320 && mouseY > 455 && mouseY < 485) {
      stroke(0, 255, 0);
    }
    
              //Slow down motion - red formula
    if (mouseX > 365 && mouseY > 451 && mouseX < 400 && mouseY < 486) {
      image(lab, 0, 0, 500, 500);
      fill(255, 0, random(0, 100), 30);
      rect(0, 0, 500, 423);
    }
    //Slow down motion - green formula
    if (mouseX > 405 && mouseY > 451 && mouseX < 440 && mouseY < 486) {
      image(lab, 0, 0, 500, 500);
      fill(random(0, 100), 255, 0, 30);
      rect(0, 0, 500, 423);
    }
    //Slow down motion - blue formula   
    if (mouseX > 445 && mouseY > 451 && mouseX < 480 && mouseY < 486) {
      image(lab, 0, 0, 500, 500);
      fill(0, random(0, 100), 255, 30);
      rect(0, 0, 500, 423);
    }
      
  }
  
  
  println(xPos01.length);
}

