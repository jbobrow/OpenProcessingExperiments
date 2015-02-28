

PImage myImage; //name for loading an image

void setup(){
    size (500,500);
    
    myImage = loadImage( "clock.jpg"); 
   
      
    for ( int counter = 0; counter < 360 ; counter += 2)//creeert getallen 360 delen door 20, hoe lager hoe meer images
    
    { float forInSineCosine = float (counter) /360.0 * 2 * PI;
    
    float midPointX = width /2;
    float midPointY = height /2;
    
    float myRadiusX = 200;
    float myRadiusY = 200;
    
    }   
    
    drawClock( 80, 80, 50, 50);
    drawClock( 200, 200, 100, 100);
    drawClock( 400, 400, 150, 150);

    }
    
void drawClock ( float midPointX, float midPointY, float myRadiusX, float myRadiusY ){
    
    
    for ( int counter = 0; counter < 360 ; counter += 2){//creeert getallen 360 delen door 20, hoe lager hoe meer images
    {
    float forInSineCosine = float (counter) /360.0 * 2 * PI;
    
    float x = midPointX + myRadiusX * sin (forInSineCosine );
    float y = midPointY + myRadiusY * cos ( forInSineCosine );// creates a circle 
    
    pushMatrix (); // isolate the rotation per image
    translate (x, y);
    rotate( -forInSineCosine );
    float widthImage = random(0,100);
    float heightImage = random (0,100);
    translate ( - widthImage/2, - heightImage/2);// codes float hierboven
        
    image ( myImage, 0, 0, widthImage, heightImage ); //codes float hierboven
    
    popMatrix(); 
    } 
}
} 


void draw(){
  
}

