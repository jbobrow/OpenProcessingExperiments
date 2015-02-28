
void setup(){
size(700,500);
background(255);
smooth();
frameRate(30);
}

void draw(){
float t = random(width);
float u = random(height);
line(t,u,t+20,u+20);
stroke (0,random(255));
strokeWeight(random(35));
if(mousePressed){
  stroke(255,random(255));
line(mouseX-random(10,600),mouseY-random(10,600),random(width),random(height));}
filter(BLUR);
//saveFrame("images/export-"+"-#####.jpeg");
//if ( frameCount >= 6000 ) {
//      exit();
}

void saveImage() {
  String fileName = timeStamp()+".tiff";
  PImage imageSave = get(0,0,width,height);
  imageSave.save(fileName);
}

String timeStamp() {
 String timestamp = year()+"_"+month()+"_"+day()+"_"+minute()+"_"+second()+"_"+millis();
 return timestamp;
}


