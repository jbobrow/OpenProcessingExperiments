
//Brennda 
void setup(){
size(200,200);
background(255);}
void draw() {
  int ex=2;
  int ladox=(width-7*ex)/8;
  int x=0;
  for(x=0; x<200; x+=25)
  for(int y=0; y<200; y+=25){
    rect(x,y,ladox,ladox);
  }
fill(#FA9292);
rect(2*(ladox+ex), 0*(ladox+ex),ladox,ladox);
rect(3*(ladox+ex), 0*(ladox+ex),ladox,ladox);
rect(4*(ladox+ex), 0*(ladox+ex),ladox,ladox);
rect(5*(ladox+ex), 0*(ladox+ex),ladox,ladox);
rect(2*(ladox+ex), 0*(ladox+ex),ladox,ladox);
rect(1*(ladox+ex), 1*(ladox+ex),ladox,ladox);
rect(0*(ladox+ex), 2*(ladox+ex),ladox,ladox);
rect(0*(ladox+ex), 3*(ladox+ex),ladox,ladox);
rect(0*(ladox+ex), 4*(ladox+ex),ladox,ladox);
rect(0*(ladox+ex), 5*(ladox+ex),ladox,ladox);
rect(1*(ladox+ex), 6*(ladox+ex),ladox,ladox);
rect(2*(ladox+ex), 7*(ladox+ex),ladox,ladox);
rect(3*(ladox+ex), 7*(ladox+ex),ladox,ladox);
rect(4*(ladox+ex), 7*(ladox+ex),ladox,ladox);
rect(5*(ladox+ex), 7*(ladox+ex),ladox,ladox);
rect(6*(ladox+ex), 6*(ladox+ex),ladox,ladox);
rect(7*(ladox+ex), 5*(ladox+ex),ladox,ladox);
rect(7*(ladox+ex), 4*(ladox+ex),ladox,ladox);
rect(7*(ladox+ex), 3*(ladox+ex),ladox,ladox);
rect(7*(ladox+ex), 2*(ladox+ex),ladox,ladox);
rect(6*(ladox+ex), 1*(ladox+ex),ladox,ladox);
fill(#F05555);
rect(2*(ladox+ex), 2*(ladox+ex),ladox,ladox);
rect(1*(ladox+ex), 3*(ladox+ex),ladox,ladox);
rect(1*(ladox+ex), 4*(ladox+ex),ladox,ladox);
rect(2*(ladox+ex), 5*(ladox+ex),ladox,ladox);
rect(5*(ladox+ex), 2*(ladox+ex),ladox,ladox);
rect(6*(ladox+ex), 3*(ladox+ex),ladox,ladox);
rect(6*(ladox+ex), 4*(ladox+ex),ladox,ladox);
rect(5*(ladox+ex), 5*(ladox+ex),ladox,ladox);
fill(#FF1C1C);
rect(3*(ladox+ex), 3*(ladox+ex),ladox,ladox);
rect(4*(ladox+ex), 3*(ladox+ex),ladox,ladox);
rect(3*(ladox+ex), 4*(ladox+ex),ladox,ladox);
rect(4*(ladox+ex), 4*(ladox+ex),ladox,ladox);
noLoop();
    
    
}
