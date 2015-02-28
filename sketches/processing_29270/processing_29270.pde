
int w=450;
int h =450;
boolean colourboard = true;
void setup(){
  size(450,450);
 
  smooth();
  inc=0; //kicker
  background(-1); 
  noStroke();
  int rectsize =40;//15
  if (colourboard){
    for (int x=7;x<w+rectsize;x+=rectsize){
      for (int xi=7;xi<w+rectsize;xi+=rectsize){
        fill(random(255),random(255),random(255));
        rect(x,xi,rectsize,rectsize);
      }
    }
  }
  if(inc>h){
    inc=0;
  }
}
int inc=0;
void draw(){

  // int inc=0;
  if(inc>h){
    inc=0;
    //filter(BLUR,1);
    noLoop(); 
  }
  for (float z=0;z<1.6;z+=.25){ //.25
    float i=tan(z);
    //*100;
    inc+=1;
    float cthru = 255*i;
    cthru=cthru/5;
    stroke(1,cthru);
    line(0,inc,w,inc);
    // stroke(-1,cthru);
    if(inc>h){
      inc=0;
    }
    line(inc,0,inc,h);
    //    stroke(cthru,cthru,255-cthru,cthru);
    //   line(inc,0,inc,h); 
  } 
  if(inc>h){
    inc=0;
  }
  for (float z=1.6;z>0;z-=.05){//.1 //.05
    float i=tan(z);
    //*100;
    inc+=1;
    float cthru = 255*i;
    cthru=cthru/5;
    stroke(1,cthru);

    line(0,inc,w,inc);
    //stroke(-1,cthru);
    line(inc,0,inc,h);
  } 
  //for(int x=0;x<w;x+=18){
  // line(0,x,w,x);
  //line(x,0,x,h); 
  //}
  //inc++; 
}


void keyPressed(){

  if(key=='r'){
    loop();
    setup();

  }
  //if(key=='c'){
  ////loop();
  //colourboard=!colourboard;setup();} 
}

                
