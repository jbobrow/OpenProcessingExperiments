
//Rose Curve
//r = cos(k@)
// k = n/d
//Polar to Cartesian: x = rcos@, y = rsin@

float xpos,ypos;
float n,d,k,theta;

void setup(){

    size(600,400);
    background(0);
    //noFill();
    //noLoop();
    stroke(255);
    strokeWeight(3);
    frameRate(25);
    
    n = 1;
    d = 7;
    k = 7;
    theta = 0;

}//end of setup

void draw(){
    //rect(30,30,40,40);
    background(0);
       //k = (int)mouseX;
   k++;
    for(theta = 0; theta < 6.1456778; theta += 0.006){
        
        float r = cos((k * theta));
        xpos = 180 * r * cos((theta) + 10) ;
        ypos = 180 * r * sin((theta) + 10) ;
        stroke(255 - theta, 255 - xpos , 255 - ypos , 100 - theta);
        ellipse(xpos + width/2 , ypos + height/2 , 1 , 1);
        //k += 1; 
        //k++;
        //theta += 0.006;
    }

}//end of draw
