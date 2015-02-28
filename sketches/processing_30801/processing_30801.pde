


// code art workshops interactive poster


// press space for grids, and r for rotation


// s.monslow  2011
int w,h;
float space,i;

void setup(){
  size(400,400);
  smooth();
  noCursor();
}


void draw(){
 
  fill(0,11);
  rect(0,0,width,height);
  w = width;
  h = height;
 if(key==' ') {
   i = 0;
   translate(0,0);
}
if ( key == 'r'){
  translate(width/2,height/2); 
  i+=0.01;
}

if ( mousePressed){
 save( random(1000)+".png"); 
}


  stroke(255);
  for  (int x=0;x<w;x+=1+space){
    rotate(i);
    line(x,0,x,h);
    rotate(i);
    line(x,0,x,h);
    rotate(i);
    line(0,x,w,x);

  }
  
  
noStroke();
fill(234,78,21);
rect(width-150,height-100,125,75);

    space = mouseX/4;
    
    
    fill(0);
    text("code art workshops",254,318);
    
}

