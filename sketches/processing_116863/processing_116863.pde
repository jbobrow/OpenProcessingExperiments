
String quote = "EASTER EASTER EASTER";
String quote1 = "Press the mouse";
float x = width/7.5;
float speed = .01;
void setup(){
  size(480,240);
  smooth();
  strokeWeight(30);
  textSize(36);
  frameRate(15);
}

void draw(){
  background(255);
  text(quote1, width/3, height/2+50);
  stroke(255);
  fill(139,0,255);
  for(int i =0; i<500;i++){
  line(40,0,70,height);
  if(mousePressed == true){
    x += speed;
    fill(255);
    rect(-1,-1,width,height);
    stroke(24,240,295,80);
    fill(random(200));
    text(quote, x, height/1.2);
    if(x >= width){
      x = -width+10;
    }
  }
  }
  line(0,100,width,50);
  if(mousePressed == true){
    stroke(247,5,195,80);
  }
  line(40,0,70,height);
  line(0,0,width,50);
  line(400, 0, width, height);
  fill(random(255),random(255),random(255));
  ellipse(random(width),random(height),20,20);
  ellipse(random(width),random(height),20,20);
  ellipse(random(width),random(height),20,20);
}
