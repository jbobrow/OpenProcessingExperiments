

//import PDF library
import processing.pdf.*;
//create a boolean to turn recording on/off
boolean record;


int x=20;
void setup  (){
  
 
 size (480,720);
 background(220);
 smooth();
}


void draw(){
  
  
  //use an if statement to start recording
if (record) {
// Note that #### will be replaced with the frame number. Fancy!
beginRecord(PDF, "frame-####.pdf");
}
  
  rectMode(CENTER);
 
 noStroke();
 
 
 fill (204,153,0);
 /*rectangulo superior e inferior*/
 rect(width/2,20,width,140);
 rect(width/2,680,width,100);
 
 
 
  fill (30);
  while(x < width){
    
   /*color negro*/
    fill (30);
    
    /*primera franja*/
 
  rect (x, 100, 20,20);
    rect (x+20, 120, 20,20);
       rect (x, 140, 20,20);
       rect (x+20, 160, 20,20);
       /*2a franja*/
        rect (x+20, 330, 20,20);
     rect (x, 350, 20,20);
       rect (x+20, 370, 20,20);
   rect (x, 390, 20,20);
   
   /*3a franja*/
        
     rect (x, 560, 20,20);
       rect (x+20,580 , 20,20);
   rect (x, 600, 20,20);
   rect (x+20, 620, 20,20);
       
       
       
       
  /*color blanco*/
    fill (224,153,0);
 /*primera franja*/
  rect (x+20, 100, 20,20);
  rect (x, 120, 20,20);
  
   rect (x+20, 140, 20,20);
   
    rect (x, 160, 20,20);
    
    
    /*2a franja*/
  rect (x, 330, 20,20);
     rect (x+20, 350, 20,20);
       rect (x, 370, 20,20);
   rect (x+20, 390, 20,20);
   
   /*3a franja*/ 
   
             
     rect (x+20, 560, 20,20);
       rect (x,580 , 20,20);
   rect (x+20, 600, 20,20);
   rect (x, 620, 20,20);
   
   
   
  //variable
  x = x + 40;
  
  /*rectangulos*/
  
  //superior
  rect(width/2, 245, width, 150);
  
  //inferior
  rect(width/2, 475, width, 150);
  
  /*triangulos */
fill (0,190,220,170);

  //superiores
triangle(80, 320, 240, 170, 400, 320);

  //inferiores
  triangle(80, 400, width/2, 550, 400, 400);
  
  
  }
   noFill();
   stroke (0);
  strokeWeight(20);
  rect(width/2,height/2,width,height);
 

//use an if statement to stop recording and turn recording off
if (record) {
endRecord();
record = false;
}

}


//if you press a key, a pdf will be recorded
void keyPressed () {
record = true;
}
                
                
