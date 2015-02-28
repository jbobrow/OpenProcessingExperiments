

int data [] = {1,100, 250}; //loads data into an array

void setup (){
  background (0); // sets background to black
  size (800,600);
  smooth();
}
void draw (){
for (int i = 0 ; i < data. length; i++){//run data starting at zero and add1 every iteration
  float ellSize= map (data[i], 1, 250,0,100); // size of ellipse corresponds to the size of the variable, 0-100 is the desired range (porportionally)
  if (dist (mouseX,mouseY,i*150+100,100) <ellSize/2){
  fill(255,0,0);
  }else{
  fill(255);
  }
  ellipse(i*150+100,100,ellSize, ellSize);// ellipses are spaces 150 pixels arpart plus 100 
  }
}
    
                
                
