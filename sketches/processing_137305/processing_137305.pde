
int r=255;
int g=255;
int b=255;
int a=100;

void setup(){
  size(800,800);
  background(25); //dark grey
}

void mouseDragged() {
  drawLine(); //when the mouse is dragged, it draws lines
}

void keyPressed(){
    if(keyCode == 'z' || keyCode== 'Z'){ //pressing z will add yellow
       addYellow();
    }
    else if(keyCode == 'x' || keyCode=='X'){ //pressing x will add Pink
       addPink();
    }
    else if(keyCode == 'c' || keyCode=='C'){ //pressing c will add blue
       addBlue();
    }
    else if(keyCode == 'v' || keyCode=='V'){ //pressing v will add white
       addWhite();
    }
    else if(keyCode == 'a' || keyCode=='A'){ //pressing a will add a layer
       addLayer();
    }
    else if(keyCode =='s' || keyCode=='S'){ //pressing s will save your image
       saveFile();
    }
    else{
    }
    }
 
void drawLine(){
  stroke(r,g,b,a);
  strokeWeight(2);
  
  //line(mouseX,mouseY-50,pmouseX,pmouseY-80); //these two lines create hash-marks
  //line(mouseX,mouseY-80,pmouseX,pmouseY-50);
  
  line(mouseX-20,mouseY-20,pmouseX,pmouseY); // these two lines create the network of lines 
  line(height-mouseY-20,mouseX-20,pmouseX,pmouseY);
  
  //line(mouseX+50,mouseY-50,pmouseX,pmouseY); //more angular
  //line(mouseX-50,mouseY-50,pmouseX,pmouseY); //longer, more fluid lines
  //line(width-mouseX-50,mouseY-50,pmouseX,pmouseY); //makes almost 3D shapes (keep fluid lines on)
  //line(mouseX-50,height-mouseY-50,pmouseX,pmouseY); //makes almost 3D shapes sideways (keep fluid lines on)
  
  a=random(50,100); //randomly change the opacity between 50 and 100
}

void addYellow(){
  b=random(100,200);  //changes the blue value
}

void addPink(){
  g=random(100,200); //changes the green value
}

void addBlue(){
  r=random(100,200); //changes the red value
}

void addWhite(){ //adds white
  r=255;
  g=255;
  b=255;
}

void addLayer(){ //adds a transparent layer of dark grey ontop
  noStroke();
  fill(25,25,25,40);
  rect(0,0,800,800);
}

void saveFile(){
  saveFrame("images/sketch-###.png");
}


