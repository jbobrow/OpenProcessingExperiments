
void setup() {
  size(500, 500);
  smooth();
}

float a_radius = 100;
float a_angle = 0;
float a_x = cos(a_angle*PI/180)*a_radius;
float a_y = sin(a_angle*PI/180)*a_radius;


float t = 1.;
float x = 0;
float y = 0;
float tx = 10.;
float x2 = 10;
float y2 = 10;
float x3 = 40;
float y3 = 40;
float z = 0;

  
  void draw() {
        
    a_angle = a_angle + 2;
float a_x = cos(a_angle*PI/1800)*a_radius;
float a_y = sin(a_angle*PI/1800)*a_radius;

float x = map(noise(t), 0., 1., 0, width);
float y = map(noise(tx), 0., 1., 0, height);
float x2 = map(noise(t), 0., 1., 0, width);
float y2 = map(noise(tx), 0., 1., 0, height);
float x3 = map(noise(t), 0., 1., 0, height);
float y3 = map(noise(tx), 0., 1., 0, height);



   fill(255);
  rect(0,0,500, 500);

   fill(0,0,0,255);
    //noStroke();

strokeWeight(0.1);
stroke(0);
fill(255, 255, 255, 10);
 triangle(x-a_x, y-a_y, x+50+a_x, y+50+a_y, y+a_y, x+a_x);
 fill(255, 255, 255, 10);
 triangle(x-a_x, y-a_y, x+50+a_x, y+50+a_y, y+a_y*-2, x+a_x/-2);
 fill(255, 255, 255, 10);
 triangle(x-a_x, y-a_y, y+a_y, x+a_x, y+a_y*-2, x+a_x/-2);

fill(0);
textSize(15);
text("1", x-a_x+10, y-a_y+10); 
text("2", x+50+a_x, y+50+a_y); 
text("3", y+a_y, x+a_x);
text("4", y+a_y*-2, x+a_x/-2);


 noStroke();
  fill(0,0,0,55);
  
float r = 80;

 ellipse(x-a_x, y-a_y, r,r);
ellipse(x+50+a_x, y+50+a_y, r,r);
 ellipse(y+a_y, x+a_x, r,r);
 ellipse(y+a_y*-2, x+a_x/-2, r,r);
 
t += 0.001;
tx += 0.001;
z -= 0.0001; 

  }


