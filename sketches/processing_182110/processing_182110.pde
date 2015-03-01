
void setup() {
     size (500, 500);
     background(#ED2940);
     strokeWeight(4);
 
  }
  
 void draw() {
        fill(255);   
  for (int i = 0; i < 500; i++) {
    for (int j = 0; j < 500; j++) {
        ellipse(20*i, 20*j, 10, 10) ;
    }
  }
        
    fill(#29A3ED);
    ellipse(250, 250, 300 ,300);

    fill(0);
    ellipse(200, 200 , 20, 20);

    fill(0);
    ellipse(300, 200 , 20, 20);

    line(150, 295, 350, 295);
    
 }






