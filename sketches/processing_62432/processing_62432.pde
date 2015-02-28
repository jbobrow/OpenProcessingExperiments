
int x=0;
int y=325;

void setup(){
  size(600, 400);
  background(169, 190, 250);

}

void draw(){
  frameRate(30);

    
  if ((y>300)||(x>=200)){
    thing(mouseX, 325);
  }
  if ((mouseX<200)&&(y>300)){
    thing(225, 325);
  }
  if (mousePressed==true){
    thing(mouseX, y=y*-1/3);
  }
  if ((y<300)&&(mouseX<200)){
    thing(mouseX, 225);
  }
 mousePressed();
      wall();
}
void thing(int mouseX, int y){
  background(169, 190, 250);
  fill(74, 0, 250);
  smooth();
  noStroke();
  ellipse(mouseX, y, 50, 50);
  
  }
void mousePressed(){
  if ((mouseX>=200)){
    y=325;
  }
  if ((y>300)&&(mouseX>=200)){
    thing(mouseX, 325);
  }
  }

  
void wall(){
  if (x<=200){
    stroke(0);
    fill(255, 56, 33);
    rect(0, 250, 200, 150);
  }
  if(x>=500){
    stroke(0);
    fill(255, 56, 33);
    rect(500, 250, 100, 150);
  }
  else{
    stroke(0);
    fill(255, 56, 33);
    rect(0, 350, 600, 50);
  }
  stroke(0);
  line(0, 300, 200, 300);
  line(150, 250, 150, 300);
  line(50, 250, 50, 300);
  line(100, 300, 100, 350);
  line(50, 350, 50, 400);
  line(150, 350, 150, 400);
  line(250, 350, 250, 400);
  line(350, 350, 350, 400);
  line(450, 350, 450, 400);
  line(550, 350, 550, 400);
}




