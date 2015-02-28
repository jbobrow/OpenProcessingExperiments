
//eclipse pattern with background greyscale


void setup(){
size(600,600);
background(255);
int y;
loop();

}

void draw(){

  frameRate(1100);
noFill();
stroke(random(1,255));
strokeWeight(.00001);
for (int x = 1000; x > 0; x -= random(1,10)){
  ellipse(300,300,x,x);
}
  
    int y = 0;
    strokeWeight(0);
    line(y+1, 2,3,4);

       if(y > 30){
        background(random(1,255));
  }
  
  noFill();
stroke(random(1,255));
strokeWeight(.00000001);
for (int x = 10; x > 0; x -= random(1,10)){
  ellipse(random(width),random(height),x,x);
}
}

