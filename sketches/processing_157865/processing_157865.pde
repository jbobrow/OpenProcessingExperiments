

//We are experimenting with a pixel logo for PhoneLabs

PImage img; 
int dim = 10;
float t = 0;

void setup() 
{
  size(351, 71);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("logo1.png");  // Load the image into the program  
  
   noStroke();
}



void draw() 
{ 
 background(255); // clear the background
 
 for(int j = 0; j < 8 ; j++) 
 {
      for(int i = 0; i < 37; i ++) 
      {
        //there was no need to draw the image first. you can just call .get on a PImage        
        if(img.get(i*dim + int(dim*0.5), j*dim + int(dim*0.5)) > color(113))
        {
            fill(255);
        }
        else 
        {
            //the fill color isn't changed, so we take some scaled noise and apply it to the alpha channel
            //note that i didn't scale it too much, or the "blocks" would become hard to distinguish.
            fill(123,113,189,abs(noise(t/50, i/5, j/10)*255));
        }
        
        rect(i*dim, j*dim,dim,dim);
      } 
 }
 
 //in order for our noise to change over time, we need to keep track of time passing ourselves.
 t+=1;  
    

}

 
