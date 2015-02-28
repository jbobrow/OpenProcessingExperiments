

float angle;
float jitter;
PImage img;
PImage img0;
PImage img1;

int i=0;





Maxim maxi;
AudioPlayer player;


void setup() {
 
  
  img= loadImage("siwmass.png");
  img0= loadImage("siwmass1.png");
  img1= loadImage("whiskas1.png");
  size(640, 360);
  noStroke();
  fill(255);
  rectMode(CENTER);
  
  maxi = new Maxim(this);
  player = maxi.loadFile("kittenbig.wav");
  player.setLooping(true);
  

  
}

void draw() {
// background(map((sqrt(  (width/2)*(width/2) + (height/2)*(height/2)  )) - dist(mouseX,mouseY,width/2,height/2),0,sqrt(  (width/2)*(width/2) + (height/2)*(height/2)  ),255,0));
// background(255);

 
 float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, width, 0, 255);
  float green = dist(mouseX,mouseY,width/2,height/2);
  
  player.play();
  
       player.volume(map((sqrt(  (width/2)*(width/2) + (height/2)*(height/2)  )) - dist(mouseX,mouseY,width/2,height/2),0,sqrt(  (width/2)*(width/2) + (height/2)*(height/2)  ),0,1));
        player.speed(map((sqrt(  (width/2)*(width/2) + (height/2)*(height/2)  )) - dist(mouseX,mouseY,width/2,height/2),0,sqrt(  (width/2)*(width/2) + (height/2)*(height/2)  ),0.5,1.8));
  
  
   
  background(red,green,blue);

  
  pushMatrix();
  noTint();
  
//  float c = cos(angle);
  translate(width/2, height/2);
  

  
  if(mouseX<((width/2)-img.width/2))
  {
  rotate(radians(((float) (height-mouseY) / height)*180));
  
  }
   if(mouseX>((width/2))+img.width/2)
  {
  rotate(radians(     (( (float) (mouseY) / height)   *    180 ) +180)   );
  
  }
  
  if ( (mouseX>((width/2))-img.width/2) && (mouseX<((width/2)+img.width/2)) )
  {
      if (mouseY<height/2)
    
     rotate(radians (map(mouseX, (width/2)-(img.width)/2, width/2, map(height/2-mouseY,0,height/2,150,180), 180)));
      
     if (mouseY>height/2)
     {
      if (mouseX<width/2)
       rotate(radians((((float) (width-mouseX) - (  (width/2)-img.width/2 ))  / (img.width/2) ) *( 23 *  ( height/2 -   ((float) mouseY - height/2)   ) /  ((height/2) - (img.height/2))  )  )); 
      if (mouseX>width/2)
       rotate(radians((((float) (width-mouseX) - (width/2 ))  / (img.width/2) ) * ( 23 *  ( height/2 -   ((float) mouseY - height/2)   ) /  ((height/2) - (img.height/2))  )  )); 
      
     }  
  }
  
  
  if(i<=80)
  {
  image(img, -((img.width)/2), -((img.height)/2) );
  i++;
  }
  if(i>80)
  {
  image(img0, -((img.width)/2), -((img.height)/2) );
  i++;
    if(i>100)
    {
    i=0;
    }
  }
  popMatrix();
  
 // image(img1, mouseX, mouseY, -(img1.width/2),-(img.height/2) );
 //  tint(255, 126); 
   image(img1, mouseX-(img1.width/2.5),mouseY-(img1.height/4),img1.width/2,img1.height/2);
  
     
}




