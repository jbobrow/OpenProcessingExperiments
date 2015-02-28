

void setup() {
  size(600,600);
  background(0);
  smooth();
}

void draw() {

  background(0);

  if(mousePressed == true) {
    for (int x = 20; x<=180; x+=10) {
      for (int y =420; y<=580; y+=10)
        line(x,y,100,500);
      stroke(108);
    }
  }
  else {
    fill(200);
    for(int x = 20; x <= 180; x+=10) {
      for(int y=420; y <=580; y+=10)
        ellipse(x,y,4,4);
       
    }
  }


  textSize(40);
  fill(255);
  text("K",410,60);
  text("D",410,120);
  text("C",410,180);
  if (keyPressed) {
    if ((key == 'k') || (key == 'K')) {
      text("onkuk",440,60);
    }
    if ((key == 'D') || (key == 'd')) {
      text("igital",440,120);
    }
    if ((key == 'C') || (key == 'c')) {
      text("lass",440,180);
    }
  }

  noStroke();
  fill(108);
  rect(200,200,200,200);
  if ((mouseX >=200) && (mouseX <300) && 
    (mouseY >=200) && (mouseY <300 )) {
    fill(255,180,180);
    rect(200,200,100,100);
  }
  else if((mouseX >=300) && (mouseX <=400) && 
    (mouseY >=200) && (mouseY <300)) {
    fill(233,178,255);
    rect(300,200,100,100);
  }
  else if((mouseX >=200) && (mouseX <300) &&
    (mouseY >=300) && (mouseY <400)) {
    fill(188,238,255);
    rect(200,300,100,100);
  }
  else if((mouseX >=300) && (mouseX <=400) &&
    (mouseY >=300) && (mouseY <=400)) {
    fill(188,255,195);
    rect(300,300,100,100);
  }
}


