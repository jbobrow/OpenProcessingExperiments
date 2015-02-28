
PImage mypattern;
PImage mypattern2;

void setup(){
    size(1000,1000);
    mypattern = loadImage("japanese-fabric-patterns-red-set.jpg");
    mypattern2 =loadImage("Unknown.jpeg");
}


void draw(){
  tint(222,mouseX,190,4);
  image(mypattern,mouseX,mouseY,mouseX,mouseX);
  tint(102,20,mouseX,2);
  image(mypattern2,mouseY,mouseX,mouseX,mouseY);

  
}

