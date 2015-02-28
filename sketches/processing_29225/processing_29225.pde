
void setup(){
  size(200,200);
  background(255);
  smooth();
}

int i = 0;

void draw(){  
  noStroke();

  switch(abs(i-(i/5)*5)){
    case 0://red
      fill(255,0,0);
      break;
    case 1://yellow
      fill(255,255,0);
      break;
    case 2://green
      fill(0,255,0);
      break;
    case 3://blue
      fill(0,0,255);
      break;
    case 4://light blue
      fill(0,255,255);
      break;
    default://white
      fill(255,255,255);
  }
  ellipse(width/2,height/2,100,100);
}

void keyPressed(){
  if (key == 'a') { 
    i++;
    background(255);
    println(i);
  }
  else if (key == 'z') {
    i--; 
    background(255);
    println(i);
  }
}

