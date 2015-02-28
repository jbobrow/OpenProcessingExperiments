
int x = 0;
int bounce = 10;

void setup() {
  size(800, 600);
  background(128,149,211);
}

void draw() {

  //background(100,200,170);
  strokeWeight(2);{
  ellipse(x, 200, 100, 100);
  }
  
  strokeWeight(2);{
  ellipse(x, 500, 100, 100);
  }
  
  strokeWeight(2);{
    rect(30,x,100,100);
  }
  
  strokeWeight(2);{
    rect(200,x,100,100);
  }
  
  strokeWeight(2);{
    rect(400,x,100,100);
  }
  
  strokeWeight(2);{
    rect(600,x,100,100);
  }
  
  x=x+bounce;
  
  if (x >= width-10){
    fill(105, 200, 100);
    bounce = bounce * -1;
  }
  
  if(x <= 0 ){
    fill(random(250),random(250),random(250));
     bounce = bounce * -2;
  }
  
  if(x >= 800){
    x=0;
  }
}


