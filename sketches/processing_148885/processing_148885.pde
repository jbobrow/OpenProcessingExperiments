
PImage[] images = new PImage[13];
int index=1;
boolean isRunning;
boolean singleImage;


void setup(){
  for (int i = 1; i < (images.length); i ++ ) {
    images[i] = loadImage( "i" + i + ".jpg" );
  }
  frameRate(5);
  size(700,700);  
}

void draw(){
  background(255);
  imageMode(CENTER);
  if (mousePressed == true)
    {
      if(mouseButton == LEFT)
        {
          isRunning = true;
          singleImage = false;
          
        }
      if(mouseButton == RIGHT)
      {
        isRunning = false;
        //singleImage = false;
        index=1;
        image(images[index],350,350);
      }
    }
      
  if(isRunning == true)
    {      
      image(images[index],350,350);
      index++;
      if(index==13)
      {
        index=1;
      }
    }    
  if(keyPressed == true)
  {
    if (keyCode == RIGHT)
    {
      isRunning = false;
      singleImage = true;
      index++;
      if(index==13)
      {
        index=1;
      }
    }
    if (keyCode == LEFT)
    {
      isRunning = false;
      singleImage = true;
      index--;
      if(index==0)
      {
        index=13;
      }
    }
  }
  
  if(singleImage==true)
  {
    image(images[index],350,350);
  }
 int r = (int)random(0,2);
 if(r==0){fill(255);}
 else{fill(0);}
 for(int a = 0; a<700;a+=40){
   noStroke();
   rect(0+a,0,50,50);
   rect(0,0+a,50,50);
   rect(650,650-a,50,50);
   rect(650-a,650,50,50);
   }
}


