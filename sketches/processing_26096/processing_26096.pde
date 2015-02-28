
//Melissa Hunt 2011

// Lesson Two Project
// Take your Lesson One design and rewrite it with variables instead of hard-coded values. 


//INTITIAL SETTINGS
void setup(){
  size (600,400);
}

//REPEAT INSTRUCTIONS
void draw (){
  if(mouseX<width/3){
    background(255);
  }else if(mouseX<2*width/3){
   background(153);   
  }
  else{
    background(0);
  }
  
}

