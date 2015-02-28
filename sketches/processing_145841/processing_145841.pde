
int height = 500;
int width = 1000;
double start = 2.9;
double finish = 4.0;
int startiter = 1000;
int plotiter = 1000;

int i;

void setup() {  
  size(width, height);
  background(255); 
  i = 0;
}

void draw() { 
    if(i < width) {
        r = start + i*(finish - start)/width;
        x = 0.5;
        for(int j = 0; j < startiter; j++) x = r*x*(1-x);
        for(int j = 0; j < plotiter; j++) {
            x = r*x*(1-x);
            point(i, int(height*x));
        } 
    } else {
        noLoop();
    }
    i++;
}
