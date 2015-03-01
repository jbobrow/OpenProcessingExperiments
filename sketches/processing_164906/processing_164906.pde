
float r=150;
float tVecX, tVecY, uVecX, uVecY; 
float score=0;


float delta = 60;
float borderX, borderY;
float movingX, movingY;
float deg2= 0;

void setup() {
  size(600, 600);
  background(255);
  textSize(30);
  fill(0);
  text("Find Jackpot", width/4, height/6);
  frameRate(100);

  translate(width/2, height/2);
}

void mousePressed() {
  tVecX = 0;
  tVecY = 120;
  float tVecMag=sqrt(tVecX*tVecX + tVecY*tVecY);

  uVecX = movingX;
  uVecY = movingY;
  float uVecMag=sqrt(uVecX*uVecX + uVecY*uVecY);

  float cosine = 120 * movingY / (tVecMag * uVecMag);

  score = cosine*100;

  println(score);
} 


void draw() {
  translate(width/2, height/2);

  stroke(0);
  strokeWeight(20); 
  fill(255, 0, 0);
  ellipse(0, 0, 300, 300);

  stroke(0, 0, 0, 0);
  strokeWeight(10);
  line(0, 0, 0, -120);


  for (float deg1=0; deg1<360; deg1+=delta) {
    float theta = radians(deg1);
    borderX= r*cos (theta);
    borderY= r*sin(theta);
    stroke(0);
    strokeWeight(10);
    line(0, 0, borderX, borderY);
  }


  deg2 += 6;
  float alpha = radians(deg2);
  movingX = r * cos(alpha);
  movingY = r * sin(alpha);

  stroke(255);
  line(0, 0, movingX, movingY);

  textSize(30);
  fill(0);

    if (mousePressed){
      if(score<-10)
      text("Jackpot", 150, 200);
    }
  }
