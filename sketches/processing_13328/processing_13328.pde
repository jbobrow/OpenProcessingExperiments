
int numStar;
float ranNum;
float time;
boolean flag;

void setup() { 
  size(900, 450);
  background(0);
  colorMode(HSB);
  flag = true;
}

void draw() { 
  smooth();
  noStroke();

  //aurora
  fill(random(255),100,255,50);
  rect(time,0,random(10,50),mouseY+ranNum);
  time = time + 0.5;
  if(ranNum < 100 && flag == true) {
    ranNum = ranNum + 0.03;
  }
  if(ranNum>100) {
    flag = false;
  }
  if(flag==false) {
    ranNum = ranNum - 0.03;
  }
  if(ranNum < 0) {
    flag = true;
  }
  //star
  if(numStar < 200) {
    fill(255);
    ellipse(random(width),random(height),random(1,3),random(1,3));
    numStar++;
  }
  //filter(BLUR, 3);


  //reset
  if(mousePressed == true) {
    fill(0);
    rect(0,0,width,height);
    time = 0;
    numStar = 0;
    ranNum = 0;
  }
}
                                                
