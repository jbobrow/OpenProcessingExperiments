
float[] xvalue = new float[100];
float[]  yvalue = new float [100];
float[] speed = new float [100];

void setup(){
  size(400, 500);
  background(75);
  stroke(0,0,128);
  
  int i = 0;
  while (i <  100){
    xvalue[i]= random(0, height);
    yvalue[i]=random (0, width);
    speed[i]= random (2, 6);
    i++;
  }
}

void draw(){
  background(75);
 
 beginShape();
     //sidewalk
    strokeWeight(50);
    strokeCap(SQUARE);
    stroke(30);
    line(0, 480, 500, 480);
   
    //phone box
    strokeWeight(20);
    stroke(150, 0, 0);
    rect(250, 290, 100, 3);
    strokeWeight(10);
    fill(155); //windows
    rect(250, 315, 100, 175); //phone box
    strokeWeight(20); //big bottom
    line(255, 305, 345, 305); //small top
    line(250, 475, 350, 475); //big bottom
    strokeWeight(5);
    line(282.5, 315, 282.5, 490); //vertical
    line(317.5, 315, 317.5, 490); //vertical
    line(250, 353.75, 350, 353.75); //horizontal top
    line(250, 392.75, 350, 392.75); //horizontal middle
    line(250, 431.25, 350, 431.25); //horizontal bottom
   
    //person
    stroke(0, 0, 255); //pants
    strokeWeight(8);
    line(96, 455, 93, 490); //left leg
    line(104, 455, 107, 490); //right leg
    stroke(25, 25, 100);
    arc(93, 492, 6, 4, PI, TWO_PI); //left shoe
    arc(107, 492, 6, 4, PI, TWO_PI); //right shoe
   
    stroke(0); //jacket
    strokeWeight(17);
    line(100, 385, 100, 456); //body
    
    strokeWeight(10); //upper arms
    line(100, 400, 85, 425); //left
    line(100, 400, 120, 425); //right
    strokeWeight(7); //lower arms
    line(85, 419, 85, 445); //left
    line(118, 430, 135, 405); //right
   
    stroke(69, 19, 9); //hair color
    ellipse(100, 367, 50, 50); //hair

    
    fill(255, 239, 213); //head
    stroke(255, 239, 213);
    strokeWeight(5);
    ellipse(100, 370, 45, 45);
    
    stroke(69, 19, 9); //hair
    fill(69, 19, 9);
    arc(100, 359, 50, 23, PI, TWO_PI);
    arc(83, 360, 10, 5, PI, TWO_PI-PI/2);
    arc(85, 360, 10, 5, TWO_PI-PI/2, TWO_PI);
    arc(95, 360, 10, 5, TWO_PI-PI/2, TWO_PI);
    arc(105, 360, 10, 5, TWO_PI-PI/2, TWO_PI);
    arc(115, 360, 10, 5, TWO_PI-PI/2, TWO_PI);
    
    //face
    stroke(0);
    strokeWeight(1);
    noFill();
    arc(100, 375, 4, 3, PI, TWO_PI);
    line(95, 382, 105, 382); //mouth
    fill(255);
    ellipse(90, 367, 7, 3); //left eye
    ellipse(110, 367, 7, 3); //right eye
    fill(0, 0, 2);
    ellipse(90, 367, 3, 2.5); //left color
    ellipse(110, 367, 3, 2.5); //right color
  
    //umbrella
    stroke(50);
    strokeWeight(6);
    line(135, 405, 135, 320);
    stroke(5, 5, 75);
    strokeWeight(10);
    fill(5, 5, 75);
    arc(135, 335, 120, 30, PI, TWO_PI);
    
    
  strokeCap(ROUND);
 
  int i= 0;
  while (i < 100){
   stroke(0,0,128);
   strokeWeight(speed[i]);
   point(xvalue[i], yvalue[i]);
  
  yvalue[i]= yvalue[i] + speed[i] / 1.5;
  
  if(yvalue[i] < 0){
    yvalue[i]= height;
  }
  if(yvalue[i] > 500){
    yvalue[i]= 0;
  }
  if(yvalue[i] > 490){
    xvalue[i] = random(500);
    yvalue[i] = 0;
  }

 i= i + 1;
  }

}


