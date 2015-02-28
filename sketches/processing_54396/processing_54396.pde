
float y=0.0; //position of y value
float a=0.0; 
void setup(){
  size(250,250); //background size
  background(#FFFFFF); //background colour
  rectMode(CENTER); //all rect centered
    noStroke();
}
 
void draw() {
  
  
  fill(255,56,56,5); //colour and opacity of rect
  rect(10,10+y,250,250); // direction shape is located and stretching to (+y rectangle growa on y axis
  
  fill(255,122,56,10); 
  rect(200,100+y,250,250); 
   
  fill(255,214,56,5);
  rect(400,200+y,250,250); 
  
  
  
  
  fill(255,56,56,10);
  rect(0,30,35+y,20); 
   
  fill(#164852,148); 
  rect(0,60,50-y,50); 
  
   fill(#25373A,50); 
  rect(0,100,50+y,50); 
  
  fill(#FFFFFF,10);
  rect(0,50+y,30,250); 
   
  
  if (y < 600) //if the value of y is smaller than 600
  {
    y+=1.5; // it will increase by 1.5
  } 
  else
  {
    y =0.0; //if y is bigger than 600, restrats at 0
  }

}

                
                
