
int numCircle = 50;

float [] circleX = new float [numCircle];
float [] circleY = new float [numCircle];
float [] velX = new float [numCircle];
float [] velY = new float [numCircle];

void setup(){
  size(500,500);
  smooth();
  noStroke();
  
  for(int i=0; i<numCircle; i++) {
   circleX[i]  = random(width);
   circleY[i] = random(height);
   velX[i] = random (-5, 5);
   velY[i] = random (-5, 5); 
  }
}

void draw(){
 background(0);
 fill(255,105,180,70);

 for (int i=0; i < numCircle; i++){
  fill(mouseY, mouseX,random(255),random(20,100));
  ellipse(circleX[i], circleY[i], 60,60);
  fill(mouseY, random(255), mouseX ,random(40,100));
  ellipse(circleX[i], circleY[i], 40,40);
  fill(random(255),mouseY, mouseX ,random(60,100));
  ellipse(circleX[i], circleY[i], 20,20);
  
  circleX[i] += velX[i]; //movimento da porra da bola X
  circleY[i] += velY[i]; //movimento da porra da bola Y
  
  if((circleX[i] < 0) || (circleX [i] > width)) {
    velX[i]*=-1;
  }
   
   if((circleY[i] < 0) || (circleY[i] > height)){
    velY[i]*=-1;
  }   
    
      
 } 
}

