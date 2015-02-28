

  PFont myfont;

int y=5;

void setup(){
  
  size(400,300);
  
  noStroke();
  smooth();
  myfont = loadFont("Archer-Medium-80.vlw");
}

void draw(){
  background(255);
  pattern();
  textFont(myfont);
  fill(255,0,150);
  text("Happy", 75,130);
  text("Rakhi", 75,200);
}

void pattern(){
    
  for(int y=5;y<height;y+=60){
  for(int x=0; x<width ; x+=10){
    noStroke();
    fill(255,62,170,200);
    triangle(x,y+10,x+5,y,x+10,y+10);
    fill(70,165,200,200);
    ellipse(x+5,y+20,10,10);
    stroke(215,110,45,200);
    line(x,y+30,x+10,y+40);
    noStroke();
    fill(255,200,0,250);
    rect(x,y+45,9,9);
  }
  }
}

