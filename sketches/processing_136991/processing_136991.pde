
int x=50;
int y=50;

void draw(){
  background(190);
  rect(x,y,20,20);
}

void keyPressed(){
  if(key=='w'|| key=='8'){
    y--;
  }if(key=='s'|| key=='2'){
    y++;
  } if(key=='a'|| key=='4'){
    x--;
  } if(key=='d'|| key=='6'){
    x++;
  }
}
