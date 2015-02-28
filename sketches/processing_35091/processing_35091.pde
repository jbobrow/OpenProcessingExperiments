
void setup(){
  size(300,300);
  background(0);
  smooth();
  frameRate(10);
}

int c =0;

void draw(){
  
  float a;
  float b;
  a = random(0,width);
  b = random(0,height);

  c += 10;
  
  /*for (int x = 40; x < width-40; x+=20){
      strokeWeight(1);
      colorMode(RGB,300);
      stroke(a,b,300-b);
      ellipse(x,c,40,40);
    }
    */
  strokeWeight(.5);
  line(0,c,width,c);
  line(0,c+20,width,c+20);
  line(0,c+40,width,c+40);
  line(0,c+60,width,c+60);
  line(0,c+80,width,c+80);
  line(0,c+100,width,c+100);
  line(0,c+120,width,c+120);
  line(0,c+140,width,c+140);
  line(0,c+160,width,c+160);
  line(0,c+180,width,c+180);
  line(0,c+200,width,c+200);
  line(0,c+220,width,c+220);
  line(0,c+240,width,c+240);
  line(0,c+260,width,c+260);
  line(0,c+280,width,c+280);
  line(0,c+300,width,c+300);
  if (c > height){
    c = 0;
  }
  noStroke();
  fill(0,10);
  rect(0,0,width,height);
  for (int y = height/2; y< height; y += 5){
    strokeWeight(.5);
    colorMode(RGB,300);
    stroke(a,b,300-b);
    line(0,y,mouseX,mouseY);
    //line(0,y,a,b);
  }
  for (int y = 0; y< height/2; y += 5){
    strokeWeight(.5);
    colorMode(RGB,300);
    stroke(a,b,300-b);
    line(width,y,mouseX,mouseY);
    //line(width,y,a,b);
  }
  for (int x = width/2; x< width; x += 5){
    strokeWeight(.5);
    colorMode(RGB,300);
    stroke(a,b,300-b);
    line(x,0,mouseX,mouseY);
    //line(x,0,a,b);
  }
  for (int x = 0; x< width/2; x += 5){
    strokeWeight(.5);
    colorMode(RGB,300);
    stroke(a,b,300-b);
    line(x,height,mouseX,mouseY);
    //line(x,height,a,b);
  }
  fill(0,90);
  strokeWeight(2);
  ellipse(mouseX,mouseY,200,200);
}


