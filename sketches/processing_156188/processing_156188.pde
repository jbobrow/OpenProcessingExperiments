
PImage cat;

void setup(){
  size(800,800);
  cat=loadImage("cat.png");
  background(0,0,0);
}

void draw(){
  if(dist(400,400,mouseX,mouseY)<=300){
    fill(229,73,1);
  }else{
    fill(0);
  }
  ellipse(400,400,600,600);
  image(cat,160,160);
  fill(17,194,26);
  rect(300,338,24,24);
  rect(380,338,24,24);
  noStroke();

  if(mousePressed){
    fill(random(255));
  }else{
    fill(236,158,242);
  }
  
  rect(340,360,25,25);
  rect(340,390,25,25);

  fill(0);
  rect(300+mouseX/90,348,10,10);
  rect(380+mouseX/90,348,10,10);
  

  }


