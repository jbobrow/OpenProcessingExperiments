
//HW 3    2-7-2012
//by Katy Law
//fill suburbia with trees

void setup() {
  background(#D1CFCF);
  size(600, 600);
  smooth();
  noFill();
  //colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  fill(255, 2);
 
  for (int i = 0;i<width; i+=10) {
    for (int j = 0;j<height; j+=10) {
          if(mouseX > i && mouseX < i+5 && mouseY > j && mouseY < j+5){
            fill(#155023);//if true, there will be cursor fill green
          } else {
            noFill();
          }
            noStroke();
            ellipse(i,j,50,50);//cursor ellipse tree leaves
            
             rect(i,j,10,50);//cursor rect
 if(i%100 == 0 && j%100 == 0){
   fill(#6A4343);//brown
     rect(i,j,50,30);//house
  triangle(i-10,j,i+25,j-50,i+60,j);//roof of house
  }
  //below shows up as static and as following the cursor

}

  }}
                
