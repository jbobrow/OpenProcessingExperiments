
int counter;
 
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
}
 
void draw() {  //draw function loops 
 
    background(255);
 
    //fill(0,25,255);
 
    ellipse(mouseX+50,mouseY+50,200,200);
 
    // eyes
    fill(0,50,255);
    ellipse(mouseX+75,mouseY+40,20,20);
    ellipse(mouseX+25,mouseY+20,20,20);
 

    if (mousePressed){
        fill(0,250,100);

    }
    else {
        fill(0,255,255);
    }
 
 
}
