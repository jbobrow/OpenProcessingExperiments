
/**
We are experimenting with a pixel logo for PhoneLabs
 */
 

PImage img;  // Declare variable "a" of type PImage
int dim = 10;


void setup() {
  size(351,71);
   frameRate(20);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("logo1.png");  // Load the image into the program  
}

void draw() {
  
  noStroke();

  // Displays the image at point (0, height/2) at half of its size
  image(img, 0, 0);
  
 for(int j = 0; j < 8 ; j++) {
    
      for(int i = 0; i < 37; i ++) {

        if(get(i*dim + int(dim*0.5), j*dim + int(dim*0.5)) > color(113))
        fill(255,255,255);
        else fill(123+random(6),113+random(6),189+random(6));
      
           rect(i*dim,j*dim,dim,dim);
      rect(i*dim+random(6), j*dim+random(4),dim,dim);
  
        }
            
}
    

}

 


