
float[] distribution = new float[30];
void setup(){
  size(500,500);
  background(49,14,12);
  rectMode(RADIUS);

  //render donuts
  noStroke();
  fill(214,149,80);
  ellipse(width / 2,height / 2,width / 5,width / 5);
}

void draw(){
  float brushSize = 8;

  if(mousePressed){
    for(int i = 0;i < distribution.length;i++){
      distribution[i] = int(randomGaussian() * brushSize);
    }
    drawLine();
  }

  //save image
  if(keyPressed == true && key == 's'){
    saveFrame("yourName.jpg");
  }

  //refresh
  if(keyPressed == true && key == 'r'){
    //render donuts
    background(49,14,12);

    noStroke();
    fill(214,149,80);
    ellipse(width / 2,height / 2,width / 5,width / 5);

  }
}

void drawLine(){
  translate(mouseX, mouseY);
  for(int i = 0;i < distribution.length;i++){
    rotate(random(TWO_PI));

    switch(int(random(3) % 3)){
      case 0:
        stroke(250,37,94,random(150,200));//pink
        break;
      case 1:
        stroke(37,201,250,random(150,200));//blue
        break;
      case 2:
        stroke(37,250,87,random(150,200));//green
        break;
      default:
        break;
    }
    strokeWeight(random(2,4));
    float dist = abs(distribution[i]);

    line(0,0,dist,0);
  }
}

