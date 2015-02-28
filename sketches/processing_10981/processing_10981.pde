
Boolean reload = true;
PImage last;
PImage current;
int mode = 2;
String img = new String("emu.jpg");

void setup(){
  frameRate(5);
  last = loadImage(img);
  current = loadImage(img);
  size(last.width, last.height);
  image(last,0,0);
}


void draw(){
  image(last,0,0);
  println("mode = " + mode + ", reload? " + reload);
  for(int i = 0; i < last.width; i++){
    //println("i = " + i);
    for(int j = 0; j < last.height; j++){
      //println( i = " + i);
      if(mode == 1){
        current.set(i,j,blur(i,j));
      }else if(mode == 2){
        current.set(i,j,Life(i,j));
      }else if(mode == 3){
        current.set(i,j,mix(i,j));
      }else if(mode == 4){
        current.set(i,j,fizz(i,j));
      }else{
        current.set(i,j,blur(i,j));
      }
      
      //if(j == last.height - 1){
        //println("j == last.height");
      //}
    }
  }
  
  last.loadPixels();
  current.loadPixels();
  
  for(int z = 0; z < last.width * last.height; z++){
    last.pixels[z] = current.pixels[z];
  }
  last.updatePixels();
  
}

color Life(int i, int j){
  color c = blur(i,j);
  float a = (red(c) + green(c) + blue(c)) / 3;
  
  if(a == 0){
    return color(0,0,0);
  }else if(a > 0 && a <= 85){
    return color(random(10),random(10),random(10));
  }else if(a > 85 && a <= 170){
    return color(random(245,255),random(245,255),random(245,255));
  }else if(a > 170 && a <= 255){
    return color(random(10),random(10),random(10));
  }else if(a == 255){
    return color(0,0,0);
  }
  
  return color(255,255,255);
  
}

color fizz(int i, int j){
  color c = last.get(i,j);
  int r = int(random(4));
  //println(r);
  if(r == 0){
    return color(red(c),green(c),blue(c));
  }else if(r == 1){
    return color(green(c),blue(c),red(c));
  }else if(r == 2){
    return color(blue(c),red(c),green(c));
  }else if(r == 3){
    return color(red(c),blue(c),green(c));
  }
  return color(255,255,255);
}




color mix(int i, int j){
  color c = last.get(i,j);
  return color(green(c),blue(c),red(c));
}












color blur(int i, int j){
  int r = 0;
  int g = 0;
  int b = 0;
  
  int t = 0;
  
  if(i > 0 && j > 0){
    t++;
    r += red(last.get(i - 1, j - 1));
    g += green(last.get(i - 1, j - 1));
    b += blue(last.get(i - 1, j - 1));
  }
  if(j > 0){
    t++;
    r += red(last.get(i, j - 1));
    g += green(last.get(i, j - 1));
    b += blue(last.get(i, j - 1));
  }
  if(i < last.width - 1 && j > 0){
    t++;
    r += red(last.get(i + 1, j - 1));
    g += green(last.get(i + 1, j - 1));
    b += blue(last.get(i + 1, j - 1));
  }//else{
    //println("i = last.width");
  //}
  if(i > 0){
    t++;
    r += red(last.get(i - 1, j));
    g += green(last.get(i - 1, j));
    b += blue(last.get(i - 1, j));
  }
  if(i < last.width - 1){
    t++;
    r += red(last.get(i + 1, j));
    g += green(last.get(i + 1, j));
    b += blue(last.get(i + 1, j));
  }
  if(i > 0 && j < last.height - 1){
    t++;
    r += red(last.get(i - 1, j + 1));
    g += green(last.get(i - 1, j + 1));
    b += blue(last.get(i - 1, j + 1));
  }
  if(j < last.height - 1){
    t++;
    r += red(last.get(i, j + 1));
    g += green(last.get(i, j + 1));
    b += blue(last.get(i, j + 1));
  }
  if(i < last.width - 1 && j < last.height - 1){
    t++;
    r += red(last.get(i + 1, j + 1));
    g += green(last.get(i + 1, j + 1));
    b += blue(last.get(i + 1, j + 1));
  }
  
  
  
  r = r / t;
  g = g / t;
  b = b / t;
  return color(r, g, b);
}

void mouseClicked(){
  println("click!");
  if(reload){
    last = loadImage(img);
    current = loadImage(img);
  }
  mode++;
  if(mode > 4){
    mode = 1;
  }
}

void keyPressed(){
  if(reload){
    reload = false;
  }else{
    reload = true;
  }
}



