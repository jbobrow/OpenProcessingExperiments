
void setup() {
  size(400,400);
  background(225,225,225);
  strokeWeight(6);
}

//set Line Parameters
void draw() {
  for (int x=0; x<=width; x=x+70) {
   
      line(x+30,0,x+30,height);
      
         for (int y=0; y<=height-100; y=y+55) {
     
             line(0,y+50,width,y+50);
             
             for (int z=0; z<=height/2; z=z+55)
              line(z+30,0,z+30,height);
             
             for (int Y=0; Y<=height-100; Y=Y+5);
                line(0,Y+10,width,Y+10);
                
//Add rectangles                
     if (mousePressed == true) {      
     fill(random(0,255),random(0,255),random(0,255));
     
      noStroke();
      
      rect(0,14,27,33);
     fill(random(0,255),random(0,255),random(0,255));
      rect(143,108,25,50);
     fill(random(0,255),random(0,255),random(0,255));
      rect(314,328,65,73);
     fill(random(0,255),random(0,255),random(0,255));
       rect(33,273,135,50);
           
     }
    }
    
   
      
    
  }
}



