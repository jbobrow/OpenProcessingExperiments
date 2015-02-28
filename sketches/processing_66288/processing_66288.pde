
float posY = 200;
boolean path = false;
float r=int(random(510));
float g=int(random(510));
float b=int(random(510));

void setup(){
  size(510,510);

  
  frameRate(60);
}

void draw(){
  fill(r-posY/2,g-posY/2,b-posY/2);
  noStroke();
  rect(0,0,width,height);
  println("R = "+posY/2+ "G = "+posY/2+ "B="+posY/2);
  fill(255);
  ellipse(width/2,posY,50,50);


  if(path == false && posY <509){
    posY++;
  }
  if(path == true && posY >1){
    posY--;
  }
  if(posY >= 485){
    path = true;
  }
  if(posY <=25){
    path = false;
  }
}

