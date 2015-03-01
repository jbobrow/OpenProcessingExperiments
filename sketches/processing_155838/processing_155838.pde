
int bigcircle = 200;


void setup(){
  size(700, 400);
}

void draw(){
  background( random(150), mouseX/3, mouseX*2, mouseY*10);
    
    //mod
    fill (70 ,130 ,180);
    strokeWeight(0);
    ellipse(mouseX, height/2, 200+bigcircle , 200+bigcircle);

    fill (255 ,250 ,250);
    strokeWeight(0);
    ellipse(mouseX, height/2, 120-bigcircle, 120-bigcircle);

    fill (139, 26, 26);
    strokeWeight(0);
    ellipse(mouseX, mouseY, 60, 60);
    
    

    bigcircle = bigcircle - 1;
}


