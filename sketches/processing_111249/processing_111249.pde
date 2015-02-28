
void setup(){
  //this function will set up the image size 
  //and the background colour
  size(600,600);
  background(random(255));
}

void draw(){

  int k = 0; //declares variable
  for(int i=0; i<60;i++){ //loops from 1 to 60
    stroke(random(255),random(255),random(255)); //randomizes line colour
    line((0+k),0,600,600); // the lines
    k = k+10; //changes line coordinates
  }
  
  int h = 0;
  
  for(int d=0; d<120;d++){   
    fill(random(255),random(255),random(255)); //randomizes fill colour
     ellipse((100+h),(300+h), (120-h),(120-h));  //draws ellipses
    h = h+1; //changes space between ellipses
  }
    
  
if (k==600){
  stop(); //this section of code is used to stop the 
} //colours changing after the lines have been drawn

  
}




