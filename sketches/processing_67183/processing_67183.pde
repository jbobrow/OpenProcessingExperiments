
float saturate;
int myArray = 1;
float[] yspeed= new float[myArray];
float[] xspeed= new float[myArray];
float[] circlex= new float[myArray];
float[] circley= new float[myArray];
PImage star = loadImage("star.png");
PImage backimage = loadImage("background.png");

void setup(){
  size(500, 500);
  for(int i=0; i < myArray; i++){
    xspeed[i] = random(5);
    yspeed[i] = random(7);
    circlex[i] =random(10); 
    circley[i] = random(10);
  }
  frameRate(10);  
}

void draw(){
     imageMode(CENTER);
     image(backimage, width/2, height/2);
     fill(255);
     for(int i = 0; i < myArray; i++){
        for(int j=0;j<width;j++){
          drawCircle(circlex[i]*j,circley[i]*j,j*j,color(255));
       }
       smooth();
       noStroke();
       imageMode(CENTER);
       image(star, circlex[i], circley[i]);
       circlex[i] += xspeed[i];
       circley[i] += yspeed[i];
      
   
     if(circlex[i] >= 30 || circlex[i] <= 0){
       xspeed[i] *= -1;
     }
     if(circley[i] >= 30 || circley[i] <= 5){
       yspeed[i] *= -1;
     }
     
}

}

void drawCircle(float circX, float circY, int diameter, color c) {
  
  noFill();
  stroke(c);
  ellipse(circX,circY,diameter,diameter);
}


