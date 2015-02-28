
void setup() {
  size(300, 300);
  background(24, 239, 187);
}

float count=0;
float num=235;

void draw() {
  if (count<num) {
    if (count%2==0) {//this makes the main pattern
      fill(count/num*width, height/random(0, 255), width/random(0, 255));
      rect(count*width/num, random(50,250), width/num, random(0, 300));
    }
    else {
      if (count%17==0) {
        fill(random(10, 50), height/count, width/count);
        rect(count+15, count+20, width/count+50, width/count+20);
      }
    }
  }
  count++;
  if(mousePressed){  //this will start the pattern over and change background color
    count=0;
    background(random(0,255),random(0,255),random(0,255));
  }
}

