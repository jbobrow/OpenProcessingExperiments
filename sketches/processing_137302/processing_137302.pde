
int dia = 75;
int something = 300;
int red = 100;
int blue = 100;
int green = 100;


void setup() {
  size (1000, 600);
  background (255);
  smooth();
  noFill();
  //stroke(red,100,blue,50);
  frameRate(30);
}

//lines drawn randomly
void draw() {
  if(mousePressed){
    stroke(red,100,blue,50);
    strokeWeight(random(5));
  line(mouseX, mouseY, dia+300, dia);
  dia = random(600);
  }
}

void mouseClicked(){    //subtle hue change on click
  red = floor(random(100,125));
  blue = floor(random(100,125));
}

//how to save work
void keyPressed() {
  if (key=='s')     //save drawing
  {
    saveDrawing();
  }
  if (key=='l'){    //layering effect
  fill(0, 0, 0,100);
  rect(0,0,1000,600);
  }
  if (key=='r'){    //reset canvas
  fill(250,250,250);
  rect(0,0,1000,600);
  }
}

function saveDrawing() {
  saveFrame("images/circles-###.png"); //when running on the web it will put the PNG in a new browser tab
}



