
PFont font;
float score = 100;
float time = 0;



float[] sphereX = new float [12];
float[] sphereY = new float [12];
float Msize = 50;
float Ssize = 25;

void setup(){
  font = loadFont("LilyUPCBoldItalic-48.vlw");
  textFont(font, 32);
  size(600,600);
  for(int i = 0; i <12; i++){
   sphereX[i] = random(10, 590); 
   sphereX[i] = random(10, 590); 
  }
   noCursor();
}

void draw(){
    time += .00000001;
    if(score < 1){
     text("game over" , 300, 300); 
    }
   background(255);
   frameRate(100);
   text("score " + score, 10, 20);
   // vert falling spheres
   for(int i =0; i < 12; i++){
    meteors(sphereX[i], sphereY[i]);
    sphereY[i] += 6.0;
    if(sphereY[i] > height){
     sphereX[i] = random(10, 590);
     sphereY[i] = -30; 
    }
   }
    //horiz falling sphere
    for(int i = 0; i <12; i++){
      meteors(sphereX[i], sphereY[i]);
      sphereX[i] += 6.0;
      if(sphereX[i] > width){
         sphereY[i] = random(10, 590);
         sphereX[i] = -30; 
         
      }
    }



   fill(173,16,16);
  translate(mouseX, mouseY);
  ellipse(0, 0, Ssize, Ssize);
  

  
}
  


void meteors(float x, float y){
  stroke(39, 154, 240);
    fill (39, 154, 240);
     
  
      ellipse(x, y, Msize, Msize);
      
      if(mouseX == x || mouseX == y) {
           score--;
         }
}

  
  



