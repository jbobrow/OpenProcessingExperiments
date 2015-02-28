
void setup() {
size (400, 400);
background(200);
smooth();
}

void draw (){
 noStroke (); 
 //fill(255,1);
 //rect(0,0, 400, 400);
 fill(50,50);
 ellipse(mouseX,mouseY, 60, 60);
  
 stroke (0);
   if (mousePressed){
   noStroke();
   fill(255,10);
   rect(0,0, 400, 400);
   }
 fill(0);
 ellipse(200, 200, 60,60);
 line(200,200,mouseX, mouseY);
 }            
                
