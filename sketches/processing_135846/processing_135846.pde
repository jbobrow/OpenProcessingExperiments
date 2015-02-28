
void setup(){
  size(400,400);
  background(0);
}

int i=150;
int j=10;
void draw(){
  frameRate(20);
  noStroke();
  i=i+j;
  if((i<0)||(i>=255)){
    j=j*-1;
  }
  fill(60,180,i,100);
  if(mousePressed == true) { 
    if(mouseX<200){
      triangle(0,130,0,270,mouseX,mouseY);
    }
    if((mouseX<400)&&(mouseX>200)){
      triangle(400,130,400,270,mouseX,mouseY);
    }
  }
  else{
    float r=random(120,250);
    fill(60,180,i,30);
    ellipse(200,200,r,r);
  }
}

