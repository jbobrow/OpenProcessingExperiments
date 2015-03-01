
float speedR, speedG, speedB, speed1, speed2;

void setup() {  //runs once on start
  size(600, 500);
  speedR=random(-.8,-1.2);
  speedG=random(-.8,-1.2);
  speedB=random(-.8,-1.2);
  speed1=random(-.8,-1.2);
  speed2=random(-.8,-1.2);
} 

void draw() {  //Loop Continuously
  background(#CCCCCC);
  drawballoon(#FF0000,200,speedR);
  drawballoon(#00FF00,100,speedG);
  drawballoon(#0000FF,0,speedB);
  drawballoon(#AA00CC,300,speed1);
  drawballoon(#00AAFF,400,speed2);
}

void drawballoon(color c, int xStart, float speed){  //runs when called
  resetMatrix();
  translate(0,400)
  translate(xStart,frameCount*speed );
  if ( frameCount*speed<=-450){
        noLoop();   
  } 

  fill(c);
  ellipse(160, 80, 50, 60);
  line(160,110,160,160);
}
