
float num = 0;
float angle;

void setup(){
  size(640, 640);
  
  /* Because the color's values aren't changing we put them in the setup. Prevents unnessesary calcuations */
  stroke(200, 0, 255, 80);
  fill(200, 0, 255, 50);
}

void draw(){
  background(0);
  
  /* This will bend our shapes */
  angle = cos(num * 20) * 20;
  
  pushMatrix();
  translate(width/2, height/2);
  /* Rotate entire pattern */
  rotate(num*2);
  for(int i = 0; i < 150; i++){
    /* Rotate individual shape. (The further away from the center the faster the rotation) */
    rotate(1+num/10);
    /* 
      If we wanted to, although this would increase computations, we can fill our shape and depending on
      how far away from the center the shape is (how big "i" is) we assign the opacity of our shape as "i" 
     */
    /* fill(255, 0, 255, i); */
    /*
      bezier(startX, startY, bend1X, bend1Y, bend2X, bend2Y, endX, endY);
    */
    bezier(i, i, 0, angle+i, 70, angle+i, i+70, i); 
  }
  popMatrix();
  /* Increment num by 0.001 so we get a slow smooth animation */
  num += 0.001; 
}


