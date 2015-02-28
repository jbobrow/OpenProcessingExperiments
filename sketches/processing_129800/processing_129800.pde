
void setup(){
  size(800,800);
  background(0);
  font = createFont("ACaslonPro-Bold-48.vlw",48);
  radius = random(5,100);
}
float radius = 50;
int mode = 1;
PFont font;
float colorpath=0;
void draw(){
  background(0);
  if (mode==1){
  draw_circles();
  }
  if (mode==2){
    draw_rectangles();
  }
  if (keyPressed){
    if (key == '1'){
      mode = 1;
      
    }
    if (key == '2'){
      mode = 2;
    }
  }
  help();
  if (colorpath>255){
    colorpath=0;
  }
  else{
    colorpath +=1;
  }
}


void draw_circles(){
  for (int i = 0; i<(width/radius); i++){
    noStroke();
    fill(i*10+colorpath);
    ellipse((i*radius)+radius/2, height/2, radius,radius);
  }
}

void draw_rectangles(){
    for (int i = 0; i<(width/radius); i++){
    noStroke();
    fill(i*10-colorpath);
    rectMode(CENTER);
    rect((i*radius)+radius/2, height/2, radius,radius);
  }
}

void help(){
  fill(255);
  textFont(font, 12);
  textAlign(CENTER);
  text("Press 1 for Circles", width/2, 20);
  text("Press 2 for Rectangles", width/2, 40);
}
  
