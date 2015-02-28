

float posX=random(width);
float posY=random(height);
float fps=40;

void setup(){
  size(250,250);
 
 background(10,160,170,50);
}

void draw(){

  
  /*if(mousePressed){
    background(random(50),random(50),random(50));
  }*/
//if(mousePressed){
 
  noStroke();
    fill(random(255),random(255),random(255),80);
    ellipse(random(width),random(height), 50,50);
  
      stroke(255,50);
  strokeWeight(2);

  line(random(250),random(250),random(250),random(250));
  }


