
int i;
float x;

void setup(){
  size(600,390);
  background(255);
  noStroke();
  fill(6,21,90);
rect(0,0,260,210);
}

void draw(){//white and red strips
 fill(196,17,8);
rect(0,0,600,30);
rect(0,60,600,30);
rect(0,120,600,30);
rect(0,180,600,30);
rect(0,240,600,30);
rect(0,300,600,30);
rect(0,360,600,30);

fill(6,21,90);
rect(0,0,260,210);

if(random(0,1)<0.5){
    stroke(180,180,255);
  } else{
    stroke(200,200,255);
  }
  for(i=0; i<10; i++){
    x=random(20,25);
    ellipse(random(200), random(200),x,x);
  }
}

