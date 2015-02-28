
 //import PDF library
  import processing.pdf.*;
  
  //create a boolean to turn recording on/off
  boolean record;
  
  void setup () 
  
    {
    
      size (480, 720);
      background (255);
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
      

      stroke(0);
      strokeWeight(10);
      for ( int i = 0; i <=2; i++)
      
        {
          
          line(0,i*height/2,width,i*height/2);
          line(i*width/2,0,i*width/2,height);
          
        }     
            
      for (int i = 0; i < width; i+=16) 
      
        {
   
          if (i > 20 && i < width/2-20 || i > width/2+20 && i < width-20 ) 
          
            {
          
              fill(0);
              noStroke();
              ellipse(i,20,15,15);
          
            }
          
          if (i > 20 && i < width/2-20 || i > width/2+20 && i < width-20 ) 
          
            {
            
              fill(0);
              noStroke();
              ellipse(i,height/2-20,15,15);
            
            }
    
          if (i > 20 && i < width/2-20 || i > width/2+20 && i < width-20  ) 
          
            {
    
              fill(0);
              noStroke();
              ellipse(i,height/2+20,15,15);
   
            }
    
          if (i > 20 && i < width/2-20 || i > width/2+20 && i < width-20 ) 
          
            {
    
              fill(0);
              noStroke();
              ellipse(i,height-20,15,15);
   
            }
    
        }

      for (int i = 1; i <= 3; i+=2) 
        
        {
  
          for (int j = 1; j <= 3; j+=2) 
            
            {

              maltese(i*width/4,j*height/4);
    
            }
        
         }
    
    

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



  void maltese (int Xcenter, int Ycenter) 
  
    {
  
       fill(255,0,0);
       stroke(255,0,0);
       strokeWeight(13);
       
       line (Xcenter, Ycenter, Xcenter+60, Ycenter);  
       triangle(Xcenter+45, Ycenter, Xcenter+75, Ycenter-23, Xcenter+75, Ycenter+23);
 
       line (Xcenter, Ycenter, Xcenter-60, Ycenter); 
       triangle(Xcenter-45, Ycenter, Xcenter-75, Ycenter-23, Xcenter-75, Ycenter+23);
 
       line (Xcenter, Ycenter, Xcenter, Ycenter+60); 
       triangle(Xcenter, Ycenter+45, Xcenter-23, Ycenter+75, Xcenter+23, Ycenter+75);
 
       line (Xcenter, Ycenter, Xcenter, Ycenter-60);
       triangle(Xcenter, Ycenter-45, Xcenter-23, Ycenter-75, Xcenter+23, Ycenter-75); 
    
    }











                
                
