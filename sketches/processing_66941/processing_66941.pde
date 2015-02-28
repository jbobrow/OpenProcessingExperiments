
float saturate;
int myArray = 7;
float[] yspeed= new float[myArray];
float[] xspeed= new float[myArray];
float[] circlex= new float[myArray];
float[] circley= new float[myArray];

PImage zebra = loadImage("zebra.png");

void setup(){
  size(500, 500);
  for(int i=0; i < myArray; i++){
    xspeed[i] = random(5);
    yspeed[i] = random(7);
    circlex[i] = random(width); 
    circley[i] = random(height);
  }
    
         background(255);

}

void draw(){
     imageMode(CENTER); 
     image(zebra, width/2, height/2); 
     saturate = random(255);
     fill(saturate,saturate,saturate);
     for(int i = 0; i < myArray; i++){
       smooth();
       noStroke();
       ellipse(circlex[i], circley[i], 60, 60);
       circlex[i] += xspeed[i];
       circley[i] += yspeed[i];
   
     if(circlex[i] >= width || circlex[i] <= 0){
       xspeed[i] *= -1;
     }
     if(circley[i] >= height-5 || circley[i] <= 5){
       yspeed[i] *= -1;
     }

}
}


