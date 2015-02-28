
//import PDF library
import processing.pdf.*;

//create a boolean to turn recording on/off
boolean record;

void setup () 

  {
  
    size (480, 720);
    background (250,250,0);
    rectMode (CENTER);
    noStroke();
    smooth();
  
  }

  
void draw () 

  {
    
    //use an if statement to start recording
    if (record) 
    
      {
        
        // Note that #### will be replaced with the frame number. Fancy!
        beginRecord(PDF, "frame-####.pdf");
      
      }
      
      
    for (int f = 10; f < height+150; f+=20)
  
      {
      
        stroke(200,200,0);
        line(0,f,width,f);
        noFill();
        ellipse(width/2,height/2,f,f);     
        noStroke();
      }  

    for (int i = 10; i < width; i+=20) 
    
      {
        
        for (int j = 10; j < height; j +=20) 
      
          {
    
            if (j < 20 || j > (height - 20) || i< 20 || (i > width-20) ) 
          
              {
              
                fill(0);
                rect (i, j, 15 , 15);
                fill(200,0,0);
                ellipse(i,j,10,10);
   
              }
    
            if ( j > 20 && j < 60 || j > (height - 60) && j < (height - 20) 
              || j > (height/2-40) && j < (height/2+40) 
              || i > (width/2-40) && i < (width/2+40) || i>20 && i < 50
              || i > width-50 && i < width-20) 
            
              {
              
                fill(200,0,0); 
                ellipse(i,j, 10, 10); 
      
              }
        
          }
    
      }

    fill(0,0,0);
    triangle( 60, height/2 - 60, 60, 60, width/2-60, height/2-60);
    triangle( width-60, height/2 - 60, width-60, 60, width/2+60, height/2-60);
    triangle( 60, height/2+60, width/2-60, height/2+60,60, height - 60);
    triangle( width-60, height/2+60, width-60, height-60, width/2+60, height/2+60); 



    //use an if statement to stop recording and turn recording off
    if (record) 

      {

        endRecord();
        record = false;

      }

  }
  
//if you press a key, a pdf will be recorded
void keyPressed () 

  {

    record = true;

  }
  
  
  
  
