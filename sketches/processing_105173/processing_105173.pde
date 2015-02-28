
int i = 0; //this is a variable that we'll use as a counter
 
 
void setup(){
  size(500,500);
 
} 
 
void draw(){ //loops once a frame
  background(255);

 i = i + 1; //here the counter increases by one each frame
  
 if (i>50 && mouseY >= height/2){ //when the counter gets over 50 then this is positive
   fill(random(255),random(255),random(255)); 
 }
  
  
 
  
 if (i>100){ //when the counter gets over 100 then this is positive
   fill(255);  //every 2D primitive will be WHITE if drawn now
   i=0;  //resets the counter to start the flashing loop over
 }
  rect(200,300,50,50);  //draw the square once a frame
  rect(300,400,35,35);
  rect(100,200,45,75);
  rect(80,60,155,75);
}
