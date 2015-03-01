
PImage soupcan;
PImage tree;


void setup(){
size(500,500);
background (243, 214, 112);

soupcan = loadImage("soupcan1.jpg");
tree = loadImage("tree.png");

}



void draw(){


//for(int m=0
//x+=100
//x=x+100

for(int x=0; x<width; x+=100){
for(int y=0; y<height; y+=100){
  
  if(mouseX>x && mouseX<x+100 && mouseY>y && mouseY<y+100){
    tint(0, 153, 204);
    image(tree, x, y, 100, 100);
    println("one is happening");
  } else {
   //tint(255);
   println("2 is happening");
   image(soupcan, x, y,100,100);
  } 

  
  
  println("mouseX: " + mouseX);
  println("mouseY: " + mouseY);
  
}


}
}



