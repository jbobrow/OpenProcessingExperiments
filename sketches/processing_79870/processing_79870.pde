
void setup() {
  size(320, 480);
 frameRate(1/2);

 
}

void draw() {

//background(255);
stroke(3);
strokeWeight(3);
//line(0,0,320,480);
//line(320,0,0,480);

int w = width;
int h = height;


int rx = random(w);
int ry = random(h);


fill(255*second()/60+30,255*minute()/60,0);
//quad(random(width),random(width),random(width),random(width),random(height),random(height),random(height),random(height));//
    
triangle(rx,ry,rx-10,ry+30,rx+10,ry+30);
line(rx,ry+30,rx,ry+30+30)

}
