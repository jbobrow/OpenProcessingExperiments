
int r=255;
int g=255;
int b=255;
int a=100;

void setup(){
  size(800,800);
  background(0);
}

void mouseDragged() {
  drawLine(); 
}

void keyPressed(){
  //if(key == CODED) { // click up arrow to add green, down to decrease green
    if(keyCode == 'z' || keyCode== 'Z'){
       addYellow();
    }
    else if(keyCode == 'x' || keyCode=='X'){
       addPink();
    }
    else if(keyCode == 'c' || keyCode=='C'){
       addBlue();
    }
    else if(keyCode == 'v' || keyCode=='V'){
       addWhite();
    }
    else{
    }
    }
 
void drawLine(){
  stroke(r,g,b,a);
  strokeWeight(2);
  //line(mouseX,mouseY-50,pmouseX,pmouseY-70); //need to be different values
  //line(mouseX+50,mouseY-50,pmouseX,pmouseY); //more angular
  line(mouseX-50,mouseY-50,pmouseX,pmouseY); //longer, more fluid lines
  line(width-mouseX-50,mouseY-50,pmouseX,pmouseY); //makes almost 3D shapes (keep fluid lines on)
  //line(mouseX-50,height-mouseY-50,pmouseX,pmouseY); //makes almost 3D shapes sideways (keep fluid lines on)
  a=random(75,100);
}

void addYellow(){
  b=random(100,200);  
}

void addPink(){
  g=random(100,200);
}

void addBlue(){
  r=random(100,200);
}

void addWhite(){
  r=255;
  g=255;
  b=255;
}





