
size (800,600);
background (0); 
smooth(); 
noStroke();


float pointSize = 50; 


int numberPoins = 100;  


int numShapes = 10; 
int stepSize = (int) (height/ numShapes); 


for ( int h = 0; h < height; h = h + stepSize)
{
 
       stroke(random(11),random(224),random(137),60);
        
        for ( int i = 0; i < numberPoins; i = i +1)
        { 
          strokeWeight( random(pointSize)); 
          point (random(width), random(h,h+stepSize));
        }
    
    size(800,600);
smooth();
stroke(255,30);
for(int i=0;i<3;i=i+1){
  line(0,0,random(800),random(600));
}

stroke(255,30);
for(int i=0;i<3;i=i+1){
  line(800,600,random(800),random(600));
}

stroke(255,30);
for(int i=0;i<3;i=i+1){
  line(800,0,random(800),random(600));
}

stroke(255,30);
for(int i=0;i<3;i=i+1){
  line(0,600,random(800),random(600));
}
   

}



saveFrame("bolaselinhas.jpg");










