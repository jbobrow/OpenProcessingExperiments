
// _mona lisa    monzP5.wordpress.com

PImage img;


void setup(){
  
img = loadImage("mona - lisa.jpg"); // you can use URL's as well
// img = loadImage("http://www.leonardo-da-vinci-biography.com/images/leonardo-da-vinci-mona-lisa.0.jpg");
                    

//size(img.width,img.height);
size(400,400);

 image(img,0,0,500,400);
}


void draw(){ }

void mouseDragged() {
  strokeWeight(8);
 
    stroke(11);
  
 line(mouseX,mouseY,pmouseX,pmouseY);
  }
  
  
  
  void keyPressed(){
    
   if(key=='c') { 
    image(img,0,0,500,400);
     
   }
   
   
  }
  
  
  

