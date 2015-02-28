
float x = 0;
int j = 10;

void setup(){
  size(700,700);
  background(200);
}
  

    void draw() {
  if (mousePressed == true) {
    fill(255);
  } else {
    fill(0);
  }
  rect(0, 0, 700, 700);

ellipse(350,350,j,j);

   x = x+1;
j = j+1;
}



    

    
    
    

  

  
  
  


