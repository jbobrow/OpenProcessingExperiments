
 PImage myImg; 


void setup(){
   size(600,600); 
   background(126,123,101); 
   smooth(); 
   noStroke(); 
   frameRate(10);
    myImg = loadImage("eyes.gif"); 
}
//   fill(255,255,255); 
//   ellipse(225,150,70,85); 
//   ellipse(375,150,70,85); 
//   fill(173,98,05); 
//   ellipse(225,170,40,40); 
//   ellipse(375,170,40,40);
//  
//  
//   fill(0,0,0);
//   ellipse(225,170,20,20); 
//   ellipse(375,170,20,20); 
//   

   
   
   
   
void draw(){
  image(myImg,0,0);
}

 


void keyPressed(){
    if(key=='b' || key=='B'){
      background(13,86,180);
    }
      if(key=='g' || key=='G'){
      background(44,118,13);
    }
     
     if(key=='h' || key=='H'){
      background(103,108,27);
    }
    
    if(key=='o'|| key =='O'){
    background(240,56,80); 
    }
    
}  
   
   
void mousePressed(){
  fill(0,0,0);
   rect(0,0,600,300); 
    

}
 

 //void keyPressed(){
//    if(key=='k' || key=='K'){
//    fill(5,168,255);
//    ellipse(225,170,40,40); 
//    ellipse(375,170,40,40);
//    fill(0,0,0);
//    ellipse(225,170,20,20); 
//    ellipse(375,170,20,20); 
//    }





