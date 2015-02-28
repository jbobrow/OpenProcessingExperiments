
//Using “if” and “else”, make the mouse perform
//different actions when in different parts of the canvas.

void setup(){
  
  size(400, 400);
  frameRate(24);
}

void laurenAction(int x, int y){
  for(int i=0; i<400; i=i+10){
    float l=random(255);
    float m=random(255);
    float n=random(255);
    float p=random(255);
    
          if (mouseX<200){
            fill(l, l, l, p);
        }
        else{
          
          fill(l, m, n, p);
          
        }
    float r=random(400);
    rect(i, r, x, y);
  }
}

void draw(){
    smooth();
  noStroke();
  if (mousePressed == true){
laurenAction(10, 10);
ellipse(mouseX, mouseY, mouseY/4, mouseY/4);
  }

else{
  laurenAction(30, 30);
}
}



