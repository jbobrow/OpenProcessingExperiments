
PImage universeImage;
PImage clockImage;
float xPos = 0;
float yPos = 200;
float redVel =5;
float blueVel =5;



void setup(){
  
  size (600,600);
  smooth();
  
  universeImage = loadImage("universe.jpg");
  clockImage = loadImage("clockAlpha.png");
  
  
}





void draw(){
  
  frameRate(60);
  background(40,40,40);
 
  
xPos += blueVel;

 
     
//    image(myImage, mouseX, mouseY, 600, 600);         // Mike Note: same size as image and moouse location at top left
      image(universeImage, mouseX-300, mouseY-300, 600, 600);  // Mike Note: same size as image and mouse location offset and centered at -300


//  for(int i = width; i > 20; i-=20){
//  float colorValue = map(i,0,600,0,255);
//  fill(255-colorValue,colorValue,255-colorValue);
//  strokeWeight(10);
//  stroke(i, 235,165,32);
//
//  
//  }
  
  
   

//  for(int i = width; i > 20; i-=20){
//  float colorValue = map(i,0,600,0,255);
//  fill(255-colorValue,colorValue,255-colorValue);
//  ellipse(i, 100, i/10, i/10);
////  line(0,0,600,600);
//  }
  
  
  for(int i = width; i > 50; i-=20){
  for(int j=0; j< height; j+=50)
  rect(i,j ,40,10);

}


    fill(13,0,125); // BLUE MINUTES Y
    ellipse(300, yPos-100, 180,180);
      
    fill(255,0,25);  //RED SECONDS X
    ellipse(xPos -5, 300, 90,90);       // Mike Note: TO CHANGE DIRECTION (xPos, 250, 90,90) + change yPos to xPos everywhere in code including global
        
    image(clockImage, 250, 450, 100,100);  // CLOCK IMAGE (pos,pos, size,size)
    



    if(xPos < 0 || xPos > width) {         // Mike Note: MAKE SURE you close your IF statements with curly bracket within curly
    
    yPos += redVel;
         

    if(yPos < 0 || yPos > height)
    

    redVel *= -1;
    blueVel *= -1;

  }
  


     
     

  
  
  
  
  
  
}

