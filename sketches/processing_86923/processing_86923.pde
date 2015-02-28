
int myX;
int myY;

void setup() {
  size(500,500);
  background(255,255,255);
}

void draw() {
  
  
 background(255,255,255);   
    myX=mouseX;
    myY=mouseY;
  
  
  //body
  
     fill(255,50,100);
    ellipse(myX,myY,200,200);
    
    fill(255,255,255);
    ellipse(myX,myY+20,125,100); //stomach
    
    //arms
    
    fill(255,50,100);
    ellipse(myX-90,myY-35,25,25);
    
     fill(255,50,100);
    ellipse(myX+90,myY-35,25,25);
  
  //ears
  
     //left ear
     fill(255,50,100);
     ellipse(myX-50,myY-215,35,35);
     
     //left ear - small
     fill(255,255,255);
     ellipse(myX-50,myY-215,20,20);
     
     //right ear
     fill(255,50,100);
     ellipse(myX+50,myY-215,35,35);
     
     //right ear - small
     fill(255,255,255);
     ellipse(myX+50,myY-215,20,20);
     
  
  //face
    fill(255,50,100);
      ellipse(myX,myY-150,150,150);
      
    //middle eye
      fill(255,255,255);
      ellipse(myX,myY-175,20,20);
    
       fill(0,0,0); //eyeball
       ellipse(myX,myY-175,5,5);
    
     //left eye   
       fill(255,255,255);
       ellipse(myX-20,myY-175,20,20);
     
       fill(0,0,0); //eyeball
       ellipse(myX-20,myY-175,5,5);
    
      //right eye   
       fill(255,255,255);
       ellipse(myX+20,myY-175,20,20);
     
       fill(0,0,0); //eyeball
       ellipse(myX+20,myY-175,5,5);
       
       
       // teeth
      fill (255,255,255);
      triangle(myX-10,myY-150,myX+10,myY-150,myX,myY-130);
      
      fill (255,255,255);
      triangle(myX-10, myY-150, myX-30, myY-150, myX-20, myY-120);
    
      fill (255,255,255);
      triangle(myX+10, myY-150, myX+30, myY-150, myX+20, myY-120);
      
      //hair
      fill (0,0,0);
      rect(myX,myY-235,3,10);
      
      
 //left foot
     fill(140,69,19);
     ellipse(myX-40,myY+110,55,25);
     
 //right foot
     fill(140,69,19);
     ellipse(myX+40,myY+110,55,25);
      



}
