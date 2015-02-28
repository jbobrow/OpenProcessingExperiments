
float x,y,x2,y2,angle,angle2;
 
void setup(){
  size(600,600);
  background(0);
  smooth();
  x = 5;
  y = 2;
  x2 = 0;
  y2 = 0;
  angle = 10;
  angle2 = 5;
     for (float x = 5; x < x2; x ++){
    for (float y = 2; y < y2; y ++){
       for (float x2 = 0; x2 < angle; x2 ++){
    for (float y2 = 0; y2 < angle2; y2 ++){
        }
       }
     }
    }
}
 
void draw(){
 
   
  x = cos(radians(angle2)) * width/2;
  y = cos(radians(angle)) * height/2;
  x2 = tan(radians(angle++)) * width/2;
  y2 = sin(radians(angle)) * height/2;
   
   
strokeWeight(.1);

 stroke(200,x,y/2,15);
 fill(x2,angle,y,.2);
 ellipse(0,height,angle*2,y2);
 ellipse(width,0,x2,.3);
 ellipse(300,300,x,angle2);
 ellipse(300,300,angle,.2);
 ellipse(0,300,x,y);
 ellipse(600,300,x,y);
 fill(136,x,y,.05);
 triangle(300,0,0,600,600,600);
 triangle(300,600,0,0,600,0);
 fill(130,120,x*y,.05);
 triangle(angle,300,x2,y2,angle,.05);
 
 noFill();
 beginShape();
 vertex(x2,504);
 vertex(300,y);
 vertex(angle,300);
 vertex(x*3,400);
 vertex(x,angle2);
 vertex(400,y*angle);
 endShape();
 
x++;
y++;
x2++;
y2++;
angle++;
angle2++;
  
}

//inspired by http://openprocessing.org/visuals/?visualID=53696

