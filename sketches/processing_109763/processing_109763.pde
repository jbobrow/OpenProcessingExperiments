
//The stripes are the five elements. They are changing into each other.
//And in each element there are seeds. And the seeds are windows.

color[] palette = {#D923A8,#2F0559,#0E0326,#F2A341,#D94E41};
int x = 0;
int y = 0;

void setup(){
  size(800, 800);
  background(palette[0]);
}

void draw(){
  // rectangles
  float counter=random(2);
  if (int(counter)==1){
    float r = random(0,5);
    strokeWeight(20);
    fill(palette[int(r)]);
    rect(x,y,width/5,height);
    x += width/5;
    if (x > width){
    x=0;
    }
  }
  //spheres
  int xc = width/5/2;
  
  strokeWeight(3);
  for (int z=5 ; z>0; z-=1){
    float r2 = random(0,5);
    fill(palette[int(r2)]);
    int yc = height/5/2;
      for (int g=5 ; g>0; g-=1){
        float r3 = random(0,5);
        fill(palette[int(r3)]);
        int w=80; int h=80;
        if (g==5 | g==1 | z==1 | z==5){w=120; h=120;}
        //if (g==4 | g==2){w=40; h=40;}
        if (g==3 & z==3){w=50; h=50;} 
        ellipse(xc,yc,random(w),random(h));
        yc+=height/5;
      }
    xc+=width/5;
  }
}


