
/* 
rainbow gradient

with huge help from joseph lim (itp.nyu.edu/~jl3789/itpblog)


*/

int backgroundValue = 0;

int redValue = 255;
int blueValue = 0;
int greenValue = 0;

void setup(){
 size(800,450); 
}


void draw(){

background(redValue, greenValue, blueValue);
//start at red and go to yellow
 if( greenValue<255 && redValue==255 && blueValue==0){
   greenValue++;
  }
  
  //go from yellow to pure green
  if(greenValue == 255 && redValue>0){
    //redToGreen = false;
   redValue--; 
  }
  
  //go from green to cyan/bluish-green
  if(redValue==0 && greenValue==255 && blueValue<255){
  
    blueValue++;
  }
  
  //go from bluish-green to blue
  if(blueValue==255 && greenValue>0){
   greenValue--; 
  }
 // go from blue to violet
  if(redValue < 255 && greenValue==0 && blueValue==255){
    redValue++;
    
  }
  //go from violet to red
if(redValue == 255 && blueValue>0){
  blueValue--;
}
  

/*
print("R: ");
print(redValue);
print(" G: ");
print(greenValue);
print(" B: ");
println(blueValue);
*/
 }
 
   /*
 else if(backgroundValue==255){
   positiveIncrementation = false;
  
 }
 */
                
