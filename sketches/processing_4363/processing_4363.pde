
//Nikolina Borak //Architectural Computing//ARCH1391//Module Two

//modification of Conic Colours by Charles Morrice 
//http://www.openprocessing.org/visuals/?visualID=2838

//name changing
  float MLoc;  
float Btline;  
int colourxy;  
  
void setup()  
{  
  //size changed
  size(600,400);
//colorMode changed  
  colorMode(RGB,54,25,25);  
  
}  
void draw()  
 
 
{  
  loadPixels();  
  for (int x=1;x<width;x=x+1){  
    for (int y=1;y<height;y=y+1){  
      //the base line
      Btline=sqrt(sq(height/1-y));     
//determining the sketch in relevance to the mouse location      
      MLoc=sqrt(sq(x-pmouseX)+sq(y-pmouseY));           
      float ratio=Btline/MLoc;    
//colour ratio and initial colur    
//code numbers changed along with the colourMode
      colourxy = color(int(ratio*30)%40,RGB,0,50);    
      pixels[(y-1)*width+(x+5)]=colourxy;                    
    }  
  }  
  updatePixels();  
  loop();  
}  
 


