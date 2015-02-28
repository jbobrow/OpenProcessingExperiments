
PImage img1; // Setting up image #1
PImage img2; // Setting up image #2
PImage img3; // Setting up image #3
PImage img4; // Setting up image #4 
PImage img5; // Setting up image#5
PImage img6; // Setting up image#6
PImage img7; // Setting up image#7
PImage img8; // Setting up image#8
PImage img9; // Setting up image#9
PImage img10;// Setting up image#10
PImage img11;// Setting up image#11
PImage img12;// Setting up image#12


int rectX1, rectY1; //Timeline Notch 1 Width And Height
int rectX2, rectY2; //Timeline Notch 2 Width And Height
int rectX3, rectY3; //Timeline Notch 3 Width And Height
int rectX4, rectY4; //Timeline Notch 4 Width And Height
int rectX5, rectY5; //Timeline Notch 5 Width And Height
int rectX6, rectY6; //Timeline Notch 6 Width And Height
int rectX7, rectY7; //Timeline Notch 7 Width And Height
int rectX8, rectY8; //Timeline Notch 8 Width And Height
int rectX9, rectY9; //Timeline Notch 9 Width And Height
int rectX10, rectY10; //Timeline Notch 10 Width And Height
int rectX11, rectY11; //Timeline Notch 11 Width And Height
int rectX12, rectY12; //Timeline Notch 12 Width And Height
int rectSize = 30; // Size Of Timeline Notch

float alpha1 = 255; //Setting alpha to 255 and to allow for fade in and out
float alpha2 = 255; //Setting alpha to 255 and to allow for fade in and out
float alpha3 = 255; //Setting alpha to 255 and to allow for fade in and out
float alpha4 = 255; //Setting alpha to 255 and to allow for fade in and out
float alpha5 = 255; //Setting alpha to 255 and to allow for fade in and out
float alpha6 = 255; //Setting alpha to 255 and to allow for fade in and out
float alpha7 = 255; //Setting alpha to 255 and to allow for fade in and out
float alpha8 = 255; //Setting alpha to 255 and to allow for fade in and out
float alpha9 = 255; //Setting alpha to 255 and to allow for fade in and out
float alpha10 = 255; //Setting alpha to 255 and to allow for fade in and out
float alpha11 = 255; //Setting alpha to 255 and to allow for fade in and out
float alpha12 = 255; //Setting alpha to 255 and to allow for fade in and out

color baseColor; //Allow for A return to colour

//timeline notches
boolean rect1Over = false; //Setting up for the roll over to fade
boolean rect2Over = false; //Setting up for the roll over to fade
boolean rect3Over = false; //Setting up for the roll over to fade
boolean rect4Over = false; //Setting up for the roll over to fade
boolean rect5Over = false; //Setting up for the roll over to fade
boolean rect6Over = false; //Setting up for the roll over to fade
boolean rect7Over = false; //Setting up for the roll over to fade
boolean rect8Over = false; //Setting up for the roll over to fade
boolean rect9Over = false; //Setting up for the roll over to fade
boolean rect10Over = false; //Setting up for the roll over to fade
boolean rect11Over = false; //Setting up for the roll over to fade
boolean rect12Over = false; //Setting up for the roll over to fade

void setup() {
  size(747,640);
  smooth();
  //Load images
  img1 = loadImage("newtrain.jpg");
  img2 = loadImage("heavytraffic.jpg");
  img3 = loadImage("builtup.jpg");
  img4 = loadImage("growthnow.jpg");
  img5 = loadImage("new.jpg");
  img6 = loadImage("busy.jpg");
  img7 = loadImage("oldtrain.jpg");
  img8 = loadImage("lighttraffic.jpg");
  img9 = loadImage("lessbuiltup.jpg");
  img10 = loadImage("growththen.jpg");
  img11 = loadImage("old.jpg");
  img12 = loadImage("quiet.jpg");
  baseColor = color(0); //Setting Colour To Black
     
  // Timeline Notch Locations
  rectX1 = width/4-rectSize-130;
  rectY1 = height/2-rectSize/2+200;
  rectX2 = width/4-rectSize;
  rectY2 = height/2-rectSize/2+200;
  rectX3 = width/4-rectSize+130;
  rectY3 = height/2-rectSize/2+200;
  rectX4 = width/4-rectSize+260;
  rectY4 = height/2-rectSize/2+200;
  rectX5 = width/4-rectSize+390;
  rectY5 = height/2-rectSize/2+200;
  rectX6 = width/4-rectSize+520;
  rectY6 = height/2-rectSize/2+200;
  rectX7 = width/4-rectSize-130;
  rectY7 = height/2-rectSize/2-220;
  rectX8 = width/4-rectSize;
  rectY8 = height/2-rectSize/2-220;
  rectX9 = width/4-rectSize+130;
  rectY9 = height/2-rectSize/2-220;
  rectX10 = width/4-rectSize+260;
  rectY10 = height/2-rectSize/2-220;
  rectX11 = width/4-rectSize+390;
  rectY11 = height/2-rectSize/2-220;
  rectX12 = width/4-rectSize+520;
  rectY12 = height/2-rectSize/2-220;
   }

void draw(){
   
  
  update(mouseX,mouseY);

 
// When mouse is over Notch 1 Image 1 Appears And Notch Becomes Black
  if (rect1Over) {
    image(img1,width/2,height/2);
    alpha1 = 0;
     
// When mouse is over Notch 2 Image 2 Appears And Notch Becomes Black    
  } else if (rect2Over) {
    image(img2,220,150);
     
    alpha2 = 0;

// When mouse is over Notch 2 Image 2 Appears And Notch Becomes Black  
  } else if (rect3Over) {
    image (img3,220,150);
    
    alpha3 = 0;

// When mouse is over Notch 4 Image 4 Appears And Notch Becomes Black   
  } else if (rect4Over) {
   image(img4,220,150);
   
    alpha4 = 0;

// When mouse is over Notch 5 Image 5 Appears And Notch Becomes Black  
  } else if (rect5Over) {
    image(img5,220,150);
    
    alpha5 = 0;

// When mouse is over Notch 6 Image 6 Appears And Notch Becomes Black    
  } else if (rect6Over) {
    image(img6,220,150);
  
    alpha6 = 0;

// When mouse is over Notch 7 Image 7 Appears And Notch Becomes Black   
  } else if (rect7Over) {
    image(img7,220,150);
  
    alpha7 = 0;

// When mouse is over Notch 8 Image 8 Appears And Notch Becomes Black
  } else if (rect8Over) {
    image(img8,220,150);
  
    alpha8 = 0;

// When mouse is over Notch 9 Image 9 Appears And Notch Becomes Black    
  } else if (rect9Over) {
    image(img9,220,150);
  
    alpha9 = 0;

// When mouse is over Notch 10 Image 10 Appears And Notch Becomes Black    
  } else if (rect10Over) {
    image(img10,220,150);
  
    alpha10 = 0;

// When mouse is over Notch 11 Image 11 Appears And Notch Becomes Black    
  } else if (rect11Over) {
    image(img11,220,150);
  
    alpha11 = 0;

// When mouse is over Notch 12 Image 12 Appears And Notch Becomes Black    
  } else if (rect12Over) {
    image(img12,220,150);
  
    alpha12 = 0;

//Anywhere Else Background Is Black And Notches Are White   
  } else {
    background(baseColor);
    
  }
// Notches darken from White To Black
alpha1 = alpha1+1;
alpha2 = alpha2+1;
alpha3 = alpha3+1;
alpha4 = alpha4+1;
alpha5 = alpha5+1;
alpha6 = alpha6+1;
alpha7 = alpha7+1;
alpha8 = alpha8+1;
alpha9 = alpha9+1;
alpha10 = alpha10+1;
alpha11 = alpha11+1;
alpha12 = alpha12+1;

//Drawing timeline notches
stroke(255);
fill(alpha1);
rect(rectX1, rectY1, rectSize, rectSize+20);
fill(alpha2);
rect(rectX2, rectY2, rectSize, rectSize+20);
fill(alpha3);
rect(rectX3, rectY3, rectSize, rectSize+20);
fill(alpha4);
rect(rectX4, rectY4, rectSize, rectSize+20);
fill(alpha5);
rect(rectX5, rectY5, rectSize, rectSize+20);
fill(alpha6);
rect(rectX6, rectY6, rectSize, rectSize+20);
fill(alpha7);
rect(rectX7, rectY7, rectSize, rectSize+20);
fill(alpha8);
rect(rectX8, rectY8, rectSize, rectSize+20);
fill(alpha9);
rect(rectX9, rectY9, rectSize, rectSize+20);
fill(alpha10);
rect(rectX10, rectY10, rectSize, rectSize+20);
fill(alpha11);
rect(rectX11, rectY11, rectSize, rectSize+20);
fill(alpha12);
rect(rectX12, rectY12, rectSize, rectSize+20);
}
//setting up fade in and out rollover
void update(int x, int y) {
  if (overRect1(rectX1, rectY1, rectSize, rectSize+20)) {
    rect1Over= true;
    rect2Over= false;
    rect3Over= false;
    rect4Over= false;
    rect5Over= false;
    rect6Over= false;
    rect7Over= false;
    rect8Over= false;
    rect9Over= false;
    rect10Over= false;
    rect11Over= false;
    rect12Over= false;
  } else if (overRect2 (rectX2, rectY2, rectSize, rectSize+20)) {
    rect1Over= false;
    rect2Over= true;
    rect3Over= false;
    rect4Over= false;
    rect5Over= false;
    rect6Over= false;
    rect7Over= false;
    rect8Over= false;
    rect9Over= false;
    rect10Over= false;
    rect11Over= false;
    rect12Over= false;
  } else if (overRect3 (rectX3, rectY3, rectSize, rectSize+20)) {
    rect1Over= false;
    rect2Over= false;
    rect3Over= true;
    rect4Over= false;
    rect5Over= false;
    rect6Over= false;
    rect7Over= false;
    rect8Over= false;
    rect9Over= false;
    rect10Over= false;
    rect11Over= false;
    rect12Over= false;
  } else if (overRect4 (rectX4, rectY4, rectSize, rectSize+20)) {
    rect1Over= false;
    rect2Over= false;
    rect3Over= false;
    rect4Over= true;
    rect5Over= false;
    rect6Over= false;
    rect7Over= false;
    rect8Over= false;
    rect9Over= false;
    rect10Over= false;
    rect11Over= false;
    rect12Over= false;
  }else if (overRect5 (rectX5, rectY5, rectSize, rectSize+20)) {
    rect1Over= false;
    rect2Over= false;
    rect3Over= false;
    rect4Over= false;
    rect5Over= true;
    rect6Over= false;
    rect7Over= false;
    rect8Over= false;
    rect9Over= false;
    rect10Over= false;
    rect11Over= false;
    rect12Over= false;
  } else if (overRect6 (rectX6, rectY6, rectSize, rectSize+20)) {
    rect1Over= false;
    rect2Over= false;
    rect3Over= false;
    rect4Over= false;
    rect5Over= false;
    rect6Over= true;
    rect7Over= false;
    rect8Over= false;
    rect9Over= false;
    rect10Over= false;
    rect11Over= false;
    rect12Over= false;
    } else if (overRect7 (rectX7, rectY7, rectSize, rectSize+20)) {
    rect1Over= false;
    rect2Over= false;
    rect3Over= false;
    rect4Over= false;
    rect5Over= false;
    rect6Over= false;
    rect7Over= true;
    rect8Over= false;
    rect9Over= false;
    rect10Over= false;
    rect11Over= false;
    rect12Over= false;
   } else if (overRect8 (rectX8, rectY8, rectSize, rectSize+20)) {
    rect1Over= false;
    rect2Over= false;
    rect3Over= false;
    rect4Over= false;
    rect5Over= false;
    rect6Over= false;
    rect7Over= false;
    rect8Over= true;
    rect9Over= false;
    rect10Over= false;
    rect11Over= false;
    rect12Over= false;
  } else if (overRect9 (rectX9, rectY9, rectSize, rectSize+20)) {
    rect1Over= false;
    rect2Over= false;
    rect3Over= false;
    rect4Over= false;
    rect5Over= false;
    rect6Over= false;
    rect7Over= false;
    rect8Over= false;
    rect9Over= true;
    rect10Over= false;
    rect11Over= false;
    rect12Over= false;
  } else if (overRect10 (rectX10, rectY10, rectSize, rectSize+20)) {
    rect1Over= false;
    rect2Over= false;
    rect3Over= false;
    rect4Over= false;
    rect5Over= false;
    rect6Over= false;
    rect7Over= false;
    rect8Over= false;
    rect9Over= false;
    rect10Over= true;
    rect11Over= false;
    rect12Over= false;
  } else if (overRect11 (rectX11, rectY11, rectSize, rectSize+20)) {
    rect1Over= false;
    rect2Over= false;
    rect3Over= false;
    rect4Over= false;
    rect5Over= false;
    rect6Over= false;
    rect7Over= false;
    rect8Over= false;
    rect9Over= false;
    rect10Over= false;
    rect11Over= true;
    rect12Over= false;
  } else if (overRect12 (rectX12, rectY12, rectSize, rectSize+20)) {
    rect1Over= false;
    rect2Over= false;
    rect3Over= false;
    rect4Over= false;
    rect5Over= false;
    rect6Over= false;
    rect7Over= false;
    rect8Over= false;
    rect9Over= false;
    rect10Over= false;
    rect11Over= false;
    rect12Over= true;
  }else {
    rect1Over = rect2Over = rect3Over = rect4Over = rect5Over = rect6Over= rect7Over = rect8Over = rect9Over = rect10Over = rect11Over = rect12Over =false;
  }
}

//Functions Setting Up Whether Mouse Is Over Timeline Notch
boolean overRect1 (int x, int y, int width, int height)
{
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}

boolean overRect2 (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}

boolean overRect3 (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}
boolean overRect4 (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}
boolean overRect5 (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}
boolean overRect6 (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}
boolean overRect7 (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}
boolean overRect8 (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}
boolean overRect9 (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}
boolean overRect10 (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}
boolean overRect11 (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}
boolean overRect12 (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}

