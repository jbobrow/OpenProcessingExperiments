
int i;

void setup (){
  size (500,500);
  
}

void draw (){
  background(255);
  fill(0);
  rect(0,0,100,100);
  fill(255);
  rect(100,0,100,100);
  fill(0);
  rect(200,0,100,100);
  fill(255);
  rect(300,0,100,100);
  fill(0);
  rect(400,0,100,100);
  
  for (int i = 100; i < 600; i = i+200) {
       fill(255);
  rect(0,i,100,100);
  fill(0);
  rect(100,i,100,100);
  fill(255);
  rect(200,i,100,100);
  fill(0);
  rect(300,i,100,100);
  fill(255);
  rect(400,i,100,100);
  }

  for (int i = 200; i < 600; i = i+200) {
      fill(0);
  rect(0,i,100,100);
  fill(255);
  rect(100,i,100,100);
  fill(0);
  rect(200,i,100,100);
  fill(255);
  rect(300,i,100,100);
  fill(0);
  rect(400,i,100,100);
  
  
}
  
}

