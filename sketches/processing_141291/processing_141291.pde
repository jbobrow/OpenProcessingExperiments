
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
float dia = 100;

void setup() {
   size(600,600);
   // noLoop();
   smooth();
   background(55,188,220);
   colorMode(RGB,height,width,600);
}

void draw(){
  println(mouseX + " : " + mouseY);
  stroke(0);
  strokeWeight(5);
  fill(599,25,535,0);
  bezier(267,47,336,48,396,87,438,178);
  bezier(267,47,212,64,181,92,163,131);
  bezier(163,131,158,184,171,217,179,241);
  line(438,178,451,195);
  line(451,195,450,216);
  line(175,236,187,297);
  line(187,297,178,240);
  bezier(221,330,197,326,178,342,179,363);
  bezier(179,363,190,376,205,378,226,371);
  
  stroke(0);
  strokeWeight(5);
  fill(600);
  ellipse(425,265,107,103);
  ellipse(315,262,130,122);
  noFill();
  stroke(0);
  strokeWeight(5);
  line(378,290,434,291);
  bezier(434,291,450,304,449,321,431,337);
  line(431,337,366,338);
  
  noFill();
  bezier(196,99,193,58,221,27,263,25);
  line(263,25,288,45);
  bezier(233,90,232,53,263,25,305,22);
  line(305,22,332,46);
  
  line(163,324,158,263);
  line(158,263,197,304);
  line(197,304,206,247);
  line(206,247,231,303);
  
  
  
  
  noFill();
  bezier(366,338,293,356,256,401,252,450);
  bezier(252,450,282,491,312,506,363,503);
  bezier(363,503,379,498,396,484,406,466);
  bezier(445,327,461,341,476,361,479,373);
  line(479,373,480,401);
  bezier(480,401,485,405,487,411,482,419);
  bezier(482,419,455,435,347,442,297,433);
  bezier(295,420,295,427,291,432,284,436);
  bezier(431,437,429,452,418,461,405,465);
  line(187,298,196,327);
  bezier(204,379,213,409,232,432,253,451);
  

  
  if (mousePressed){
  fill(mouseX,mouseY,0);
  strokeWeight(15);
  point(421,265);
  point(294,271);
  noStroke();
  
}
if (mousePressed){
  fill(mouseX,mouseY,0);
  ellipse(mouseX,mouseY,dia,dia); 

}
if (keyPressed){
  setup();
}


}

