
//Elizabeth Ibarra
//Midterm2


float x,y,z;

void setup(){
  size(600,600);
  background(255);
  x = 0;
  y = 0;
  z = 0;
  smooth();
     for (float x = 0; x < z; x ++){
    for (float y = 0; y < z; y ++){
}
     }
}

void draw(){

 
      
    
  
  x = tan(radians(z)) * width;
  y = cos(radians(z)) * height;
  z = sin(radians(y)) * 600;
  
  

strokeWeight(.5);
 
 stroke(200,x,z,20);
 fill(z,255,x,.9);
 ellipse(0,600,x,z);
 ellipse(600,0,x,z);
 ellipse(300,300,x,z);

 x++;
y++;
 z++;
 
 }


