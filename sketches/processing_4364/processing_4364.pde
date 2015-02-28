
//Nikolina Borak //Architectural Computing//ARCH1391//Module Two

//imodification of Conic Colours by Charles Morrice 
//http://www.openprocessing.org/visuals/?visualID=2838


  
  
 
float dpoint;  
float dline;  
int colourxy;  
  
void setup()  
{  
  size(400,400);  
  //changed colour mode
  colorMode(HSB,1000,200,20,100);  
}  
void draw()  
{  
  loadPixels();  
  for (int x=1;x<width;x=x+1){  
    for (int y=1;y<height;y=y+1){  
      dline=sqrt(sq(height/2-y));                        //calculate distance to fixed line (horizontal division)  
      dpoint=sqrt(sq(x-pmouseX)+sq(y-pmouseY));          //calculate distance to fixed point (mouse location)  
      float ratio=dline/dpoint;                          //ratio of distance to line/distance to point  
      
      //some code deleted
      
      colourxy = color(int(ratio*720)%360,100,100,100);  //calculates colour on scale 1-360 (fneeds to work for rations both < and > 1)  
      pixels[(y-1)*width+x]=colourxy;                    //sets pixel colour  
    }  
  }  
  updatePixels();  
  loop();  
}  
 


