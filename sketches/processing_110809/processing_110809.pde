
float rad;
float rad2=20;
float rad3=20;
float rotateRandom=0;
float rotateRandom2=0;
float randomGroups=4;
float randomGroups2=4;
int size=2;
int size2=2;

float r = 0; 
float speed = 0; 
float slowdownSpeed = 0.1;
float dropRotateSpeed=1;
int scoreCount=0;

void setup(){
  size(550,550);
  
}



void draw(){

  background(255);
 
   fill(205);
  
  //Group of raindrops
  for(int k=0;k<randomGroups2;k++){
  for(int j=0;j<10;j++){
  pushMatrix();  
    translate((10*k)+(j*5)+250,k*20);
    rotate(radians(rotateRandom2));
    rotate(radians(random(j,dropRotateSpeed)));
    //rotate(radians(random(j,10)));
  for(int i=0;i<size2;i++){
    
  ellipse(20*j,rad3-i,size2-i,size2-i);
  
    //if(dropRotateSpeed>10)  
    //score();
  
  
  }
  
  popMatrix();
  }
  
  
  
  }
  
  rad = random(50,width-50);
  
  if(rad3>height){
  rad3=20;
  rotateRandom2=random(-6,-20);
  randomGroups2=random(3,6);
  size2=2;
  }
  else{rad3+=1;}
  
  if(frameCount%30==0 && size2<=8){
  size2++;}
  
  
  
  
  
  
  //Windmill
  pushMatrix();
  translate(100,300); 
  fill(255);
  rect(-5, 0, 9, 180);
  rotate(radians(r+=speed)); 
  //println(r);
  println(speed);
  triangle(0, 0, 0, -20, -70, - 70); 
  triangle(0, 0, 0, 20, 70, 70);
  popMatrix();
  

  stopWindmill();
  
  
  textSize(20);
  fill(76,220,234);
  text("Speed-> "+speed,300,460);
  
  textSize(20);
  fill(76,220,234);
  text("Score-> +"+scoreCount,300,500);
  
}


void score(){

  scoreCount++;
  textSize(28);
  fill(76,220,234);
  text("+"+scoreCount,300,300);
}

void mouseMoved() {
  speed = (mouseX-pmouseX);
  speed = map(speed, -100, 100, -50, 50);
  dropRotateSpeed=map(speed,-50,50,0,15);
}


void stopWindmill() {
  if (speed >= slowdownSpeed) {
    speed = speed - slowdownSpeed;
  } 
  else if (speed<=-(slowdownSpeed)) {
    speed = speed + slowdownSpeed;
  }
  else {
    speed = 0;
    if(dropRotateSpeed>0){
    dropRotateSpeed--;
  }
    
  if(dropRotateSpeed>5){
    //score();
    scoreCount++;
  }  
//else if(dropRotateSpeed==0){score();}
}
}


