
//Living Portrait
//Brianna Hoftun

PImage myImage;
boolean mouseoverapplet;
 
void setup () {
  size(500, 666);
  myImage = loadImage("orange.JPG");
  image(myImage, 0, 0);
}

void draw() {
  if(mouseoverapplet) {
  if(mouseX > 200 && mouseX < 350 && mouseY > 125 && mouseY < 350) {
    if(mouseX < 325 && mouseY > 175 && mouseY < 250) {
      if(mouseX > 225 && mouseX < 275 && mouseY > 200 && mouseY < 225) {
         myImage =loadImage("black.JPG");
          tint(255, 255, 255, 215);
          image(myImage, 0, 0);
        }
      else {
        myImage =loadImage("yellow.JPG");
         tint(255, 255, 255, 215);
         image(myImage, 0, 0);
        }
       }
    else {
      myImage =loadImage("green.JPG");
         tint(255, 255, 255, 215);
         image(myImage, 0, 0);
    }
  }
  
  else if(mouseX > 350 && mouseY < 125) {
      myImage =loadImage("red.JPG");
         tint(255, 255, 255, 215);
         image(myImage, 0, 0);
        }
        
  else if(mouseX > 400 && mouseY > 125 && mouseY < 250) {
    if (mouseX > 425 && mouseY > 175 && mouseY < 225) {
       myImage =loadImage("lightgrey.JPG");
         tint(255, 255, 255, 215);
         image(myImage, 0, 0);
        }
      else {
        myImage =loadImage("darkgrey.JPG");
         tint(255, 255, 255, 215);
         image(myImage, 0, 0);
        }
      }
  
   else if(mouseX > 200 && mouseX < 300 && mouseY > 400 && mouseY < 500) {
     if(mouseX > 225 && mouseX < 275 && mouseY > 425 && mouseY < 475) {
       myImage =loadImage("burgundy.JPG");
         tint(255, 255, 255, 215);
         image(myImage, 0, 0);
        }
      else {
        myImage =loadImage("pink.JPG");
         tint(255, 255, 255, 215);
         image(myImage, 0, 0);
        }
     }
     
    else if(mouseX > 375 && mouseY > 275) {
      if(mouseX > 425) {
        if(mouseY > 325 && mouseY < 500) {
          myImage =loadImage("lightblue.JPG");
           tint(255, 255, 255, 215);
           image(myImage, 0, 0);
          }
          else if(mouseY > 500) {
          myImage =loadImage("darkblue.JPG");
           tint(255, 255, 255, 215);
           image(myImage, 0, 0);
          }
        }
       else{
        myImage =loadImage("white.JPG");
           tint(255, 255, 255, 215);
           image(myImage, 0, 0);
          }
      }
                
    else if(mouseX < 125 && mouseY > 300) {
      if(mouseX < 75 && mouseY > 450) {
          myImage =loadImage("purple.JPG");
           tint(255, 255, 255, 215);
           image(myImage, 0, 0);
          }
      else if(mouseX < 100 && mouseY > 375) {
        myImage =loadImage("chartreuse.JPG");
           tint(255, 255, 255, 215);
           image(myImage, 0, 0);
          }        
       else {
          myImage =loadImage("white.JPG");
           tint(255, 255, 255, 215);
           image(myImage, 0, 0);
          }
      }
        
    else if(mouseX < 100 && mouseX > 2 && mouseY > 2 && mouseY < 100) {
       if(mouseX > 25 && mouseX < 75 && mouseY > 25 && mouseY < 75) {
         myImage =loadImage("burgundy.JPG");
         tint(255, 255, 255, 215);
         image(myImage, 0, 0);
        }
       else {
         myImage =loadImage("pink.JPG");
         tint(255, 255, 255, 215);
         image(myImage, 0, 0);
        }
      }
      
    else if(mouseX > 100 && mouseX < 200 && mouseY > 175 && mouseY < 275) {
       if(mouseX > 125 && mouseX < 175 && mouseY > 200 && mouseY < 250) {
         myImage =loadImage("burgundy.JPG");
         tint(255, 255, 255, 215);
         image(myImage, 0, 0);
        }
       else {
         myImage =loadImage("pink.JPG");
         tint(255, 255, 255, 215);
         image(myImage, 0, 0);
        }
      }
      
    else if(mouseY > 575) {
      if(mouseX > 175 && mouseX < 350 && mouseY > 600) {
        myImage =loadImage("chartreuse.JPG");
         tint(255, 255, 255, 215);
         image(myImage, 0, 0);
        }
      else {
        myImage =loadImage("white.JPG");
         tint(255, 255, 255, 215);
         image(myImage, 0, 0);
        }
    }
         
   else {
     myImage =loadImage("orange.JPG");
         tint(255, 255, 255, 215);
         image(myImage, 0, 0);
        }
     }
     
   else {
     myImage =loadImage("orange.JPG");
         tint(255, 255, 255, 215);
         image(myImage, 0, 0);
    }
}

void mouseEntered(MouseEvent mouseEvent) {
  mouseoverapplet = true;
 
}

void mouseExited(MouseEvent mouseEvent) {
  mouseoverapplet = false;
} 


