
int counter=0;

PImage[] pics = new PImage[7]; //holds pictures


void setup() {
size(400,400);
background(100);

 String[] filenames = { "a.jpg", "b.jpg", "c.jpg", "d.jpg", "e.jpg", "f.jpg", "g.jpg"  };
  
  for (int i = 0; i < filenames.length; i++ ) {
    pics[i] = loadImage(filenames[i]);
  } 
  
}

void draw() {
  background(100);
  imageMode(CENTER); 
  image(pics[counter], 200, 200);
  keyCheck();

  
}


void keyCheck() {
    
if(counter < pics.length) {
 
// for A  
  if(counter == 0) {
    if(keyPressed) {
      if (key == 'a' || key == 'A') {
      counter++;
      println(counter);
      } 
    } else {
        counter=0;
        println(counter);
        }  
  }
//  

// for B  
  if(counter == 1) {
    if(keyPressed) {
      if (key == 'b' || key == 'B') {
      counter++;
      println(counter);
      } 
    } else {
        counter=1;
        println(counter);
        }  
  }
//  

// for C 
  if(counter == 2) {
    if(keyPressed) {
      if (key == 'c' || key == 'C') {
      counter++;
      println(counter);
      } 
    } else {
        counter=2;
        println(counter);
        }  
  }
//  

// for D
  if(counter == 3) {
    if(keyPressed) {
      if (key == 'd' || key == 'D') {
      counter++;
      println(counter);
      } 
    } else {
        counter=3;
        println(counter);
        }  
  }
// 

// for E
  if(counter == 4) {
    if(keyPressed) {
      if (key == 'e' || key == 'E') {
      counter++;
      println(counter);
      } 
    } else {
        counter=4;
        println(counter);
        }  
  }
//

// for F
  if(counter == 5) {
    if(keyPressed) {
      if (key == 'f' || key == 'F') {
      counter++;
      println(counter);
      } 
    } else {
        counter=5;
        println(counter);
        }  
  }
//

// for G
  if(counter == 6) {
    if(keyPressed) {
      if (key == 'g' || key == 'G') {
      counter=0;
      println(counter);
      } 
    } else {
        counter=6;
        println(counter);
        }  
  }
//


        
 


}  // closes coutner to reach end
 else {
   counter=0;
 }
}  // closes keyCheck



