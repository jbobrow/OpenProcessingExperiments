
   
       
        //Ray the majority of this code I found on the processing site. From the storing input part of the
        //learning section. It doesn't list an author
        
        //Global- this is the area that affects all parts of the sketch.
        //This first variable is the size of the ellipse in the array. The float variable
        // is for the red, green, blue, and alpha numbers.
    int num=200;
    float r,g,b,a;
   
        
        //float is a variable that means the number defined can have decimals. 
        //The first array devines the array for the x position, and the second for the y.
    float mx[] = new float [num];
    float my[] = new float [num];
    
        //setup describes the things that will stay the same through sketch. Like the screen size, 
        //that the object will have smooth not jagged edges, won't have a stroke.
    void setup(){
      size(450,450);
      smooth ();
      noStroke();
    }
    
        //Inside draw is the place that the things that change go.  In this case I put background in here 
        //so that it will replace in each frame.
    void draw(){//begin draw
       background(15,0,26);
        
          //Cycle through the array, using a different entry on each frame.
          //Using modulo(%) like this is faster than moving the values all over.
          //The modulo operator(%)returns the remainder of a number divided by another.
          //It is often used to keep numerical values within a set range.
          //variable "which" is defined as equal to the system variable.
          //frameCount which contains the number of frames displayed since the program started
        
      int which = frameCount % num;
      println(frameCount);
      mx[which] = mouseX;
      my[which] = mouseY;
    
          //for loop says that we will begin counting at 0, will run as long as i is less than num
          //and will add one each time.
        
      for (int i= 0; i < num; i++) {//begin for loop
          //variable index is defined as the array which adding one plus i divided by the remainder of num.
          //which+1 is the smallest (the oldest in the array) the oldest disappears as the new one appears.
        int index = (which + 1 + i) % num;
          //defines the fill as a combination of red, green, blue, and an alpha.
        fill(r,g,b,a);
          //defines the shape as a circle that gets smaller.  
        ellipse(mx[index], my[index], i/1,i/1);
      }//end for loop
    
    }//end draw

    void randomColor(){
      r = random(0,255);
      g = random(0,255);
      b = random(0,255);
      a = (25);
    }
    
    void mousePressed() {
    loop(); 
   }
   
    void mouseReleased() {
    noLoop();
    
    randomColor(); 
 }
    


