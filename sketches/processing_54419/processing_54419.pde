

PImage img; //creates a place to store images named img
String mode = "normal"; //create a string called mode. This will the 'normal' mode
String[] Cars = {"Alfa_Romeo 8C Spider.jpg","Ferrari 458 Italia_3.jpg","Formula 1_43.jpg",
"Jaguar XKR 2011 03.jpg", "Lamborghini Gallardo LP570-4 Superleggera 2011 03.jpg"};
//Creates a string called Cars and store these file names in it

void setup() { //set this up
  size(640, 480); //cavas size
  int randomimage = int(random(5)); //at the start of the sketch select a random number from 0 - 5 
  img=loadImage(Cars[randomimage]);; //load the this number as an image from the Cars string and store it in img
  background(255); //make the background white...
  noStroke(); //with no strokes

}

void draw() { //draw this
}

void keyPressed () { //when a key is pressed do this
  if (key == ' ') { //if the space key is pressed
    if (mode.equals("erase")) { // if the mode is erase... 
      mode = "normal"; //make it normal..
    }
    else {
      mode = "erase"; //if its already normal switch it too erase
    }
  }
    if (key == 'l') { //if the l key is press
      int randomimage = int(random(5));//select a random number between 0 and 5
      img=loadImage(Cars[randomimage]); //then load this number as an image from the Cars string in img
  mode = "normal";//when this happens, normal mode will be activated 
  
}
  }

  void mouseDragged() { //when the mouse is dragged do this...
    if (mode.equals("normal")) { //if the mode is normal
      PImage clip = img.get(mouseX, mouseY, 50, 50); //get a square block of the image from the mouse x and y coordinates
      image(clip, mouseX, mouseY);// and paste it on the mouse x and y coordinates
    }
    else if (mode.equals("erase")) { //or if in erase mode
      fill(255); //white fill...
      rect(mouseX, mouseY, 100, 100);//this square at mouse x and y
    }
  }


