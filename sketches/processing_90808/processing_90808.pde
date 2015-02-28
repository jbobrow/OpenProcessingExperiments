
float px,py,brush,densidade;

void setup (){
  
  size (800,800);
  background(0);
  //smooth();
  stroke(random(255));
  noFill();
  px=random(500);
  py=random(500);
  densidade=50;
  brush=random(px,py);
}

void draw(){

   densidade=random(50);
   if (keyPressed==true){
   background(0);
   }
     
  }
  
  void mouseMoved(){
    for(int i=0; i<width; i+=500){
      point(mouseX+random(-brush,brush),mouseY+random(-brush,brush));
      //noCursor();
      stroke(random(255),random(255),random(255),random(40,180));
      strokeWeight(random(40));
      line(mouseX+random(-brush,brush),py,px,mouseY+random(-brush,brush));
      triangle(mouseX+random(-brush,brush),px,px,py,py,mouseY+random(-brush,brush));
    }
  }

