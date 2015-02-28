
void setup () {
  size (600, 300);
  colorMode(RGB, width);
  background (500);

  frameRate (2);//speed of transition between stages
}

float count =0;//first stage/building calculation factor-starting point

float num=20;//first stage calc. factor for number of items

float meh=-2;//second stage /confetti calc. factor


void draw() {//upper block of top of column/ column cap

  if (count < num) {
    
    if (count % 2 == 0) {//ration for spacing
    
      fill ((count/num)*width);//sets shade tone
      
      rect (count*31, height/num+70, 20, 20);//count*30(x variable-controls spacing of first only..)
      
    }
    
  }

  if (count < num) {//larger block/ column shaft
  
    if (count % 2 == 0) {
      
      fill ((count/num)*width, 300);//shade set
      
      rect (count*31, (height/num+100), 20, 140); //y variable affected by +100 to move down
      
    }
    
  }

  if (count < num) {//circle-heads of people
  
    fill (455, 255, 255, 300);//transparency set
    
    ellipse (count*31+10, (height/num+150), 20, 20);
    
  }

  if (count < num) {//lower square/ column base
  
    noFill();
    
    if (count % 2 == 0) {
      
      strokeWeight(2);
      
      rect (count*31, height/num+270-20, 20, 20);//count*30(x variable-controls spacing of first only..)
      
    }else {
      
    }
    
    if (meh<0) {//roof
    
      fill(222, 85, 101, 20);
      
      arc(300, 68, 600, 100, PI, TWO_PI);
      
    }

    int b=20; 
    
    if (b>0) {//Green square

      strokeWeight(1);

      fill (255, 455, 155, 200);//transparency set

      rect (random(width), random(height), 5, 5);
      
    }

    int c=30;

    if (c<0);//Purple square

    fill (109, 62, 198, 300);

    rect (random(width), random(height), 10, 10); //speed can be controlled with area covered division  X/4..ex
  
 }
 
  count++;

}


//reset code borrowed from Sean Gillespe

void keyPressed() {   //when the 'r' key is pressed, the program is set back to the setup stage of the script

  if (key == 'r') {
    
    count = 0;     //the count variable is reset
    
    setup();
    
  }
  
}





