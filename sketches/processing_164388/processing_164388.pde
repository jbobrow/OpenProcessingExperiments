
int [] myNumbers = {
  20,
  50,
  72,
  181,
  196
};

int y = 10;     // start position of the bars
float w;        // width of the bars
 
 
void setup(){
   
  size(500,500);
  background(200);
 
  // check the data is contained properly
  for(int i=0; i<myNumbers.length; i++){
   println(" - "+ myNumbers[i]);
  }
   
  int y = 20;    
  for(int i=0; i<myNumbers.length; i++){
 
    w = map(myNumbers[i], 20,196,0,height - 50);
    fill(0);
    rect(0,y,w,20);
     
   
    
     
    y+=30;  
  }
   
}
 
 
void draw(){
}



