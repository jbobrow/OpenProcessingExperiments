
PImage img;
PImage alien;
int i;


void setup() {
  size (600, 600, P3D);
 

}
  void draw(){
PImage img = loadImage("star-trek-transporter.jpg");

img.resize(600, 600);
image(img, 0, 0);
if (mousePressed) {
  //strokeWeight(10);  
  String n = "Scottie BEAM US DOWN ALREADY!";
    textSize(25);
stroke(250);
    text(n, 350, 50, 135, 200);
   
  }
//kirk
    if(dist(mouseX,mouseY,300,150)<50) {  
    rect (250,10,100,600);
    fill (210,233,247,150);
    }
  else{
    
  } 
      
  //doc
if(dist(mouseX,mouseY,150,150)<50) {  
   rect (100,10,100,600);
   fill (210,233,247,100);
  }
  else{
    
 }
    //spock
if(dist(mouseX,mouseY,420,150)<50) {  
    rect (420,10,100,600);
    fill (210,233,247,150);
  }
  else{
    
  
  }
  }
  
  
 


