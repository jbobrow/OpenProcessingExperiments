

  float eye1 = 88;
  float eye2 = 50;
  float eye3 = 16.5;
 
  float easing = 0.1;
  float speed = 0.0;
 
 
 
void setup() {
  size (640, 480);
  smooth();
}
 
 
void draw () {
  background(0);
  noStroke();
  
  float target = dist(mouseX, mouseY, pmouseX, pmouseY);
  speed += (target-speed) * easing;
  
  float d = speed *5;
  println(d);
 
 if (mousePressed)
 {
   strokeWeight(3);
   stroke(255);
   ellipse(mouseX, mouseY, 50, 50);
   noStroke();
 } 
 
  //track mouse movement 
  //right eye x
  float trackRightx=map(mouseX, 0, 640, 428, 460);
   //left eye x
  float trackLeftx=map(mouseX, 0, 640, 191, 223);
   //right eye y
  float trackRighty=map(mouseY, 0, 500, 197, 229);
   //left eye y
  float trackLefty=map(mouseY, 0, 500, 197, 229);
  

   ///////BEGIN LEFT EYE \\\\\\\\\\\//////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
   
  //LEFT EYE bg details
 
  //eye rim
  fill(260, 161, 176);
  ellipse (207, 213, 160, 150);

 
  // Sclera
  fill(255, 250-(d/1.5), 232-(d/1.5));
  ellipse(207, 213, 133, 133);
 
 
 
     //LEFT INNER EYE
    //pink iris
    fill(181, 65, 125);
    ellipse(trackLeftx, trackLefty, eye1, eye1-5);
    //pupil
    fill(0);
   if(mousePressed)
    {
       for(int i =0; i < 200; i++)
      { 
        ellipse(trackLeftx, trackLefty, eye2/6,eye2-(i*.01));
      }
    }
    else
    {
      ellipse(trackLeftx, trackLefty, eye2/3,eye2+20);
    }
    
    //shine
    fill(255, 65);
    ellipse(trackLeftx -17, trackLefty-17, eye3+20, eye3+20);
 
 
 
 
 ////// BEGIN RIGHT EYE \\\\\\\\\\\\\\\\/////////////////////////////////////\\\\\\\\\\\
 
 //RIGHT EYE

  //eye rim
  fill(230, 161, 176);
  ellipse(444, 213, 160, 150);

 
  // sclera
  fill(255, 250-(d/1.5), 232-(d/1.5));
  ellipse(444, 213, 133, 133);
 
     
     

    //pink iris
    fill(181, 65, 125);
    ellipse(trackRightx, trackRighty, eye1, eye1-5);
    //pupil
    fill(0);
    
    if(mousePressed)
    {
       for(int i =0; i < 200; i++)
      { 
        ellipse(trackRightx, trackRighty, eye2/6,eye2-(i*.01));
      }
    }
    else
    {
    ellipse(trackRightx, trackRighty, eye2/3,eye2+20);
    }
      
    
    //shine
    fill(255, 65);
    ellipse(trackRightx-17, trackRighty-17, eye3+20, eye3+20);
     
    
     
    }



