
void setup() {
size(400, 400);
smooth();
noCursor();
}

void draw(){
  
//background(200);
     if(mousePressed == true){
      fill(200, 0); 
     }else{
     fill(200);
     }

 noStroke();
 rect(0, 0, width, height);

//vertical lines
 stroke(255);
 line(width/2, 0, mouseX, mouseY);


for(int y=0; y<height; y=y+10){
 for(int x=5; x<width; x=x+10){
   stroke(150);
   strokeWeight(1);
   line(x, y, x, y+5);
   
   if(dist(x, y, mouseX, mouseY) <15){
     stroke(100);
     line(x, y, mouseX, mouseY);
     
     stroke(0);
     fill(0);
     ellipse(mouseX, mouseY, 3, 3);
     }
   
   }
   }

}

