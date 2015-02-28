
PFont font, small;
int numIn, numOut, mod;
color rojo;

void setup(){
  size(300, 300);
  font = createFont("Georgia", 32);
  small = createFont("Georgia", 11);
  textAlign(CENTER);
  numIn = numOut = 0;
  mod = 1;
  rojo = color(255, 100, 100);
}

void draw(){
  background(255);
  numOut = numIn % mod;

  fill(0);
  for(int i = 0; i < height; i++){

    if(numIn < i){
      stroke(0);
    }
    else{
      stroke(rojo);
    }

    int x = i % mod;
    line(i, height, i, height-x);
  } 

  fill(rojo);
  textFont(font, 32);
  text(numIn, width*1/6, height/2);
  text("%", width*2/6, height/2);
  text(mod, width*3/6, height/2);
  text("=", width*4/6, height/2);
  text(numOut, width*5/6, height/2);

  fill(0);
  textFont(small, 11);
  text("a [+]", width*1/6, height*2/5);
  text("z [-]", width*1/6, height*3/5-textAscent());
  text("s [+]", width*3/6, height*2/5);
  text("x [-]", width*3/6, height*3/5-textAscent());
}

void keyPressed(){
  if(key =='a'){
    numIn++;
  }
  if(key =='z'){
    numIn--;
  }
  if(key =='s'){
    mod++;
  }
  if((key =='x') && (mod > 1)){
    mod--;
  }
}



