
int counter = 0;

float foo;

float rectsize = 30;

void setup() {
  size(400,400);
  smooth();
  noLoop();
  
}

void draw() {
  background(0);
  //foo = mouseX/10;
  translate(rectsize, rectsize);
  
  for(int j = 0; j <  9; j++) {
    pushMatrix();

    for(int e = 0; e <  9; e++) {
      int numb = e+j;
      color recColor = color(random(255),random(255),random(255),numb*20);

      fill(recColor);
      pushMatrix();
      //rotate(radians(numb));
      rect(0, 0, rectsize,rectsize, numb, numb);
      popMatrix(); 
      
      translate(0, rectsize + 10);
      //counter = counter + 1;
    }
    
    popMatrix();
    translate(10 + rectsize, 0);
    
}
  
}
