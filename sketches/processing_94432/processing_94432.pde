
//Brennda e Daniela Meira (em aula)
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


fill(#F52C2C);
rect(4*(ladox+ex), 3*(ladox+ex),ladox,ladox);
    noLoop();
    
}
