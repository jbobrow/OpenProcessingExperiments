
//Hidden circle, if clicked resets position randomly
//background color is based on distance mouse is from circle

Circle circle;
int xdist;
int ydist;
int dist;
    
void setup() {
  size(800,800);
  colorMode(RGB,width);
  circle = new Circle();
  

}

void draw() {
  circle.display();
   xdist = int(dist(circle.x,mouseY,mouseX,mouseY));
   ydist = int(dist(mouseX,circle.y,mouseX,mouseY));
    dist = int(dist(circle.x,circle.y,mouseX,mouseY));  
  
  //should display circle if moused over NOT WORKING
    if(mouseX>circle.x-30 && mouseX<circle.x+30 && 
     mouseY>circle.y-30 && mouseY<circle.y+30){
      ellipse(circle.x,circle.y,30,30);
     }
     
     //blue is full of shit it was based on dist but that caused it to vary
  background(width-xdist,height-ydist,width-dist);
  
  
  //I cant make this circle appear as white
//  fill(255);
 // ellipse(mouseX,mouseY,30,30);

}

//shows the circle if the key is pressed
void keyPressed(){
  ellipse(circle.x,circle.y,30,30);
  println(width-xdist,height-ydist,dist);
  
}
  
//resets location of circle if it is clicked on
void mouseClicked(){ 
  if(mouseX>circle.x-30 && mouseX<circle.x+30 && 
     mouseY>circle.y-30 && mouseY<circle.y+30){
       circle.reset();
       
     }
  
}

class Circle {
 int x = int(random(800));
 int y = int(random(600));
  
 Circle(){
   
 }
 
 void display(){
  // noFill();
  // noStroke();
  fill(0);
  ellipse(x,y,30,30);
   
 }
 
 void reset(){
    x = int(random(800));
    y = int(random(600));
    
 }
  
}


