
int i;
int j;
float a;
float b;

void setup(){
  size(500,500);
}

void draw(){
  background(255);
  noStroke();
  
  for(i=0; i<50; i++){
    for(j=0; j<50; j++){ 
    fill(random(0,255),random(0,255),random(0,255));
    if ( dist(10+(i*10),10+(j*10),mouseX,mouseY)<30 ){
      a=5; b=5;}else{a=3; b=3;}
    rect(10+(i*10), 10+(j*10), a, b);
    stroke(50,50);
    line (10+(i*10),10+(j*10),mouseX,mouseY);
     
    }
  }
}
