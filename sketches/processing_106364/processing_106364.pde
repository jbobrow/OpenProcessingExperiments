
int counter;
 
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
}
 
void draw() {  //draw function loops 
 
    background(255);
 
 
    ellipse(mouseX+50,mouseY+50,200,200);
 
    // eyes
    fill(0,50,100);
    ellipse(mouseX+70,mouseY+40,20,30);
    ellipse(mouseX+10,mouseY+40,20,30);
 
    if (mousePressed)
    (
        fill(0,150,50)
    }
    else
    {
        fill(255,90,100);
    }
    
    // mouth
    fill(255,0,0)
}
