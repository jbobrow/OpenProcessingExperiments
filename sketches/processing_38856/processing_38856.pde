
int counter;

void setup() {  
  size(600, 600);
  background(0);  
  colorMode(HSB);   
  counter = 0;
}

void draw() {  
  counter++;
  noStroke();
  fill(random(150),150,205,50);
  
  if(mousePressed ) { 
    ellipse(mouseX, mouseY, mouseX,mouseY);
  }
 
    ellipse(width/2, height/2, 200*sin(counter), 200*sin(counter));
  
}

                
                                
