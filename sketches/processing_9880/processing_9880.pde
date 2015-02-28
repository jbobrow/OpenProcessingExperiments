
    
    
    //Ray the majority of this code I found on the processing site. From the storing input part of the
    //learning section. It doesn't list an author
    
    //Global- this is the area that affects all parts of the sketch.
    //This first variable is the size of the ellipse in the array. The float variable
    // is for the red, green, blue, and alpha numbers.
    int num=100;
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
    
      //first if statement says if the framecount is greater than 300 and less than 320, show this ellipse and rectangle
      //the others follow insimilar fashion, except the last says just show the rectangle. 
    
      if ((frameCount > 300) && (frameCount< 320)){
        ellipse(50,50,10,10);
        rect(50,50,350,2);
      }
      if ((frameCount > 310) && (frameCount< 340)){
        ellipse(100,50,10,10);
        rect(50,50,350,2);
      }
      if ((frameCount > 330) && (frameCount< 360)){
        ellipse(150,50,10,10);
        rect(50,50,350,2);
      }
      if ((frameCount >350) && (frameCount< 380)){
        ellipse(200,50,10,10);
        rect(50,50,350,2);
      }
      if ((frameCount > 370) && (frameCount< 400)){
        ellipse(250,50,10,10);
        rect(50,50,350,2);
      }
      if ((frameCount > 390) && (frameCount<420)){
        ellipse(300,50,10,10);
        rect(50,50,350,2);
      }
      if ((frameCount > 410) && (frameCount< 440)){
        ellipse(350,50,10,10);
        rect(50,50,350,2);
      }
      if ((frameCount >430) && (frameCount< 460)){
        ellipse(400,50,10,10);
        rect(50,50,350,2);
      }
      if ((frameCount > 450) && (frameCount<480)){
        rect(50,50,350,2);
      }
      else if ((frameCount > 470) && (frameCount < 550)){
        rect(50,50,350,2); 
      }
    
    }//end draw
    
    //This randomizes the colors that are used, i.e. red is equal to random colors from values 50 to 255. The a is the alpha value.
    
    void randomColor(){
      r = random(50,255);
      g = random(50,255);
      b = random(50,255);
      a = (150);
    }
    //The mouse pressed and released tells the mouse when it is pressed to run the counter, or replace the screen continuously.
    //Released says to stop and keep the sketch at that place.
    void mousePressed() {
      loop(); 
    }
    void mouseReleased() {
      noLoop();
    
      //This calls the colors to be random.
      randomColor(); 
    }
    


