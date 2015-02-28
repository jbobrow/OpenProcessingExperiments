
void setup() {
  size (800,800);
}

void draw () {
  background (139,87,66);
  int r=238;
  int g=99;
  int b=99;
  
  if (mouseY < 200) {
    
  } else {
   r=238;
   g=99;
   b=99;
  }
 
 if (mouseY < 200) {
     fill (r,g,b);
     rect (20,20,200,200);
  } else if(mouseY < 400) {
     fill(r+30,g+30,b+30);
     rect(40,40,300,300);
  } else if (mouseY<600) {
     fill(r+60,g+60,b+60);
     rect(60,60,400,400);
  } else if (mouseY<800 && mouseY>600) {
     fill(r+90,g+90,b+90);
     rect(80,80,600,600);
  }
}

  

 

