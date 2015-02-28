

//ArrayList of objects by Daniel Shiffman. 
//ArrayList ball;


int ballPos = 50;
float [] ballX = new float[ballPos];
float [] ballY = new float[ballPos];

float [] speedY = new float[ballPos];
float [] speedX = new float[ballPos];

void setup() {
  size (400, 277);
  smooth();
  noStroke();
  
  for(int i = 0; i < ballPos; i++){
    ballX[i] = random(width/2);
    ballY[i] = random(height/2);
    speedX[i] = random(5); //random(10) means speed
    speedY[i] = random(5); //Thank you Sarah for your "speed and random" knowledge
  }
 
 }
 
void draw() {

  PImage myImage = loadImage("icecream.jpg");
imageMode(CENTER);
image(myImage, width/2, height/2);
  
//background (255);
  fill(255, 255, 0, 75); //there repeating way to fast

    for(int i = 0; i < ballPos; i++){
        
      ellipse (ballX[i], ballY[i], i - 50, i-  50);
      
     
      ballX[i] = ballX[i] += speedX[i];
      ballY[i] = ballY[i] += speedY[i];
    
   
     
     if(ballX[i] >= width || ballX[i] <= 0){
       speedX[i] *= -1;
}
     if(ballY[i] >= height || ballY[i] <= 0){
       speedY[i] *= -1;
     }  
    }
}
  
 


