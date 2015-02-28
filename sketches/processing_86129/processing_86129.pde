
void setup() {
  size(250,250);
  background(255,255,255);
}

void draw() {
  println(mouseX+" "+mouseY);
  
  //body
    fill(255,50,100);
    ellipse(125, 250,200,250);
  
  
  //ears
  
     //left ear
     fill(255,50,100);
     ellipse(75,55,35,35);
     
     //left ear - small
     fill(255,255,255);
     ellipse(75,55,20,20);
     
     //right ear
     fill(255,50,100);
     ellipse(185,55,35,35);
     
     //right ear - small
     fill(255,255,255);
     ellipse(185,55,20,20);
     
  
  //face
    fill(255,50,100);
      ellipseMode(CENTER);
      ellipse(130,110,150,150);
      
    //middle eye
      fill(255,255,255);
      ellipse(130,75,20,20);
    
       fill(0,0,0); //eyeball
       ellipse(130,75,5,5);
    
     //left eye   
       fill(255,255,255);
       ellipse(110,75,20,20);
     
       fill(0,0,0); //eyeball
       ellipse(111,75,5,5);
    
      //right eye   
       fill(255,255,255);
       ellipse(150,75,20,20);
     
       fill(0,0,0); //eyeball
       ellipse(150,75,5,5);
       
       
       // teeth
      fill (255,255,255);
      triangle(120, 100, 140, 100, 130, 120);
      
      fill (255,255,255);
      triangle(120, 100, 100, 100, 110, 120);
    
      fill (255,255,255);
      triangle(140, 100, 160, 100, 150, 120);
      
      //hair
      fill (0,0,0);
      rect(127,25,3,10);
      

      



}
