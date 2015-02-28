
PImage at; //declaring
PImage at_trans;

int x; 

void setup(){
size(500,500);
smooth();
  
  at = loadImage("adventuretime.jpeg");
  //imageMode(CENTER);
  at_trans = loadImage("adventure_cut.png");
  
}


void draw(){
 // background(0);
 background(255);
 image(at, 0,0);
 
 //get
 color temp = get(mouseX,mouseY);
 
 fill(temp,50);
 stroke(0);
 strokeWeight(3);
ellipse(mouseX, mouseY,50,50);
 
 float r = red(temp);
 float g = green(temp);
 float b = blue(temp);
 println(r+","+g+","+b);
}
 
 
 
 
 
 //fill(255,0,0);
// ellipse(width/2, height/2, 50,50);
// 
// 
// tint(255, 50);
//  image(at, mouseX, mouseY);
//
//for(int i=0; i<width; i+=100) {
//  image(at_trans,i,height/2);
//}

  


