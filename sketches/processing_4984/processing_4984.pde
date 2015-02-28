
//Robot .SAB 

 int bodyX = 144; 
 int bodyY = 151; 
 int bodyWidth = 86; 
 int bodyHeight = 176; 

  void setup(){ 
       //Draw the display window 480 pixels wide and 320 pixels high 
   size(480,320);  
       //smooth all edges 
   smooth(); 
  
}
void draw() 
 { 
    //grey 
    background(205); 
  
    //ellipse body 
    fill(255); 
    strokeWeight(5); 
    ellipse(bodyX,bodyY,bodyWidth,bodyHeight); 
  
    //head ellipse shape 
    ellipse (bodyX - 3, bodyY - 59, bodyWidth + 64, bodyHeight - 51); 
    fill(255); 
    strokeWeight(5); 
  
    // left ear/headphone 
    fill(255); 
    stroke(0); 
    strokeWeight(5); 
    ellipse(bodyX - 65, bodyY - 59, bodyWidth - 62, bodyHeight - 151); 
 
    // eyes/visor black 
    fill(0); 
    rect(bodyX - 38, bodyY-69, bodyWidth +34, bodyHeight - 134); 
   
    //arm 
    fill(255); 
    strokeWeight(5); 
    stroke(0); 
    ellipse(bodyX - 31 , bodyY + 37, bodyWidth - 58, bodyHeight - 108); 
  
    //legs
    fill(0); 
    strokeWeight(2); 
    ellipse(bodyX -1,bodyY +95 ,26,4); 
    ellipse(bodyX -1,bodyY +101 ,20,4); 
    ellipse(bodyX -1,bodyY +107 ,14,4); 
    
  } 



