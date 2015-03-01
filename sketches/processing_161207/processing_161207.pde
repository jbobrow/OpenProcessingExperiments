
int rain=40;

float[] rainX = new float [rain];
float[] rainY = new float [rain];

float gravity;
float[] vY = new float[rain];

float rainLength=25;
 
void setup() {
  size(600, 600);
  smooth();
  for (int i=0; i<rain; i++) {
    rainX[i]=random(150, 450);
    rainY[i]=random(-1*height, 0);
  }
 
  gravity=1;
}
 
void draw() {
  colorMode(HSB,360,100,100);
  color bg;
  bg=color(180,70,50);
  background(bg);  
  noStroke();
  
    //shadow
  fill(100);
  ellipse(300,495,300,30);
    //flower
  fill(120,80,60);
  translate(300,340);
  rect(-3,40,6,110);
  fill(350,70,100);
  for (int i=1; i<6; i++){
   
    ellipse(0,-40,50,50);
    rotate(radians(72));
  }
  
  fill(50,85,95);
  ellipse(0,0,70,70);
  
  //eyes
  fill(0);
  ellipse(-15,0,7,7);
  ellipse(15,0,7,7);
  
  //mouth
  noFill();
  stroke(0);
  arc(0,0,60,60,HALF_PI,2.8);
  arc(0,0,60,60,0.34,HALF_PI);

  //rain
  noStroke();
  translate(-300,-340);
  fill(0,0,100);
 
  for (int i=0; i<rain; i++) {
    
    vY[i]=mouseY/20;
    rainY[i] += vY[i];
    vY[i] += gravity;
    rect(rainX[i], rainY[i], 4, rainLength,2);
 
    if (rainY[i]>450) {
      rainY[i]=random(-300, 0);
      gravity=0;
       
    }
  }
  
  //paint other stuffs
  fill(bg);
  rect(0,0,600,200);
  
  //cloud
  fill(0,0,100);
  ellipseMode(CENTER);
  ellipse(320,140,220,120);
  ellipse(230,170,170,90);
  ellipse(380,175,190,100);


  

  
}


