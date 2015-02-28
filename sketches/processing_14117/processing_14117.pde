
/*
SIMPLE PATTERN GENERATOR FOR TEACHING ITERATION AND BASIC
TRANSFORMATIONS WITH ROTATE.
*/
void setup() {

  size(440,440);
  background(255);
  strokeWeight(0.3);

  for(int x = 10; x<width-50; x+=60) {
    for(int y = 10; y<width-50; y+=60) { 

      triangles1(x,y);
      triangles2(x,y);
      triangles3(x,y);
    }
  }
}

//THESE ARE THE TRIANGLE FUNCTIONS
void triangles1(int x, int y) {
  for(int i = 0; i <= 50; i+=5) {
    for(int j = 0; j <= i; j+=5) {
      line(x+i,y+j,x+i+5,y+j+5);   
    }
  }  
}
//TO ROTATE THE PATTERN ABOVE WE COPY THE CODE AND 
//TRANSLATE BY THE WIDTH THEN TURN BY 90°

void triangles2(int x, int y) {
  stroke(random(255),random(255),random(255));//ADD RANDOM COLOUR
  for(int i = 0; i <= 50; i+=5) {
    for(int j = 0; j <= i; j+=5) {
      pushMatrix();
      translate(width-5,0);//TO FIT PERFECTLY SUBTRACT 5
      rotate(HALF_PI);
      line(x+i,y+j,x+i+5,y+j+5);   
      popMatrix();
    }
  }  
}

void triangles3(int x, int y) {
  for(int i = 0; i <= 50; i+=5) {
    for(int j = 0; j <= i; j+=5) {
      pushMatrix();
      translate(width-5,height-5);//WE NEED TO TRANSLATE BY WIDTH & HEIGHT
      rotate(PI);
      line(x+i,y+j,x+i+5,y+j+5);   
      popMatrix();
    }
  }  
}



