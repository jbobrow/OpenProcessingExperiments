
float dice = 0;

void setup(){
  size(800,800);
}

void draw(){
  
 
  cfs();
}


void cfs(){
  for (int x = 0; x <= 100; x++){
    fill(random(19),random(116),random(222),random(10));
    strokeWeight(1);
    stroke(205);
    line(random(800),random(800),100,800);
    rect(random(800),random(800),400,800);
  
}
  
}


