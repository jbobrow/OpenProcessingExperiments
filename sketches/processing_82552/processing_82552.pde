
void spiral ( float turns )
{
    float res = 50;
    
 
    for ( float i = 0; i <= (360*turns); i+=res )
    {
        

    
    pushMatrix();
          translate(width/2, height/2);  
          rotate(radians(angle)*2);  
          triangle(0, 0, 10, 10, random(pointillize), random(pointillize)); 
          rotate(radians(angle)*18); 
          triangle(0, 0, 10, 10, random(pointillize), random(pointillize));  
    popMatrix();
    
    
 angle = angle + 5;
    }
 

}


