
void setup() {
   size(500,500);
   background(255);

  rectMode(CENTER);
  noCursor();

}

void draw() {    
 fill(255,25);
  rectMode(CENTER);
 rect(width/2,height/2,width,height);


   if(mousePressed){
       fill(0);
  rectMode(CENTER);
 rect(width/2,height/2,width,height);
   fill(255);
 triangle(0,500,width,500,mouseX,mouseY);

   }else {
     fill(0);
 triangle(0,0,width,0,mouseX,mouseY);

  }
}
