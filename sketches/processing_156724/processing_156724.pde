

int diam = 100;


void setup() {
size(200,200);
fill(0);
}

void draw() 
{
 for(int i=diam/2; i<width; i+=diam)
  {
  for(int j=diam/2; j<height; j+=diam)
  {  

         float distance = dist(mouseX, mouseY, i, j); 
          if(mouseX<=diam/2)
            {
                fill(0);
                ellipse(i, j, diam, diam);
             }  
            else
            {
              fill(255);
              ellipse(i, j, diam, diam);
             }  


        }

}
}

