
//Hi Playgramming Class!
// This project shows you how to change the color of a 2D primitive over time.

int i = 0; //this is a variable that we'll use as a counter

void draw(){ //this loops once a frame
 i = i + 1; //here the counter increases by one each frame
 
 if (i>50){ //when the counter gets over 50 then this is positive
   fill(255,0,0); //every 2D primitive will be RED if drawn now
 }
 
 if (i>100){ //when the counter gets over 100 then this is positive
   fill(255);  //every 2D primitive will be WHITE if drawn now
   i=0;  //resets the counter to start the flashing loop over
 }
  rect(25,25,50,50);  //draw the square once a frame
}

