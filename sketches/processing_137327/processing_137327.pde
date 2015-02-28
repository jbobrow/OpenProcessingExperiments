
float r=0;
float g=100;
float b=100;


int opacity=0;
int dia=50;

void setup(){
  size(600,500);
  background(0);
  smooth();
}

void draw(){ // i will change these into functions
// while(mousePressed){
   noStroke ();
  fill(0,0,0,opacity);
  ellipse(mouseX,mouseY,dia,dia);
  opacity=random(0,150);
 //}
  
}



void mouseClicked(){
  
   
  fill(r,g,b,opacity);
  noStroke();
  ellipse(mouseX,mouseY,dia,dia);
  ellipse(mouseX, height-mouseY, dia, dia); // the height- and width- allows it to be mirrored on the x and y axis
  ellipse(width-mouseX,mouseY,dia,dia);
  ellipse(width-mouseX, height-mouseY, dia,dia);
     
r=random(50,100);
g=random(20,80);
b=random(100,150);
  opacity=random(50,200);
  dia=random(10,80);
  /*if (mousePressed){
  dia++;
  }*/


}
void keyPressed() { //save the drawing by pressing the 's' key
  if (key=='s')
  {
    saveDrawing();
  }
}


 function saveDrawing() {
  saveFrame("images/circles-###.png"); //it should open the image in a new tab on web
 }


