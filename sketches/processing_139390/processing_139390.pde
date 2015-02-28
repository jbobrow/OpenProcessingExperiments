
int i = 0;
int j = 0;

void setup(){
size (800,800); 

noStroke(); 



}

void draw(){

for (int i=0 ; i < width ; i = i+50){for (int j=0; j < height; j= j+50){fill(random(0,50));rect (mouseX,mouseY,50,50); }
}

for (int i=0 ; i < width ; i = i+50){for (int j=0; j < height; j= j+50){fill(random(0,50));rect (mouseY,mouseX,i,j); }
}

for (int i=0 ; i < width ; i = i+50){for (int j=0; j < height; j= j+50){fill(random(100,150));ellipse (mouseY,mouseX,random(10,50),random(10,50)); }
}


}




