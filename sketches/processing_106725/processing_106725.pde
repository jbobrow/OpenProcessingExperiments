
int counter;
int Rectum_x = 28;
int Rectum_y = 83;
 
 

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
}
 
void draw() {  //draw function loops 
 
    background(0);
 
    fill(255,105,180 );
 
    ellipse(mouseX+50,mouseY+50,200,200);
 
    // eyes
    fill( 173, 255, 47);
    ellipse(mouseX+75,mouseY+40,20,20);
    ellipse(mouseX+25,mouseY+20,20,20);
    
stroke(0);
strokeWeight(3);
fill(219-112-147);
arc(mouseX+Rectum_x, mouseY+Rectum_y, 75, 75, 0.4, 3.7);

 
}
