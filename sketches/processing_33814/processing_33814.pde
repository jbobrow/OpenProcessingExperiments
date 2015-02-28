
PImage vader;

int numberBalls = 100;
float [] circleX = new float[numberBalls];
float [] circleY = new float[numberBalls];
//defines ball's coordinates
float centerX [] = new float [numberBalls];
float centerY [] = new float [numberBalls];
//defines "speed"
float speedX [] = new float [numberBalls];
float speedY [] = new float [numberBalls];
//sets color values
float r[] = new float[numberBalls];
float g[] = new float[numberBalls];
float b[] = new float[numberBalls];

 
int [] rad = new int[numberBalls];
 
void setup(){
  size(632, 900);
  vader = loadImage("vader.jpg");
  smooth();
  noStroke();
   
  for(int i=0; i< numberBalls; i++){
    rad[i] = round(random(10,50));
    circleX[i] = round(random(rad[i], width-rad[i]));
    circleY[i] = round(random(rad[i], height-rad[i]));
  }
  for (int i = 0; i < numberBalls; i++) {
    centerX[i] = random( 632);
    centerY[i] = random( 632);


    speedX[i] = random(10);
    speedY[i] = random(10);
  }
}
 
void draw(){
  image(vader, 0, 0);
 // for(int j=0; j< numberBalls; j++){
    
    

  //if centerX location is greater than or equal to 385, which is the stage width minus radius of the ellipse, then ball will go in the opposite direction, AND change to a random color value
  for (int i = 0; i < numberBalls; i++) {
    //initializes the ball's movement
    centerX [i] = centerX [i] + speedX [i];
    centerY [i] = centerY [i] + speedY [i];
     if (centerX [i] >= 622) {
      speedX [i] = speedX[i] * -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    }
    if (centerX [i] <=15) {
      speedX [i] = speedX[i] * -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    } 
    if (centerY [i] >= 893) {
      speedY [i] = speedY[i] * -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
    }
    if (centerY [i] <=15) {
      speedY [i] = speedY[i] * -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
       
    }
    noStroke();
    fill(r[i], g[i], b[i]);
    ellipse(centerX[i], centerY[i],rad[i],rad[i]);
  
  }
  
  
  

    
  }



