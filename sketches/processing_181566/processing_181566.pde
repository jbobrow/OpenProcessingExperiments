
/*
Hart Boyd
Design 479
Exercise 3 Done in 60 Seconds
*/

float angle = 0;
float offset = 0;
float scalar = 36;
float speed = .1;
int time = 0;
int startTime; //set start time
float e1y = 125; //position for Spin 1Y, Sprin 2Y, and Spin 3X ellipse
float e4x = 425; //position for Spin 4X ellipse

void setup() {
  size(550, 550);
  smooth();
  startTime = millis();
  frameRate(10);
  background (0);
}


void draw() {
  if (time % 1 == 0){                              //set time rate
  }
  
// Spin 1 (top)
  if(time >= 000 && time < 500){                    //set time range
   float x = offset + cos(angle) * scalar;           //set movement for x position
   float y = offset + sin(angle) * scalar;           //set movement for y position
   fill(255);                                        //fill white
   ellipse(x+width/2, y+height-height+e1y, 50, 50);  //draw cicle
   angle += speed;                                   //set angle
  }                                                 //close Spin 1 (top)
  
//Spin 2 (bottom)
  if(time >= 100 && time < 500){                    //set time range
   float x = offset + cos(angle) * scalar;           //set movement for x position
   float y = offset + sin(angle) * scalar;           //set movement for y position
   fill(255);                                        //fill white
   ellipse(x+width/2, y+height-e1y, 50, 50);         //draw circle
   angle += speed;                                   //set angle
  }                                                 //close Spin 2 (bottom)
  
//Spin 3 (left)
  if(time >= 200 && time < 500){                    //set time range
   float x = offset + cos(-angle) * scalar;          //set movement for x position (negative)
   float y = offset + sin(-angle) * scalar;          //set movement for y position (negative)
   fill(255);                                        //fill white
   ellipse(x+e1y,y+height/2,50,50);                  //draw circle
   angle += speed;                                   //set angle
  }                                                 //close Spin 3 (left)
  
//Spin 4 (right)
  if(time >= 300 && time < 500){                    //set time range
   float x = offset + cos(-angle) * scalar;          //set movement for x position (negative)
   float y = offset + sin(-angle) * scalar;          //set movement for y position (negative)
   fill(255);                                        //fill white
   ellipse(x+e4x, y+height/2, 50, 50);               //draw circle
   angle += speed;                                   //set angle
  }                                                 //close Spin 4 (right)
  
//Spin 5 (center)
  if(time >= 400 && time < 500){                   //set time range
   float x = offset + cos(angle-10) * scalar;        //set movement for x position (negative & offset)
   float y = offset + sin(angle-10) * scalar;        //set movement for y position (negative & offset)
   fill (255);                                       //fill white
   ellipse(x+width/2, y+height/2, 50, 50);           //draw circle
   angle += speed;                                   //set speed
   scalar += speed;                                  //set expansion
  }                                                //close part 1
  if(time >= 400 && time < 500){                   //set time range part 2
   float x = offset + cos(-angle-10) * scalar;       //set movement for x position (negative & offset)
   float y = offset + sin(-angle-10) * scalar;       //set movement for y position (negative & offset)
   angle += speed;                                   //set angle
   scalar += speed;                                  //set expansion
  }                                                //close part 2
  if(time >= 400 && time < 500){                   //set time range part 3
   float x = offset + cos(angle) * scalar;           //set movement for x position
   float y = offset + sin(angle) * scalar;           //set movement for y position
   fill (255);                                       //fill white
   ellipse(x+width/2, y+height/2, 50, 50);           //draw circle
   angle += speed;                                   //set angle
   scalar += speed;                                  //set expansion
  }                                                //close part 3
  if(time >= 400 && time < 500){                   //set time range part 4
   float x = offset + cos(-angle) * scalar;          //set movement for x position (negative)
   float y = offset + sin(-angle) * scalar;          //set movement for y position (negative)
   fill (255);                                       //fill white
   ellipse(x+width/2, y+height/2, 50, 50);           //draw circle
   angle += speed;                                   //set angle
   scalar += speed;                                  //set expansion
  }                                                //close Spin 5 (center)
  
//Spin 6 (blackout) 
  if(time >= 500 && time < 600){                   //set time range
   float x = offset + cos(-angle-12) * scalar;       //set x position
   float y = offset + sin(-angle-12) * scalar;       //set y position
   fill (0);                                         //fill black
   stroke(255);                                      //stroke white
   ellipse(x+width/2, y+height-e1y, 50, 50);         //1   
   ellipse(x+width/2, y+height-height+e1y, 50, 50);  //2
   ellipse(x+e1y,y+height/2,50,50);                  //3
   ellipse(x+e4x, y+height/2, 50, 50);               //4
   ellipse(x+width/2, y+height/2, 50, 50);           //5
   angle += speed;                                   //set angle
  }                                                //close part 1
  if(time >= 500 && time < 600){                   //set time range part 2
   float x = offset + cos(angle) * scalar;           //set x position
   float y = offset + sin(angle) * scalar;           //set y position
   fill (0);                                         //fill black
   stroke (255);                                     //stroke white
   ellipse(x+width/2, y+height-e1y, 50, 50);         //1
   ellipse(x+width/2, y+height-height+e1y, 50, 50);  //2
   ellipse(x+e1y,y+height/2,50,50);                  //3
   ellipse(x+e4x, y+height/2, 50, 50);               //4
   ellipse(x+width/2, y+height/2, 50, 50);           //5
   angle += speed;                                   //set speed
  }                                                //close Spin 6 (blackout)
  
  time++;                                            //advance time
}                                                  //close draw


