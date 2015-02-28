
void setup(){
  size(200,200);
  background(255);
  smooth();
}

int i = 0;

void draw(){  
  noStroke();

  switch(abs(i-(i/10)*10)){
    case 0://red
      fill(255,0,0);
      break;
    case 1://pink
      fill(255,0,226);
      break;
    case 2://purple
      fill(152,0,255);
      break;
    case 3://blue
      fill(0,0,255);
      break;
    case 4://light blue
      fill(0,255,255);
      break;
    case 5://light green
      fill(0,255,0);
      break;
    case 6://green
      fill(35,144,3);
      break;
    case 7://yellow
      fill(255,255,0);
      break;
    case 8://orange
      fill(255,145,0);
      break;
    case 9://brown
      fill(142,81,0);
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

