
float x,y,x2,z,angle;
 
void setup(){
  size(600,600);
  background(0);
  smooth();
  x = 5;
  y = 2;
 z = 0;
  angle = 10;
 
     for (float x = 5; x < z; x ++){
    for (float y = 2; y < height; y ++){
       for (float z = 0; x < angle; z ++){
    
       }
     }
    }
}
 
void draw(){
 
   
  x = cos(radians(angle)) * width/2;
  y = cos(radians(angle)) * height/2;
 z = tan(radians(angle++)) * width/2;
 
   
   
strokeWeight(.05);

 stroke(200,x,y/2,10);
 fill(x,angle,y,.2);
ellipse(x,y,angle,300);
ellipse(y,x,angle,300);
 ellipse(300,300,x,angle);
ellipse(150,300,z,y);
ellipse(450,300,z,y);
 ellipse(0,300,x,y);
 ellipse(600,300,x,y);
 ellipse(300,300,x,y);
 

 
 
 
x++;
y++;
z++;
angle++;

  
}

//inspired by http://openprocessing.org/visuals/?visualID=53696

