
PImage flowers;

void setup() {
size(400,400);
background(255);
frameRate(60);
smooth();
flowers = requestImage("Flower.png");
}

void draw() {
  colorMode(RGB);
  if (key=='1'){
  if (mousePressed && (mouseButton == LEFT)) {
    stroke(0);
    strokeWeight(10);
    fill(0);
    line(pmouseX,pmouseY,mouseX,mouseY);}
    
  if (mousePressed && (mouseButton == RIGHT)) {
    stroke(252,48,48);
    fill(252,48,48);
    line(pmouseX,pmouseY,mouseX,mouseY); }
  }
    
    //change to random line and random circles
  if(key == '2'){
    if (mousePressed && (mouseButton == LEFT)) {
      fill(random(255),random(256),random(256));
      noStroke();
      ellipse(mouseX,mouseY,30,30);}
    }
    if(key == '2'){
    if (mousePressed && (mouseButton == RIGHT)) {
      fill(random(255),random(256),random(256));
      stroke(random(255),random(256),random(256));
      line(pmouseX,pmouseY,mouseX,mouseY);}
    }
   //change to spary circles and flowers
       if(key == '3'){
      if(mousePressed && (mouseButton == LEFT)){
      noStroke();
      fill(22,7,245);
      ellipse(mouseX+random(10),mouseY+random(10),5+random(10),5+random(10));}
       }
      if(key == '3'){
      if(mousePressed && (mouseButton == RIGHT)){
      noStroke();
      image(flowers,mouseX-(20),mouseY-(20),40,40);}
}
  
    
      
      //reset screen
  if (keyPressed && (key == 'q')) {
    filter(THRESHOLD);
    background(255);}
  }


