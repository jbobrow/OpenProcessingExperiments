
int numerodepelotas = 10;


float[] x = new float [numerodepelotas]; // X-coordinate
float[] y = new float [numerodepelotas]; // X-coordinate
float[] speedX = new float [numerodepelotas]; // X-coordinate
float[] speedY = new float [numerodepelotas]; // X-coordinate
float[] directionX = new float [numerodepelotas]; // X-coordinate
float[] directionY = new float [numerodepelotas]; // X-coordinate

Float radius = 10.0;

void setup() {
  size(600, 600);
  smooth(2);
  noCursor();
  noStroke();
  ellipseMode(RADIUS);
  for( int i=0; i<10; i++){
      x[i]= random(width);
      y[i]= random(height);
      speedX[i] =3;
      speedY[i] =1.6;
      directionX[i] =3;
      directionY[i] =2;
  }
}



void draw() {
  
  fill(10,20);
  rect(3,8,width,height);
  fill(255);
  
  for(int i=0; i< 10; i++){
    ellipse(x[i], y[i], radius,radius);
    x[i]+=speedX[i]*directionX[i];
    if((x[i]>width-radius)  ||  (x[i] < radius)) {
      directionX[i] = -directionX[i]; // change direction
    }
  
    y[i] += speedY[i] = directionY[i];

    if(y[i] < height-radius || y[i] > radius){
      directionY[i]= - directionY[i]; 
    }
  }
  
  
   if (mousePressed == true ){
     stroke (47,175,188,200);
     strokeWeight(random(20,200));
     
   }else{
     stroke (19,98,106,30);
   }
   line(mouseX,mouseY,pmouseX,pmouseY);
}

//El juego del Azar
  //88
  
  


