
//Nalini Ramanathan nalinir Copyright
size(400, 400);
float x=width*.5;
float y=height*.4;
float z=width*.7;
float q=height*.4;

fill(255, 0, 0);
quad(x*.5, y*1.125, x*1.5, y*1.125, x*1.6, y*2, x*.4, y*2);
fill(255, 255, 255);
ellipse(x, y, z, q);
fill(255, 255, 0);
ellipse(x, y*.75, x*.125, y*.125);
fill(0, 0, 0);
ellipse(x*.9, y*.5, x*.075, y*.21875);
ellipse(x*1.1, y*.5, x*.075, y*.21875);


