
size (800,600); 
background (255);  
smooth(); 
noStroke();


float pointSize = 3;

int numberPoins = 50000; 

int numShapes = 3; 
int stepSize = (int) (height/ numShapes); 

for ( int h = 0; h < height; h = h + stepSize)
{
 
       stroke(219,180,133);
      
        for ( int i = 0; i < numberPoins; i = i +1)
        { 
          strokeWeight( random(pointSize)); 
          point (random(width), random(h,h+stepSize));
        }
    
}


int stepSizeH = (int) (height/ numShapes); 
int stepSizeW = (int) (width/ numShapes); 


for ( int h = 0; h < height; h = h + stepSizeH)
{
  
  for ( int w = 0; w < width; w = w + stepSizeW)
  {
       stroke(154,183,201, random(50,255) );
      
        for ( int i = 0; i < numberPoins; i = i +1)
        { 
          strokeWeight( random(pointSize)); 
          point (random(w,w+stepSizeW), random(h,h+stepSizeH));
        }
    }
    
}



for ( int h = 0; h < height; h = h + stepSizeH)
{
  
  for ( int w = 0; w < width; w = w + stepSizeW)
  {
       stroke(0, random(50,255) );
      
        for ( int i = 0; i < numberPoins; i = i +1)
        { 
          strokeWeight( random(pointSize)); 
          point (random(w,w+stepSizeW), random(h,h+stepSizeH));
        }
    }
    
}


noStroke();
for (int y = 0; y <= height; y+=40) {
  for (int x = 0; x <= width; x += 40) {
    fill (170, 163, 139);
    ellipse (x, y, 40, 40);
  }
}

                
                
