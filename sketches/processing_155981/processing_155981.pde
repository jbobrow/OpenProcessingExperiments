
float w = 1;
float w2 = 100;

//here comes the setup function
void setup(){
  size(800, 800);
  smooth();
  background(0);

}


 //the draw function
void draw(){
  stroke(mouseX, mouseY, 190);
  fill(mouseY, mouseX, 200);
    line(mouseX,mouseY, w, w);
  }
   
//the codes that make it possible to "draw". From serveral sources on openprocessing and reference list (processing.org).
  void mouseDragged(){
   w++;
   w2--;
  }
   
  void mouseReleased(){
    w= 1;
    w2= 200;
  }
   
  void keyPressed(){
    if(key == 'n'){
      background(0);
    }
  
//code that makes it possible to take screen caps.
if(keyPressed == true && key == 's'){
  println("Saving image...");
  saveFrame("output-####.jpg"); 
  
  }
    }



