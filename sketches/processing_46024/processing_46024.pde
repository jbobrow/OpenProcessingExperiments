
//int a = (int)random(0,256);

void setup(){
  background(255);
  size(500,500);
  fill(255);
  textFont(createFont("GillSans",72));
  textAlign(CENTER);
}

void draw(){
  background((int)random(0,256),(int)random(0,256),(int)random(0,256));
  //a=a-1;
  delay(200);
  text("Hello World!", width/2, height/2);
}

