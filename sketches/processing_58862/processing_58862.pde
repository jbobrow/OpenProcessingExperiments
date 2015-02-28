
int storlek;


void setup(){
  frameRate(8);
  size(300, 300);
  storlek = 50;

}




void draw(){
  background (255);
  fill (0);
  text("-", 5, 12); //minustecken
  text("+", 290, 12); //minustecken
  rect(10, 5, storlek, 5);
  fill( random(255), random(255), random(255), random(255));
  ellipse(height/2, width/2, storlek, storlek);
}


void keyPressed(){
if(key == '-'){
  storlek = storlek - 10;
//minustangenten
}

else if(key == '+'){
  storlek = storlek + 10;
//plustangenten
}

}

