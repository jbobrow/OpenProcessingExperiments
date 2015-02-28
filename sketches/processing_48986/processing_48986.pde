
//define colors
color black = color(0,0,0);
color white = color(255,255,255);
color skin = color(251,219,123);
color lightBlue = color(0,120,248);
color lightGreen = color(0,235,219);

//create image
PImage helmetlessMegaman = createImage(21,24,ARGB);

void setup() {

  noSmooth();  
  size(240,240);
  background(100);
  
  helmetlessMegaman.loadPixels();
  
    //draw black pixels
    helmetlessMegaman.pixels[8+0*21] = black;
    helmetlessMegaman.pixels[9+0*21] = black;
    helmetlessMegaman.pixels[10+0*21] = black;
    helmetlessMegaman.pixels[11+0*21] = black;
    
    helmetlessMegaman.pixels[4+1*21] = black;
    helmetlessMegaman.pixels[6+1*21] = black;
    helmetlessMegaman.pixels[7+1*21] = black;
    helmetlessMegaman.pixels[8+1*21] = black;
    helmetlessMegaman.pixels[9+1*21] = black;
    helmetlessMegaman.pixels[10+1*21] = black;
    helmetlessMegaman.pixels[11+1*21] = black;
    helmetlessMegaman.pixels[12+1*21] = black;
    helmetlessMegaman.pixels[13+1*21] = black;
    
    helmetlessMegaman.pixels[3+2*21] = black;
    helmetlessMegaman.pixels[4+2*21] = black;
    helmetlessMegaman.pixels[5+2*21] = black;
    helmetlessMegaman.pixels[6+2*21] = black;
    helmetlessMegaman.pixels[7+2*21] = black;
    helmetlessMegaman.pixels[8+2*21] = black;
    helmetlessMegaman.pixels[9+2*21] = black;
    helmetlessMegaman.pixels[10+2*21] = black;
    helmetlessMegaman.pixels[11+2*21] = black;
    helmetlessMegaman.pixels[12+2*21] = black;
    helmetlessMegaman.pixels[13+2*21] = black;
    helmetlessMegaman.pixels[14+2*21] = black;
    helmetlessMegaman.pixels[15+2*21] = black;
    helmetlessMegaman.pixels[16+2*21] = black;
    
    helmetlessMegaman.pixels[3+3*21] = black;
    helmetlessMegaman.pixels[4+3*21] = black;
    helmetlessMegaman.pixels[5+3*21] = black;
    helmetlessMegaman.pixels[6+3*21] = black;
    helmetlessMegaman.pixels[7+3*21] = black;
    helmetlessMegaman.pixels[8+3*21] = black;
    helmetlessMegaman.pixels[9+3*21] = black;
    helmetlessMegaman.pixels[10+3*21] = black;
    helmetlessMegaman.pixels[11+3*21] = black;
    helmetlessMegaman.pixels[12+3*21] = black;
    helmetlessMegaman.pixels[13+3*21] = black;
    helmetlessMegaman.pixels[14+3*21] = black;
    helmetlessMegaman.pixels[15+3*21] = black;
    
    helmetlessMegaman.pixels[4+4*21] = black;
    helmetlessMegaman.pixels[5+4*21] = black;
    helmetlessMegaman.pixels[6+4*21] = black;
    helmetlessMegaman.pixels[7+4*21] = black;
    helmetlessMegaman.pixels[8+4*21] = black;
    helmetlessMegaman.pixels[9+4*21] = black;
    helmetlessMegaman.pixels[10+4*21] = black;
    helmetlessMegaman.pixels[11+4*21] = black;
    helmetlessMegaman.pixels[12+4*21] = black;
    helmetlessMegaman.pixels[13+4*21] = black;
    helmetlessMegaman.pixels[14+4*21] = black;
    helmetlessMegaman.pixels[15+4*21] = black;
    helmetlessMegaman.pixels[16+4*21] = black;
    helmetlessMegaman.pixels[17+4*21] = black;
    
    helmetlessMegaman.pixels[3+5*21] = black;
    helmetlessMegaman.pixels[4+5*21] = black;
    helmetlessMegaman.pixels[5+5*21] = black;
    helmetlessMegaman.pixels[6+5*21] = black;
    helmetlessMegaman.pixels[8+5*21] = black;
    helmetlessMegaman.pixels[9+5*21] = black;
    helmetlessMegaman.pixels[11+5*21] = black;
    helmetlessMegaman.pixels[12+5*21] = black;
    helmetlessMegaman.pixels[13+5*21] = black;
    helmetlessMegaman.pixels[15+5*21] = black;
    helmetlessMegaman.pixels[16+5*21] = black;
    
    helmetlessMegaman.pixels[3+6*21] = black;
    helmetlessMegaman.pixels[4+6*21] = black;
    helmetlessMegaman.pixels[12+6*21] = black;
    helmetlessMegaman.pixels[13+6*21] = black;
    helmetlessMegaman.pixels[15+6*21] = black;
    helmetlessMegaman.pixels[16+6*21] = black;
    helmetlessMegaman.pixels[17+6*21] = black;
    
    helmetlessMegaman.pixels[4+7*21] = black;
    helmetlessMegaman.pixels[6+7*21] = black;
    helmetlessMegaman.pixels[8+7*21] = black;
    helmetlessMegaman.pixels[9+7*21] = black;
    helmetlessMegaman.pixels[12+7*21] = black;
    helmetlessMegaman.pixels[13+7*21] = black;
    helmetlessMegaman.pixels[15+7*21] = black;
    helmetlessMegaman.pixels[16+7*21] = black;
    
    helmetlessMegaman.pixels[4+8*21] = black;
    helmetlessMegaman.pixels[6+8*21] = black;
    helmetlessMegaman.pixels[8+8*21] = black;
    helmetlessMegaman.pixels[9+8*21] = black;
    helmetlessMegaman.pixels[14+8*21] = black;
    helmetlessMegaman.pixels[15+8*21] = black;
    
    helmetlessMegaman.pixels[4+9*21] = black;
    helmetlessMegaman.pixels[14+9*21] = black;
    helmetlessMegaman.pixels[15+9*21] = black;
    
    helmetlessMegaman.pixels[3+10*21] = black;
    helmetlessMegaman.pixels[4+10*21] = black;
    helmetlessMegaman.pixels[5+10*21] = black;
    helmetlessMegaman.pixels[7+10*21] = black;
    helmetlessMegaman.pixels[8+10*21] = black;
    helmetlessMegaman.pixels[9+10*21] = black;
    helmetlessMegaman.pixels[10+10*21] = black;
    helmetlessMegaman.pixels[13+10*21] = black;
    helmetlessMegaman.pixels[16+10*21] = black;
    helmetlessMegaman.pixels[17+10*21] = black;
    
    helmetlessMegaman.pixels[2+11*21] = black;
    helmetlessMegaman.pixels[6+11*21] = black;
    helmetlessMegaman.pixels[12+11*21] = black;
    helmetlessMegaman.pixels[18+11*21] = black;
    
    helmetlessMegaman.pixels[2+12*21] = black;
    helmetlessMegaman.pixels[7+12*21] = black;
    helmetlessMegaman.pixels[8+12*21] = black;
    helmetlessMegaman.pixels[9+12*21] = black;
    helmetlessMegaman.pixels[10+12*21] = black;
    helmetlessMegaman.pixels[11+12*21] = black;
    helmetlessMegaman.pixels[18+12*21] = black;
    
    helmetlessMegaman.pixels[1+13*21] = black;
    helmetlessMegaman.pixels[6+13*21] = black;
    helmetlessMegaman.pixels[14+13*21] = black;
    helmetlessMegaman.pixels[19+13*21] = black;
    
    helmetlessMegaman.pixels[1+14*21] = black;
    helmetlessMegaman.pixels[4+14*21] = black;
    helmetlessMegaman.pixels[5+14*21] = black;
    helmetlessMegaman.pixels[6+14*21] = black;
    helmetlessMegaman.pixels[14+14*21] = black;
    helmetlessMegaman.pixels[15+14*21] = black;
    helmetlessMegaman.pixels[16+14*21] = black;
    helmetlessMegaman.pixels[19+14*21] = black;
    
    helmetlessMegaman.pixels[1+15*21] = black;
    helmetlessMegaman.pixels[5+15*21] = black;
    helmetlessMegaman.pixels[6+15*21] = black;
    helmetlessMegaman.pixels[14+15*21] = black;
    helmetlessMegaman.pixels[15+15*21] = black;
    helmetlessMegaman.pixels[19+15*21] = black;
    
    helmetlessMegaman.pixels[1+16*21] = black;
    helmetlessMegaman.pixels[5+16*21] = black;
    helmetlessMegaman.pixels[6+16*21] = black;
    helmetlessMegaman.pixels[14+16*21] = black;
    helmetlessMegaman.pixels[15+16*21] = black;
    helmetlessMegaman.pixels[19+16*21] = black;
    
    helmetlessMegaman.pixels[2+17*21] = black;
    helmetlessMegaman.pixels[3+17*21] = black;
    helmetlessMegaman.pixels[4+17*21] = black;
    helmetlessMegaman.pixels[6+17*21] = black;
    helmetlessMegaman.pixels[14+17*21] = black;
    helmetlessMegaman.pixels[16+17*21] = black;
    helmetlessMegaman.pixels[17+17*21] = black;
    helmetlessMegaman.pixels[18+17*21] = black;
    
    helmetlessMegaman.pixels[5+18*21] = black;
    helmetlessMegaman.pixels[15+18*21] = black;
    
    helmetlessMegaman.pixels[4+19*21] = black;
    helmetlessMegaman.pixels[10+19*21] = black;
    helmetlessMegaman.pixels[16+19*21] = black;
    
    helmetlessMegaman.pixels[3+20*21] = black;
    helmetlessMegaman.pixels[4+20*21] = black;
    helmetlessMegaman.pixels[9+20*21] = black;
    helmetlessMegaman.pixels[11+20*21] = black;
    helmetlessMegaman.pixels[16+20*21] = black;
    helmetlessMegaman.pixels[17+20*21] = black;
    
    helmetlessMegaman.pixels[1+21*21] = black;
    helmetlessMegaman.pixels[2+21*21] = black;
    helmetlessMegaman.pixels[8+21*21] = black;
    helmetlessMegaman.pixels[12+21*21] = black;
    helmetlessMegaman.pixels[18+21*21] = black;
    helmetlessMegaman.pixels[19+21*21] = black;
    
    helmetlessMegaman.pixels[0+22*21] = black;
    helmetlessMegaman.pixels[8+22*21] = black;
    helmetlessMegaman.pixels[12+22*21] = black;
    helmetlessMegaman.pixels[20+22*21] = black;
    
    helmetlessMegaman.pixels[0+23*21] = black;
    helmetlessMegaman.pixels[1+23*21] = black;
    helmetlessMegaman.pixels[2+23*21] = black;
    helmetlessMegaman.pixels[3+23*21] = black;
    helmetlessMegaman.pixels[4+23*21] = black;
    helmetlessMegaman.pixels[5+23*21] = black;
    helmetlessMegaman.pixels[6+23*21] = black;
    helmetlessMegaman.pixels[7+23*21] = black;
    helmetlessMegaman.pixels[8+23*21] = black;
    helmetlessMegaman.pixels[12+23*21] = black;
    helmetlessMegaman.pixels[13+23*21] = black;
    helmetlessMegaman.pixels[14+23*21] = black;
    helmetlessMegaman.pixels[15+23*21] = black;
    helmetlessMegaman.pixels[16+23*21] = black;
    helmetlessMegaman.pixels[17+23*21] = black;
    helmetlessMegaman.pixels[18+23*21] = black;
    helmetlessMegaman.pixels[19+23*21] = black;
    helmetlessMegaman.pixels[20+23*21] = black;
    
    //draw white pixels
    helmetlessMegaman.pixels[5+6*21] = white;
    helmetlessMegaman.pixels[8+6*21] = white;
    helmetlessMegaman.pixels[9+6*21] = white;
    helmetlessMegaman.pixels[10+6*21] = white;
    
    helmetlessMegaman.pixels[5+7*21] = white;
    helmetlessMegaman.pixels[10+7*21] = white;
    helmetlessMegaman.pixels[11+7*21] = white;
    
    helmetlessMegaman.pixels[5+8*21] = white;
    helmetlessMegaman.pixels[10+8*21] = white;
    helmetlessMegaman.pixels[11+8*21] = white;
    
    helmetlessMegaman.pixels[6+9*21] = white;
    helmetlessMegaman.pixels[8+9*21] = white;
    helmetlessMegaman.pixels[9+9*21] = white;
    helmetlessMegaman.pixels[10+9*21] = white;
    
    //draw skin pixels
    helmetlessMegaman.pixels[7+5*21] = skin;
    helmetlessMegaman.pixels[10+5*21] = skin;
    helmetlessMegaman.pixels[14+5*21] = skin;
    
    helmetlessMegaman.pixels[6+6*21] = skin;
    helmetlessMegaman.pixels[7+6*21] = skin;
    helmetlessMegaman.pixels[11+6*21] = skin;
    helmetlessMegaman.pixels[14+6*21] = skin;
    
    helmetlessMegaman.pixels[7+7*21] = skin;
    helmetlessMegaman.pixels[14+7*21] = skin;
    
    helmetlessMegaman.pixels[7+8*21] = skin;
    helmetlessMegaman.pixels[12+8*21] = skin;
    helmetlessMegaman.pixels[13+8*21] = skin;
    
    helmetlessMegaman.pixels[5+9*21] = skin;
    helmetlessMegaman.pixels[7+9*21] = skin;
    helmetlessMegaman.pixels[11+9*21] = skin;
    helmetlessMegaman.pixels[12+9*21] = skin;
    helmetlessMegaman.pixels[13+9*21] = skin;
    
    helmetlessMegaman.pixels[6+10*21] = skin;
    helmetlessMegaman.pixels[11+10*21] = skin;
    helmetlessMegaman.pixels[12+10*21] = skin;
    
    helmetlessMegaman.pixels[7+11*21] = skin;
    helmetlessMegaman.pixels[8+11*21] = skin;
    helmetlessMegaman.pixels[9+11*21] = skin;
    helmetlessMegaman.pixels[10+11*21] = skin;
    helmetlessMegaman.pixels[11+11*21] = skin;
    
    //draw lightBlue pixels
    helmetlessMegaman.pixels[3+11*21] = lightBlue;
    helmetlessMegaman.pixels[17+11*21] = lightBlue;
    
    helmetlessMegaman.pixels[3+12*21] = lightBlue;
    helmetlessMegaman.pixels[4+12*21] = lightBlue;
    helmetlessMegaman.pixels[16+12*21] = lightBlue;
    helmetlessMegaman.pixels[17+12*21] = lightBlue;
    
    helmetlessMegaman.pixels[2+13*21] = lightBlue;
    helmetlessMegaman.pixels[3+13*21] = lightBlue;
    helmetlessMegaman.pixels[4+13*21] = lightBlue;
    helmetlessMegaman.pixels[16+13*21] = lightBlue;
    helmetlessMegaman.pixels[17+13*21] = lightBlue;
    helmetlessMegaman.pixels[18+13*21] = lightBlue;
    
    helmetlessMegaman.pixels[2+14*21] = lightBlue;
    helmetlessMegaman.pixels[3+14*21] = lightBlue;
    helmetlessMegaman.pixels[17+14*21] = lightBlue;
    helmetlessMegaman.pixels[18+14*21] = lightBlue;
    
    helmetlessMegaman.pixels[2+15*21] = lightBlue;
    helmetlessMegaman.pixels[3+15*21] = lightBlue;
    helmetlessMegaman.pixels[4+15*21] = lightBlue;
    helmetlessMegaman.pixels[16+15*21] = lightBlue;
    helmetlessMegaman.pixels[17+15*21] = lightBlue;
    helmetlessMegaman.pixels[18+15*21] = lightBlue;
    
    helmetlessMegaman.pixels[2+16*21] = lightBlue;
    helmetlessMegaman.pixels[3+16*21] = lightBlue;
    helmetlessMegaman.pixels[4+16*21] = lightBlue;
    helmetlessMegaman.pixels[7+16*21] = lightBlue;
    helmetlessMegaman.pixels[8+16*21] = lightBlue;
    helmetlessMegaman.pixels[9+16*21] = lightBlue;
    helmetlessMegaman.pixels[10+16*21] = lightBlue;
    helmetlessMegaman.pixels[11+16*21] = lightBlue;
    helmetlessMegaman.pixels[12+16*21] = lightBlue;
    helmetlessMegaman.pixels[13+16*21] = lightBlue;
    helmetlessMegaman.pixels[16+16*21] = lightBlue;
    helmetlessMegaman.pixels[17+16*21] = lightBlue;
    helmetlessMegaman.pixels[18+16*21] = lightBlue;
    
    helmetlessMegaman.pixels[7+17*21] = lightBlue;
    helmetlessMegaman.pixels[8+17*21] = lightBlue;
    helmetlessMegaman.pixels[9+17*21] = lightBlue;
    helmetlessMegaman.pixels[10+17*21] = lightBlue;
    helmetlessMegaman.pixels[11+17*21] = lightBlue;
    helmetlessMegaman.pixels[12+17*21] = lightBlue;
    helmetlessMegaman.pixels[13+17*21] = lightBlue;
    
    helmetlessMegaman.pixels[9+18*21] = lightBlue;
    helmetlessMegaman.pixels[10+18*21] = lightBlue;
    helmetlessMegaman.pixels[11+18*21] = lightBlue;
    helmetlessMegaman.pixels[12+18*21] = lightBlue;
    
    helmetlessMegaman.pixels[5+19*21] = lightBlue;
    helmetlessMegaman.pixels[14+19*21] = lightBlue;
    helmetlessMegaman.pixels[15+19*21] = lightBlue;
    
    helmetlessMegaman.pixels[5+20*21] = lightBlue;
    helmetlessMegaman.pixels[6+20*21] = lightBlue;
    helmetlessMegaman.pixels[7+20*21] = lightBlue;
    helmetlessMegaman.pixels[13+20*21] = lightBlue;
    helmetlessMegaman.pixels[14+20*21] = lightBlue;
    helmetlessMegaman.pixels[15+20*21] = lightBlue;
    
    helmetlessMegaman.pixels[3+21*21] = lightBlue;
    helmetlessMegaman.pixels[4+21*21] = lightBlue;
    helmetlessMegaman.pixels[5+21*21] = lightBlue;
    helmetlessMegaman.pixels[6+21*21] = lightBlue;
    helmetlessMegaman.pixels[7+21*21] = lightBlue;
    helmetlessMegaman.pixels[13+21*21] = lightBlue;
    helmetlessMegaman.pixels[14+21*21] = lightBlue;
    helmetlessMegaman.pixels[15+21*21] = lightBlue;
    helmetlessMegaman.pixels[16+21*21] = lightBlue;
    helmetlessMegaman.pixels[17+21*21] = lightBlue;
    
    helmetlessMegaman.pixels[1+22*21] = lightBlue;
    helmetlessMegaman.pixels[2+22*21] = lightBlue;
    helmetlessMegaman.pixels[3+22*21] = lightBlue;
    helmetlessMegaman.pixels[4+22*21] = lightBlue;
    helmetlessMegaman.pixels[5+22*21] = lightBlue;
    helmetlessMegaman.pixels[6+22*21] = lightBlue;
    helmetlessMegaman.pixels[7+22*21] = lightBlue;
    helmetlessMegaman.pixels[13+22*21] = lightBlue;
    helmetlessMegaman.pixels[14+22*21] = lightBlue;
    helmetlessMegaman.pixels[15+22*21] = lightBlue;
    helmetlessMegaman.pixels[16+22*21] = lightBlue;
    helmetlessMegaman.pixels[17+22*21] = lightBlue;
    helmetlessMegaman.pixels[18+22*21] = lightBlue;
    helmetlessMegaman.pixels[19+22*21] = lightBlue;
    
    //draw lightGreen pixels
    helmetlessMegaman.pixels[14+10*21] = lightGreen;
    helmetlessMegaman.pixels[15+10*21] = lightGreen;
    
    helmetlessMegaman.pixels[4+11*21] = lightGreen;
    helmetlessMegaman.pixels[5+11*21] = lightGreen;
    helmetlessMegaman.pixels[13+11*21] = lightGreen;
    helmetlessMegaman.pixels[14+11*21] = lightGreen;
    helmetlessMegaman.pixels[15+11*21] = lightGreen;
    helmetlessMegaman.pixels[16+11*21] = lightGreen;
    
    helmetlessMegaman.pixels[5+12*21] = lightGreen;
    helmetlessMegaman.pixels[6+12*21] = lightGreen;
    helmetlessMegaman.pixels[12+12*21] = lightGreen;
    helmetlessMegaman.pixels[13+12*21] = lightGreen;
    helmetlessMegaman.pixels[14+12*21] = lightGreen;
    helmetlessMegaman.pixels[15+12*21] = lightGreen;
    
    helmetlessMegaman.pixels[5+13*21] = lightGreen;
    helmetlessMegaman.pixels[7+13*21] = lightGreen;
    helmetlessMegaman.pixels[8+13*21] = lightGreen;
    helmetlessMegaman.pixels[9+13*21] = lightGreen;
    helmetlessMegaman.pixels[10+13*21] = lightGreen;
    helmetlessMegaman.pixels[11+13*21] = lightGreen;
    helmetlessMegaman.pixels[12+13*21] = lightGreen;
    helmetlessMegaman.pixels[13+13*21] = lightGreen;
    helmetlessMegaman.pixels[15+13*21] = lightGreen;
    
    helmetlessMegaman.pixels[7+14*21] = lightGreen;
    helmetlessMegaman.pixels[8+14*21] = lightGreen;
    helmetlessMegaman.pixels[9+14*21] = lightGreen;
    helmetlessMegaman.pixels[10+14*21] = lightGreen;
    helmetlessMegaman.pixels[11+14*21] = lightGreen;
    helmetlessMegaman.pixels[12+14*21] = lightGreen;
    helmetlessMegaman.pixels[13+14*21] = lightGreen;
    
    helmetlessMegaman.pixels[7+15*21] = lightGreen;
    helmetlessMegaman.pixels[8+15*21] = lightGreen;
    helmetlessMegaman.pixels[9+15*21] = lightGreen;
    helmetlessMegaman.pixels[10+15*21] = lightGreen;
    helmetlessMegaman.pixels[11+15*21] = lightGreen;
    helmetlessMegaman.pixels[12+15*21] = lightGreen;
    helmetlessMegaman.pixels[13+15*21] = lightGreen;
    
    helmetlessMegaman.pixels[6+18*21] = lightGreen;
    helmetlessMegaman.pixels[7+18*21] = lightGreen;
    helmetlessMegaman.pixels[8+18*21] = lightGreen;
    helmetlessMegaman.pixels[13+18*21] = lightGreen;
    helmetlessMegaman.pixels[14+18*21] = lightGreen;
    
    helmetlessMegaman.pixels[6+19*21] = lightGreen;
    helmetlessMegaman.pixels[7+19*21] = lightGreen;
    helmetlessMegaman.pixels[8+19*21] = lightGreen;
    helmetlessMegaman.pixels[9+19*21] = lightGreen;
    helmetlessMegaman.pixels[11+19*21] = lightGreen;
    helmetlessMegaman.pixels[12+19*21] = lightGreen;
    helmetlessMegaman.pixels[13+19*21] = lightGreen;
    
    helmetlessMegaman.pixels[8+20*21] = lightGreen;
    helmetlessMegaman.pixels[12+20*21] = lightGreen;
    
  helmetlessMegaman.updatePixels();
  
}

void draw() {
  
  background(200);
  
  //draw image
  image (helmetlessMegaman,mouseX-50,mouseY-50,100,100);
  
}       
