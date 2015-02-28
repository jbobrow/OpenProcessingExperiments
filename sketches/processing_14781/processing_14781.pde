
int maVariable;
void setup () {
maVariable=5;
size (600,600);
  background (30,0,0);
}
  
  void draw () { {
    maVariable=maVariable+1;
line (mouseX,mouseY,300,300);
fill(200,0,0,30);
ellipse (mouseX,mouseY,maVariable,maVariable);
  }
}

void mouseClicked () {
 maVariable=255;
 maVariable=0;
}


                
                
