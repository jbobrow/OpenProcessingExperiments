
void setup(){
  size(500,750);
  stroke(0);
  noFill();
  noLoop();
}

float a=0;  //random bounds
float rand; //degrees to rotate randomly

void draw(){
  for(int i=1;i<22;i++){    //rows
    a += i*.6;              //randomness increases as rows increase
    for(int j=1;j<13;j++){  //columns
      pushMatrix();
      rand = random(-a);
      translate(35+(j*30),35+(i*30));
      rotate(radians(rand));
      rect(0,0,30,30);
      popMatrix();
    }
  }
}


