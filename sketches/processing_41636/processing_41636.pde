
//dan 01:50 10/10/2011
  int value = 0;

void setup(){
  size(400,400);
  smooth();
  stroke(random(255));
  fill(random(255));
  for(int i=0; i<=width; i+=width/8)
      for(int j=0;j<=height+height/2;j+=width/16)
        {ellipse(i,j,width/16,height/16);
        ellipse(i+width/16,j-height/3,width/16,height/16);}
}

void draw(){
   if(keyPressed) {
    if (key == 'r' || key == 'R') {
     background(random(255),50,50);
     stroke(random(255),50,50);
     fill(random(255),50,50);
    }
    if (key == 'g' || key == 'G') {
     background(50,random(255),50);      
     stroke(50,random(255),50);
     fill(50,random(255),50);
    }
    if (key == 'b' || key == 'B') {
     background(50,50,random(255));       
     stroke(50,50,random(255));
     fill(50,50,random(255));
    }
    for(int i=0; i<=width; i+=width/8) {
      for(int j=0;j<=height+height/2;j+=width/16)
        {ellipse(i,j,width/16,height/16);
        ellipse(i+width/16,j-height/3,width/16,height/16);}
    }
  }
  else noLoop();
}

void keyPressed() {
 loop();
}
