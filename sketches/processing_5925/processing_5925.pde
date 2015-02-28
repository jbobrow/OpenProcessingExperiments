
PImage buffer=createImage(200,150,RGB);
color sample=color(0,0,0);
int offset=0;
void setup(){
  colorMode(HSB,360,100,100);
  smooth();
  size(buffer.width*3,buffer.height*3);
  //noLoop();
}

void draw(){
  buffer.loadPixels();
  for(int i=0; i<buffer.pixels.length;i++){
    if(primo(i+offset)){
      sample=color(0,0,0);
    }
    else{
      sample=color(map((i+offset)%10,0,10,0,360),100,100);
    }
    buffer.pixels[i]=sample;
    //println(i+"\t"+sample);
  }
  buffer.updatePixels();  
  image(buffer,0,0,width,height);
  //filter(BLUR, 1);
  //print("errr...");
  offset++;
  }

boolean primo(int numero){
  //return false;
  for(int compara=2;compara<numero;compara++){
    if(numero%compara==0){
      return true;
    }
  }
  return false;
  //  print("0");
}





