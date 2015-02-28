
void setup(){
  size(500,500);
  smooth();
  textSize(64);
  textAlign(CENTER);
  
}

void draw(){
  background(204);
  if(keyPressed){
  if(key=='h'){
  line(30,60,90,60);
}if (key=='n'){
  line(30,20,90,100);
  } if (key=='a'){
  line(30,60,90,60);
  line(30,20,90,20);
  }
  }
    line(30,20,30,100);
line(90,20,90,100);   
}

