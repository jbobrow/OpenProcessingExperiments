
//Sketch with for loops and interactivity

float dia = 0;



void setup() {
  size(400,400);
  frameRate(20);  
  background(255);
  
  
}

void keyPressed(){
    println(key);
}


void draw() {
  
//  noStroke();
//  fill(255, 255, 255, 10);
//  rect(0, 0, 400, 400);


  
  if(keyPressed == true){
   
    for(int i = 0; i < 10; i++) {
        noStroke();
        fill(255, 255, 255, 2);
        rect(0, 0, 400, 400);
      
      if(key == 'r') {
        fill(255, 0, 0); 
        dia = random(20, 50);
        ellipse(mouseX + random(10), mouseY + random(10), dia, dia);

      } else if(key == 'g') {
          fill(0, 255, 0); 
          dia = random(20, 50);
          ellipse(mouseX + random(10), mouseY + random(10), dia, dia);

          } else if(key == 'b') {
              fill(0, 0, 255); 
              dia = random(20, 50);
              ellipse(mouseX + random(10), mouseY + random(10), dia, dia);
         
        } else if(key == ' ') {
                fill(random(50, 255), random(50, 255), random(50, 255)); 
                dia = random(20, 50);
                ellipse(mouseX + random(20), mouseY + random(10), dia, dia);
          } else if(key == 'e') {
                fill(255);
                rect(0, 0, width, height);
          }
   
    }
  
  
}
}


