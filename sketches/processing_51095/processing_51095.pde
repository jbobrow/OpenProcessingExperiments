
// variables
int jump_right = 40;
int jump_down  =100;



//setup
size(800, 800);
strokeWeight(0.5);
smooth();
background(0);

//loops
for (int i=800; i>0; i-=jump_right) {
  for (int j=0; j<height; j+=jump_down) {
    for (int k=0; k<255; k+=10) {
      float a =random(255);
     float b =random(255);
     float c =random(255);

      fill(a);



      noFill();
      arc(i, j, 200, 300, radians(-70), radians(150));                   
      stroke(a, b, c);
      rotate(20);
      
      arc(i/2, j/2, 200, 300, radians(50), radians(-50));                   
      stroke(a, b, 0);
      rotate(20);
      
      
      
    }
  }
}


