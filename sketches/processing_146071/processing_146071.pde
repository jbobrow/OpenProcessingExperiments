
void setup() {
size(800,500);
frameRate (25);
}



void draw() {
  
  fill(200,100,50);
ellipse(400,250,400,400);
fill(255);
ellipse(340,180,100,80);   //Auge
ellipse(460,180,100,80);   //Auge
fill(0);
ellipse(map(mouseX,0,800,315,365), map(mouseY,0,500,165,195),40,40);   //Pupille
ellipse(map(mouseX,0,800,435,485), map(mouseY,0,500,165,195),40,40);   //Pupille
  
  
  if (mousePressed == true) {
   ellipse(400,320,80,60);
  } 
  else {
    rect(360,320,80,5);
    }

}


