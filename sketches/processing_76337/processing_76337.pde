
float r;
float sw;

void setup(){
  size(600,600);
  colorMode(HSB,360,100,100);
  background(0,0,99);
  frameRate(7);
}


//yellow
void draw(){
  background(0,0,99);
  for(int i=0; i<30; i++){
    translate(width/2,height/2);
    rotate(radians(random(360)));
    stroke(54,80,90,80);
    strokeWeight(sw=random(4,5));
    noFill();
    
    if(sw<4.8){
      ellipse(0,0,r=random(200,250),random(r/1.2, 1.2*r));
    }else{
      ellipse(0,0,r=random(200,280),random(r/1.3, 1.3*r));
    }
    resetMatrix();
  }
  
  
  //red
  for(int i=0; i<250; i++){
    translate(width/2,height/2);
    rotate(radians(random(360)));
    stroke(359,60,80,90);
    strokeWeight(sw=random(2,5));
    noFill();
    
    if(sw>2.8){
      ellipse(0,0,r=random(180),random(r/1.15, 1.2*r));
    }else{
      ellipse(0,0,r=random(0,220),random(r/1.15, 1.2*r));
    }
    resetMatrix();
  }
}


