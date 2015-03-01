
float contMud;
float ya;
float i;
float escala = 500;
float omg = 1;
int nbOfHorizontalLines = 10;
int nbOfVerticalLines = 20;
float i2, j2, escala2, angulo, n, c, radius, angle;



void setup() {
  size (400, 400);
  background(0);  
  textSize(32);
  stroke(255, 0, 0);
  //noLoop();
  rectMode(CENTER);
  ellipseMode(CENTER);
  smooth();
}

void draw() {
  contMud++;
  ya++;
  escala-=.3;
  omg++;
  if (omg == 5) {
    omg = omg*(-1);
  } else if (omg == -5) {
    omg = omg*1;
  }

  if (contMud > 100 && contMud < 400) {
    ellipse (random(ya), random(contMud), contMud, ya);
  } else if (contMud > 400 && contMud < 500) {
    background(0);
    fill(255, 0, 0);
    text("reduzir", (width/2) - 50, height/2);
  } else  if (contMud > 500 && contMud < 800) {
    background(0);
    fill(255);
    ellipse(80, 80, contMud, ya);
    ellipse(40, 120, contMud, ya);
    ellipse(200, 200, contMud, ya);
    ellipse(400, 400, contMud, ya);
  } else if (contMud > 800 && contMud < 900) {
    background(0);
    fill(255, 0, 0);
    text("organizar", (width/2) - 70, height/2);
  } else if (contMud > 900 && contMud < 1100) {
    fill(255);
    background(0);
    ellipse(width/2 - 50, height/2 - 50, 50, 50);
    ellipse (width/2 + 50, height/2 - 50, 50, 50);
    ellipse(width/2 - 50, height/2 + 50, 50, 50);
    ellipse (width/2 + 50, height/2 + 50, 50, 50);
  } else if (contMud > 1100 && contMud < 1200) {
    background(0);
    fill(255, 0, 0);
    text("tempo", (width/2) - 50, height/2);
  } else if (contMud > 1200 && contMud < 1600) {
    fill(255);
    background(0);
    ellipse(width/2, height/2, escala, escala);
  } else if (contMud > 1600 && contMud < 1700) {
    background(0);
    fill(255, 0, 0);
    text("aprender", (width/2) - 60, height/2);
  } else if (contMud > 1700 && contMud < 2000) {
    background(0);
    fill(255, 120);
    stroke(0, 0, 255, 120);
    ellipse((width/2) - 15, height/2, 60+omg, 60-omg);
    stroke(255, 0, 0, 120);
    ellipse((width/2) + 15, height/2, 60-omg, 60+omg);
  } else if (contMud > 2000 && contMud < 2100) {
    background(0);
    fill(255, 0, 0);
    text("diferenças", (width/2) - 70, height/2);
  } else if (contMud > 2100 && contMud < 2400) {
    background(0);

    float distanceBetweenHorizontalLines = (float)height/nbOfHorizontalLines;
    float distanceBetweenVerticalLines = (float)width/nbOfVerticalLines;

    for (int i = 0; i < nbOfHorizontalLines; i++)
    {
      line(0, i*distanceBetweenHorizontalLines, width+omg, i*distanceBetweenHorizontalLines + omg);
    }

    for (int i = 0; i < nbOfVerticalLines; i++)
    {
      line (i*distanceBetweenVerticalLines, 0, i*distanceBetweenVerticalLines + omg, height+omg);
    }

    fill(random(235, 255));
    ellipse(width/2, height/2, 60, 60);
  } else if (contMud > 2400 && contMud < 2500) {
    background(0);
    fill(255, 0, 0);
    text("contexto", width/2 - 60, height/2);
  } else if (contMud > 2500 && contMud < 2800) {
    //contexto
    fill(255);
    background(0);
    ellipse(width/2, height/2, 50, 50);
    fill(random(255), random(255), random(255));
    ellipse(random(width), random(height), 10, 10);
  } else if (contMud > 2800 && contMud < 2900) {
    background(0);
    fill(255, 0, 0);
    text("emoção", width/2 - 50, height/2);
  } else if (contMud > 2900 && contMud < 3200) {
    //emoção
    background(0);
    noStroke();
    fill(255 + (omg*10), 0, 0);
    ellipse(width/2, height/2 - 100, 40, 40);
    fill(0, 0, 255 + (omg*10));
    rect(width/2, height/2, 40, 40);
    fill(255 + (omg*10), 255 + (omg*10), 0);
    triangle(width/2, height/2 + 100, width/2 + 20, height/2 + 140, width/2 - 20, height/2 + 140);
  } else if (contMud > 3200 && contMud < 3300) {
    background(0);
    fill(255, 0, 0);
    text("confiança", width/2 - 60, height/2);
  } else if (contMud > 3300 && contMud < 3600) {
    background(0);
    int linha = 0; 
    while (linha < width) {
      linha+=5;
      stroke(255, 0, 0);
      fill(255);
      ellipse(linha, linha, 1, 1);
    }
  } else if (contMud > 3600 && contMud < 3700) {
    background(0);
    fill(255, 0, 0);
    text("fracasso", width/2 - 60, height/2);
  } else if (contMud > 3700 && contMud < 4000) {
    background(0);
    noFill();
    stroke(255, 50);
    n++; 
    c++;
    radius = c * sqrt(n);
    angle = n * 137.5;
    angulo=random(360);
    //rotate(radians(angulo));
    stroke(random(255), random(255));
    escala2+=0.001;
    for (float i2=width/2; i2<width; i2+=20) {
      for (float j2=height/2; j2<height; j2+=20) {
        pushMatrix();
        translate(width/2, height/2);
        rotate(radians(angle));
        scale(escala2);
        rect(i2, j2, j2, i2);
        popMatrix();
      }
    }
  } else if (contMud > 4000 && contMud < 4100) {
    background(0);
    text("a única", width/2 - 60, height/2);
  } else if (contMud > 4100 && contMud < 10000) {
    background(0);
    rectMode(CENTER);
    rect(0, 0, 400-mouseX, 400-mouseY);
  }
}


void mousePressed() {
  background(0);
  textSize(16);
  text("reduzir", 90, 30);
  text("organizar", 90, 60);
  text("tempo", 90, 90);
  text("aprender", 90, 120);
  text("diferenças", 90, 150);
  text("contexto", 90, 180);
  text("emoção", 90, 210);
  text("confiança", 90, 240);
  text("fracasso", 90, 270);
  text("a única", 90, 300);
}

void mouseReleased() {
  background(0);
}



