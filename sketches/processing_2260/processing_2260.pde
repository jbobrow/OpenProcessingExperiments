
int i;
float alfa,variable;


void setup(){
  background(0);
  size(400,400);
  smooth();
  noFill();
  frameRate(40);
  //translate(mouseX,mouseY);
}

void draw(){
  background(0,alfa);
  
  for(i=20;i>0;i--){
    variable = random(255);
    alfa = random(100);
  }
  if(mousePressed) {
    strokeWeight(random(alfa));
    stroke(150+variable,205-variable,200-variable,alfa);
    fill(alfa*2,alfa*3,alfa*4);
    ellipse(pmouseX,pmouseY,random(60),random(140));
    line(pmouseX-alfa,pmouseY-alfa,pmouseX+alfa,pmouseY-alfa);
    line(pmouseX+alfa,pmouseY+alfa,pmouseX-alfa,pmouseY+alfa);
    line(pmouseX-alfa,pmouseY+alfa,pmouseX+alfa,pmouseY-alfa);
  }else{
    ellipse(mouseX,mouseY,random(10),random(20));
    line(mouseX,mouseY,pmouseX,pmouseY);
  }
}









