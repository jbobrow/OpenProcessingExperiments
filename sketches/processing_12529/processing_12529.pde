
//import fullscreen.*; 
//FullScreen fs;
int value = 0;
float w = 500;



void setup(){
 background(255);
 //fs = new FullScreen(this);  
 size(500,500);
 smooth();
 
}



void draw(){
  
  

  if(w<=50){
    w=500;}
    
  }


void keyPressed(){
 
  /*if(key == 'a') {
    fs.enter(); 
   }*/
   
   if(key==CODED){
   
     
   if (keyCode==UP){
     
      w = w - 5;
    //  h = h - 5;
   
    
    strokeWeight(5); 
    ellipse(width/2,height/2,w,w);
    stroke(random(255),random(255),random(255));
    
    fill(random(255),random(255),random(255));
  }
  if(keyCode==DOWN){
        w = 500;
        stroke(255);
        strokeWeight(10);
        
        fill(255);
        ellipse(width/2,height/2,w,w);
        
  }
   
   
 } 
}


