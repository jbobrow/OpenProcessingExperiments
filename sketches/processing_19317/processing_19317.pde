

void setup (){
  size (1000,1000);
  int i = 10;
  int j = 10;
}

void draw (){
//float r = random (255);
//float g = random (255);
//float b = random (255);


//squares

for (int i=0; i < 1000; i = i + 10) {
  for(int j=0; j < 1000; j = j + 10) {
  float r = random (255);
float g = random (255);
float b = random (255);
    fill(r,g,b);
    rect (i,j,10,10) ;


    }
}

}

