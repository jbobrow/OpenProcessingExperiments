
class Cell{
  PVector location;
  PVector velocity; 
  float redd;
  float greenn;
  float bluee;
  boolean isseed;
   Cell(){  
  location= new PVector(random(-300,300),random(-300,300),random(-100,100)); // These values can be played depending on what sort of 3D effect we want...
  isseed=false;  
  }

  void display(){    
  if(isseed==false){    
  strokeWeight(1);  
  stroke(redd,greenn,bluee);
  point(location.x,location.y,location.z);
  redd=0;
  greenn=0;
  bluee=0;
  }  
 if(isseed==true){ //The aim was normally changing appearance of seed. Strokeweight worked well, but I could not understand why color did not turn to red.
  strokeWeight(6);  
  redd=255;
  greenn=0;
  bluee=0;
  point(location.x,location.y,location.z);
 }   
  }
 void update(){
  if(isseed==false){  
  velocity= new PVector(random(-2,2),random(-2,2),random(-0,2));
  location.add(velocity);
  }        
  }  
 void controlzposition(){    //I want cells gather at top.
    if(location.z>350){
     location.z=350;     
    }
  }
}

