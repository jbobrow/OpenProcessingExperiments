
int pos = 1;
int lin = 35;
float tam = 0.10;

void setup() {
  size(255,255);
}

void draw() {
  //background(1+pos*100);
    background(255);
  line(mouseX-lin,mouseY-lin,mouseX+lin,mouseY+lin);
    line(mouseX-lin,mouseY+lin,mouseX+lin,mouseY-lin);
      line(mouseX-lin,mouseY,mouseX+lin,mouseY);
        line(mouseX,mouseY-lin,mouseX,mouseY+lin);
        
  fill(mouseX,0,0);
  ellipse(mouseX,mouseY,mouseY*tam,mouseY*tam);
    ellipse(mouseX-lin,mouseY,mouseY*tam,mouseY*tam);
      ellipse(mouseX+lin,mouseY,mouseY*tam,mouseY*tam);
        ellipse(mouseX+lin,mouseY,mouseY*tam,mouseY*tam);
          ellipse(mouseX,mouseY-lin,mouseY*tam,mouseY*tam);
            ellipse(mouseX,mouseY+lin,mouseY*tam,mouseY*tam);
              ellipse(mouseX-lin,mouseY+lin,mouseY*tam,mouseY*tam);
                ellipse(mouseX+lin,mouseY+lin,mouseY*tam,mouseY*tam);
                  ellipse(mouseX-lin,mouseY-lin,mouseY*tam,mouseY*tam);
                    ellipse(mouseX+lin,mouseY-lin,mouseY*tam,mouseY*tam);
          
          
  //pos = pos + 1;

}


