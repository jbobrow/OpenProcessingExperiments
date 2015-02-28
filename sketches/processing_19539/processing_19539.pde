
boolean clicked=false;

void setup() {
size(250, 250);
smooth();
noStroke();
background(200, 230, 230);
strokeCap(SQUARE);//makes end of line square
strokeWeight(230);
//permanent line
stroke(random(155),random(80),100);
    line(0, 0, width*2, width);//make sure that the line covers entire screen first
}
void draw(){

  
  if(clicked==true){
    stroke(random(155),random(80),100);
    float x = random(width/2);
    line(0, 0, x*2, x);
    clicked=false;
  }
}
void mouseClicked(){
clicked=true;
}

