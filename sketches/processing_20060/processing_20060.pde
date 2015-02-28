
//float eyeRotate = map(mouseX, 0, width, (-1*PI/8), (2*PI/8)); (Why does this return 'NaN'?)
void setup() {
  size(640, 480);
  noStroke();
  smooth();
}

void draw() {
  background(100);

  if((mouseX >150 && mouseX < 500) && (mouseY > 100 && mouseY < 350)) //If close, get nervous!
  {

    //nervous twitch (inspired by: http://openprocessing.org/visuals/?visualID=7186)
    float shake = random(-5,5);

    fill(255);



    //Source Code modified from: http://openprocessing.org/visuals/?visualID=7078# 
    noStroke();
    ellipse(240+ shake, 225, 80, 120); //left eye
    ellipse(400+shake, 225, 80, 120); //right eye
    fill(0);
    float pupilX = map(mouseX, 0, width, 215, 265);
    float pupilY = map(mouseY, 0, height, 205, 240);
    float pupilA = map(mouseX, 0, width, 375, 425);

    ellipse(pupilX+shake, pupilY, 20, 20); //left pupil
    ellipse(pupilA+shake, pupilY, 20, 20); //right pupil
    
      //eyebrows
    strokeWeight(4);
    stroke(0);
    line(240+shake+40, 225-120, 240+shake-65, 225-60);
    line(400+shake+55, 225-60, 400+shake-40, 225-120);

    if(mousePressed == true)
    {
      //sweat
      fill(146, 227, 255);
      noStroke();
      beginShape();
      vertex(400+50+shake,10);
      vertex(370+50+shake,80);
      vertex(430+50+shake,80);
      endShape();
      arc(400+50+shake,85, 59,59, 0,2*PI);
      stroke(1);
    }

  
  }

  else //same thing, with angry eyebrows, red pupils
  {    
    fill(255);
    stroke(0);
    //Source Code modified from: http://openprocessing.org/visuals/?visualID=7078# 
    ellipse(240, 225, 80, 120); //left eye
    ellipse(400, 225, 80, 120); //right eye
    fill(255,0,0);
    float pupilX = map(mouseX, 0, width, 215, 265);
    float pupilY = map(mouseY, 0, height, 205, 240);
    float pupilA = map(mouseX, 0, width, 375, 425);
    strokeWeight(0);
    ellipse(pupilX, pupilY, 20, 20); //left pupil
    ellipse(pupilA, pupilY, 20, 20); //right pupil



    //eyebrows
    strokeWeight(4);
    stroke(255,0,0);
    line(240+60, 225-60, 240-45, 225-120);
    line(400+40, 225-120, 400-55, 225-60);
  }
}


