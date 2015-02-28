
void setup(){
  size(500,500);
  background(255);
  noStroke();
  smooth();
}

void draw(){
  for(int a=0;a<5;a++){
  cible();
  }
}

void cible(){  
  float x = random(width), y=random(height);
  float r=60;
  boolean bk = true;
  
  fill(0,50);
  ellipse(x+4, y+4, r, r);
  
  if(random(100)<50){bk=false;} 
  while (r>10){
    if(bk){
      fill(0);
    } else {
      fill(255);
    }
    ellipse(x,y, r, r); 
    r*=random(0.75,0.96); 
    bk=!bk;
  }
}
