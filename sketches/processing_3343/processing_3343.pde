

float x,y,xz,yz,n,N,r,g,b,R,G,B;
void setup(){
  n=0;
  r=250;
  g=180;
  b=20;
  R=0;
  G=180;
  B=255;
  size(300,300);
  background(0);
  smooth();
}
void draw(){
  background(108, 17,63);
  circulos(); 
  lineas();
}
void circulos(){
  n+=0.029;
  N=noise(n);

  x=mouseX;
  y=mouseY;
  xz=-mouseX;
  yz=-mouseY;
//circulos
  rectMode(CENTER); 
  strokeWeight(3);
  stroke(R-15,G-15,B-15);
  fill(R,G,B,20*(N*19));
  ellipse(x,y,20*(N*3),20*(N*3)); 
  ellipse(xz+width,y,20*(N*3),20*(N*3));
  ellipse(xz+width,yz+height,20*(N*3),20*(N*3));
  ellipse(x,yz+height,20*(N*3),20*(N*3));
  ellipse(width/2,y,20*(N*3),20*(N*3));
  ellipse(x,height/2,20*(N*3),20*(N*3));
  ellipse(xz+width,height/2,20*(N*3),20*(N*3));
  ellipse(width/2,yz+height,20*(N*3),20*(N*3));
  //circulos de centro
  fill(r-29,g-29,b-29);
  ellipse(x,y,3,3); 
  ellipse(xz+width,y,3,3);
  ellipse(xz+width,yz+height,4,4);
  ellipse(x,yz+height,4,4);
  ellipse(width/2,y,4,4);
  ellipse(x,height/2,4,4);
  ellipse(xz+width,height/2,4,4);
  ellipse(width/2,yz+height,4,4);
}

void lineas(){
  
 
 strokeWeight(5);
  stroke(r-35,g-35,b-35); 
 line(x,y,20*(N*3),20*(N*3)); 
  line(xz+width,y,20*(N*3),20*(N*3));
  line(xz+width,yz+height,20*(N*3),20*(N*3));
  line(x,yz+height,20*(N*3),20*(N*3));
  line(width/2,y,20*(N*3),20*(N*3));
  line(x,height/2,20*(N*3),20*(N*3));
  line(xz+width,height/2,20*(N*3),20*(N*3));
  line(width/2,yz+height,20*(N*3),20*(N*3)); 
  
  strokeWeight(1);
  stroke(r+35,g+35,b+35);
  line(x,y,20*(N*3),20*(N*3)); 
  line(xz+width,y,20*(N*3),20*(N*3));
  line(xz+width,yz+height,20*(N*3),20*(N*3));
  line(x,yz+height,20*(N*3),20*(N*3));
  line(width/2,y,20*(N*3),20*(N*3));
  line(x,height/2,20*(N*3),20*(N*3));
  line(xz+width,height/2,20*(N*3),20*(N*3));
  line(width/2,yz+height,20*(N*3),20*(N*3));
  
}


