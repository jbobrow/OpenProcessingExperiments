
void setup() {  //setup function called initially, only once
  size(250, 250);
}

void draw() {  //draw function loops 
    int scalar = 255 - mouseY/2;
    int red = 1*(mouseX/width);
    int blue = 1 - red;
    background(red*scalar, 0, blue*scalar);  
    strokeWeight(4);
    int mx = (mouseX-(width/2))/5;
    int my = (mouseY-(height/2))/5 - 0;
    int smile = ((abs(mx))/3) - 5;
    ellipse(width/2, height/2, 4*width/5, 4*height/5);
    ellipse(width/2 + mx*1.25, 3*height/5 + my, 4, 4);
    
    line(4*width/14 + mx, 3*height/7 + my, 5*width/14 + mx, 3*height/7 + my);
    line(9*width/14 + mx, 3*height/7 + my, 10*width/14 + mx, 3*height/7 + my);
    
        line(6*width/14 + mx, 5*height/7 + my, 8*width/14 + mx, 5*height/7 + my);
        line(5*width/14 + mx, 5*height/7 + my + smile, 6*width/14 + mx, 5*height/7 + my);
        line(8*width/14 + mx, 5*height/7 + my, 9*width/14 + mx, 5*height/7 + my + smile);
        
    line(width/2 + mx, height/2 + (my/1.2), width/2 + mx*1.25, 3*height/5 + my);
}
