
                                                                                                                                         
                                                                                                                  
//import processing.pdf.*;

float x = 10;
float y = 10;
float diam = 20;
float h = random(10-255);

//int counter = 0; 

void setup()

{

 //size (500, 500, PDF, "final1.pdf"); 
 size(600, 600);
 background (255);
 smooth();
 frameRate(200); 
// noLoop(); 

}

void draw ()

{

    //while(counter < 1000) { 
    noStroke();
    fill(0,0,0,80);
    ellipse (x, y, diam, diam);
    ellipse (x+y, y+y, diam + 10 , diam + 10);
  //endRecord();
    
    diam = diam * random(0.8,0.99);
    
    x = x + 20;
     
    if(x > 600){
       y = y+20;
       x = 10;
       diam = 20;
   
   }
     
    // counter = counter + 1; 
 // }
   
 //  println("ALL DONE");
   //exit(); 
   
}

