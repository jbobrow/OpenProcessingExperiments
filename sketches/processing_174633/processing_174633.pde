
//
//1=rect
//2=small ellipse
//3=big ellipse
//4=line
//9=background black
//0=black ellipse
//Q=ramdom line
//W=ramdom ellipse
//R=red
//G=green
//B=blue
//C=clear


void setup(){
  size(500,500);
  noStroke();
  background(255);
}

void draw(){
  if(keyPressed){
          if((key == 'r') ||(key == 'R')){
       fill(255,0,0,128);
       ellipse(pmouseX,pmouseY,9,9);
}

    if((key == 'b') || (key == 'B')){
      fill(0,0,255,128);
      ellipse(pmouseX,pmouseY,9,9);
}

      if((key == 'g') || (key == 'G')){
      fill(0,255,0,128);
      ellipse(pmouseX,pmouseY,9,9);
}

    if((key == 'c') || (key == 'C')){
      background(255);
}

    if((key == '0') || (key == '0')){
      stroke(0);
      noFill();
      ellipse(pmouseX,pmouseY,10,10);
}

      if((key == '1')){
        float x = random(256);
        float y = random(256);
        float z = random(256);
        stroke(x,y,z);
        noFill();
        rect(mouseX,mouseY,mouseX,mouseY);
}

    if((key == '2')){
      float x = random(256);
      float y = random(256);
      float z = random(256);
      float q = random(256);
      stroke(x,y,z,q);
      noFill();
      ellipse(pmouseX,pmouseY,10,10);
}

      if((key == 'w') || (key == 'W')){
              float x = random(256);
              float y = random(256);
              float z = random(256);
              float q = random(256);
              float w = random(25);
              stroke(x,y,z,q);
              strokeWeight(w);
              noFill();
              ellipse(pmouseX,pmouseY,10,10);
}
    if((key == '3') || (key == '3')){
            float x = random(256);
            float y = random(256);
            float z = random(256);
            float q = random(256);
            float w = random(20);
            stroke(x,y,z,q);
            strokeWeight(3);
            noFill();
            ellipse(pmouseX,pmouseY,10,10);
}

      if((key == '4')){
        float x = random(256);
        float y = random(256);
        float z = random(256);
        stroke(x,y,z);
        noFill();
        line(mouseX,mouseY,pmouseX,pmouseY);
}

    if((key == '9') || (key == '9')){
      background(0);
}
      if((key == 'q') || (key == 'Q')){
        float x = random(256);
        float y = random(256);
        float z = random(256);
        stroke(x,y,z);
        noFill();
        line(pmouseX,pmouseY,200,200);
      }
   }
}



