
String quote = "EASTER EASTER EASTER";

void setup(){
  size(480,240);
  smooth();
  strokeWeight(30);
  textSize(36);
}

void draw(){
  background(255);
  stroke(255);
  fill(139,0,255);
  for(int i =0; i<500;i++){
  line(40,0,70,height);
  if(mousePressed == true){
    stroke(24,240,295,80);
    fill(random(200));
    text(quote, width/7.5, height/1.2);
  }
  }
  line(0,100,width,50);
  if(mousePressed == true){
    stroke(247,5,195,80);
  }
  line(40,0,70,height);
  line(0,0,width,50);
  line(400, 0, width, height);
}
