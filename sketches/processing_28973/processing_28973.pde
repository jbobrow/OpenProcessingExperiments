
int w=256;
int h=256;
void setup(){
  size(256,256); 

  smooth(); 
  line(1,0,w,0);
  line(0,0,0,h-1);
  background(-1);
  stroke(1);
  line(0,h-1,w,h-1);
  line(width-1,0,width-1,height);
  for (int x=1;x<8;x++){

    line(0,15*(8-x),15*x,0);
    line(0,height-(15*(8-x)),15*x,height);

    line(width,15*(8-x),width-(15*x),0);
    line(width,height-(15*(8-x)),width-(15*x),height);
  }
  noFill();

  rect(1,1,width,height);

  //frameRate(25);
}
int take = 8;//8
int space = 5;
void draw(){
 
  space = int(mouseX/5);
  if(space<5)space=5;  
  background(-1); 
  for  (int x=0;x<w;x+=15){
    line(x,0,x,h/2);
    line(x,h/2,x,h);
    line(0,x,w/2,x);
    line(w/2,x,w,x);
  } 

  line(0,0,w,0);
  line(0,0,0,h-1);
 
  stroke(1);
  line(0,h-1,w,h-1);
  line(width-1,0,w-1,h);
  for (int x=1;x<take;x++){

    linex(0,space*(8-x),space*x,0);
    linex(0,h-(space*(8-x)),space*x,h);

    linex(w,space*(8-x),w-(space*x),0);
    linex(w,h-(space*(8-x)),w-(space*x),h);
  }
  rect(0,0,w-1,h-1);
  ellipseMode(CENTER);
  fill(255,0,0);


  noFill();
  ellipseMode(CENTER);
  ellipse(95,95,5,5);
  line(95-5,95-5,95+5,95+5);
  line(95-5,95+5,95+5,95-5);

  
}

void linex (float a,float b,float c,float d){
  line(a,b,c,d);
  noFill();
  ellipse((a+c)/2,(b+d)/2,6,6); 
}
                
