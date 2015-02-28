
float myX;
float myY;




void setup() {
  frameRate(1.5);
  size(500,500);
  background(255,255,255);
  
   myX=250;
   myY=250;
}

void draw() {
  
  


float c=random(width/4,width*3/4);
float b=random(width,width);
        
        myX=c;
        myY=375;

 background(random(100,255),random(0,255),random(0,255));    
  
  
  //body
  
     fill(255,50,100);
    ellipse(myX,myY,200,200);
    
    fill(255,255,255);
    ellipse(myX,myY+20,125,100); //stomach
    
    //arms
 pushMatrix();
  translate(10,10); // make 200,200 the new 0,0
   rotate(radians(random(-10,5))); // rotate around it
   
    fill(255,50,100);
    ellipse(myX-90,myY-35,25,25);
    
     fill(255,50,100);
    ellipse(myX+90,myY-35,25,25);
  
popMatrix();
  
  //ears
  pushMatrix(); 
    translate(10,10); // make 200,200 the new 0,0
   rotate(radians(random(-10,5))); // rotate around it
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
      triangle(myX-10, myY-150, myX-30, myY-150, myX-20, myY-130);
    
      fill (255,255,255);
      triangle(myX+10, myY-150, myX+30, myY-150, myX+20, myY-130);
      
      //hair
      fill (0,0,0);
      rect(myX,myY-235,3,10);
  popMatrix(); 
      
  pushMatrix();
    translate(10,10); // make 200,200 the new 0,0
   rotate(radians(random(-10,5))); // rotate around it


 //left foot
     fill(140,69,19);
     ellipse(myX-40,myY+110,55,25);
     
 //right foot
     fill(140,69,19);
     ellipse(myX+40,myY+110,55,25);
      
   popMatrix(); // back to the old grid (200=200)


}
