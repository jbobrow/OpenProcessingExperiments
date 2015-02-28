
int counter;

float r = 10;
float esp = 5;
float dist_1 = r+esp;
float dist_2 = 2*r+esp;


void setup() {  //setup function called initially, only once
  size(400, 400);
  background(100);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  
  background(255);
  
  for(int j = 0; j < height/dist_1; j++){
  
      for(int i = 0; i < width/dist_1; i++){
      
          noStroke();
          
          
          
              
              fill((i*j/2)%255, 100, 200, 100);
              ellipse(dist_1+i*dist_2, dist_1+j*dist_2, 2*r, 2*r);
          
      }
  
  }
  

  //  if(mousePressed){
    
       r += 0.05*sin(0.1*counter/PI);  
       
       
        
//    }

  counter++;
    
  
  
}
