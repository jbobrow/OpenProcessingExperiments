
//Copyright Leslie Bloomfield lbloomfi homework #9


PImage[] images = new PImage[20];
String [] words = {
  "so cool", "happy day", "spring has sprung", "i'm cute",
  "you're cute", "yummy yum", "pink is my favorite color", "wanna hang?",
  "~*~*~", "i heart bois", "hi", "hey", "don't be grumpy", "don't be sad", 
  "be nice to all human beans", "hey squirrel frands", "so scandalous!", 
  "ribbit", "yip yip", "just girly things"
};



 
void setup() {
  background(255);
  textSize(14);
  size(400,400);


   for ( int i = 0; i< images.length; i++ )
   {
    images[i] = loadImage( i + ".gif" );
  }
}
 
void draw() {  
}



void mouseClicked() {

  float imageRotate= random(-90,90);
  float imageX = random(0,390);
  float imageY = random(0,390); 


  pushMatrix();
  translate(imageX, imageY);
  rotate(radians(imageRotate));
  image(images[int(random(20))], 0, 0);
  popMatrix();
 
 
 
}

void keyPressed() {
  if(key == ' ')
  {
    background(255);
  }
  
  if(key == 'x')
  {
    
    float wordsRotate= random(-45,45);
    float wordsX = random(0, width - 10);
    float wordsY = random(0, height - 10); 


    pushMatrix();
    translate(wordsX, wordsY);
    rotate(radians(wordsRotate));
    fill(255, 5, 130);
    text(words[int(random(20))], 0, 0);
    popMatrix();
  

  }
  
}  




