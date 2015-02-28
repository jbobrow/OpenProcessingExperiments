
float angleRandom1 =.8;
float angleRandom2 =1/angleRandom1;
float lengthRandom1 = 1.01;
float lengthRandom2 = .08;

void setup(){
  size(1200,800);
  background(126);
  smooth();
}

void draw(){
  translate(width/2,height);
  rotate(PI);
  strokeWeight(0);
  
  if (mousePressed == true){
    fill(126,20);
    rect(-width/2,0,width,height);
    strokeWeight(1);
    pushMatrix();
    translate(random(-width/2,width/2),0);
    rotate(random(-PI/9,PI/9));
    
    branch(30,PI/2, 0,0);
    popMatrix();
  }
}
/* branch takes an initial length, a starting angle, and x,y 
  coordinates uses an algorithm for finding the end point of 
  that branch
  recursively draws branches from that endpoint.
  number of branches 1-3 is decided by a random float
   */
void branch(float branchLength,float angle,float startX,float startY){
  
  if(branchLength < 1){
    fill(60,100,60,126);
    noStroke();
    ellipse(startX,startY,5,10);
    stroke(0);
  }
  
  else{
    float randomNess = random(0,100);
    strokeWeight(branchLength/2);
    float endX = cos(angle)*branchLength;
    float endY = sin(angle)*branchLength;
    line(startX,startY,startX+endX,startY+endY);
    startX += endX;
    startY += endY;
    
    if (randomNess >0 && randomNess<90){

      branch(branchLength/(random(lengthRandom1,lengthRandom1+lengthRandom2)), angle*random(angleRandom1, angleRandom2), startX,startY);

    }
    
    else if(randomNess>=90 && randomNess< 94){

      branch(branchLength/(random(lengthRandom1,lengthRandom1+lengthRandom2)), angle*random(angleRandom1, angleRandom2),startX,startY);

      branch(branchLength/(random(lengthRandom1,lengthRandom1+lengthRandom2)), angle*random(angleRandom1, angleRandom2),startX,startY);

    }

    else if(randomNess>= 94 && randomNess< 98){

      branch(branchLength/(random(lengthRandom1,lengthRandom1+lengthRandom2)), angle*random(angleRandom1, angleRandom2),startX,startY);

      branch(branchLength/(random(lengthRandom1,lengthRandom1+lengthRandom2)), angle*random(angleRandom1, angleRandom2),startX,startY);

      branch(branchLength/(random(lengthRandom1,lengthRandom1+lengthRandom2)), angle*random(angleRandom1, angleRandom2),startX,startY);


    }
    
    else {

      branch(branchLength,angle,startX,startY);

    }

  }

}











