
String txtLines[];
char chars[] = new char[0];
int ints[] = new int[0];
color colors[] = new color[0];
int x, y, r;

void setup(){
  size(640,480);
  background(0);
  getText();
  convertCharToInt();
  convertIntToColor();
  x = width;
  y = height;
  smooth();
}

void draw(){
//  fill (colors[3]);
//  rect(0, 0, 200, 400);
//  fill (colors[7]);
//  rect(200, 0, 200, 400);
//=======
  if(key=='l' || key=='L'){
    background(0);
     for (int i = 0; i < colors.length; i++){
     stroke(colors[i]);
     r = int(blue(colors[i])/10);
     line(random(x), random(y), random(r), random(r)); 
     } 
  }
  if(key=='c' || key=='C'){
    noStroke();
    for (int i = 0; i < colors.length; i++){
     fill(colors[i]);
     ellipseMode(CENTER);
     r = int(red(colors[i])/10);
     ellipse(random(x),random(y), r, r); 
    }
  }
  if(key=='s' || key=='S'){
    noStroke();
    for (int i = 0; i < colors.length; i++){
     fill(colors[i]);
     r = int(green(colors[i])/10);
     rectMode(CENTER);
     rect(random(x), random(y), random(r), random(r)); 
    } 
  }
  if(key=='a' || key=='A'){
    noFill();
    for (int i = 0; i < colors.length; i++){
     stroke(colors[i]);
     r = int(red(colors[i])/10) + int(green(colors[i])/10) + int(blue(colors[i])/10);
     arc(random(x), random(y), r, r, random(PI), random(PI)); 
    }
  }
}

void getText(){
  txtLines = loadStrings("machado.txt");
  println("there are " + txtLines.length + " lines");
  for(int i = 0; i < txtLines.length; i++) {
    println(txtLines[i]);
    println("--------");
    println("esta linha tem " + txtLines[i].length()+" caracteres.");
    for(int j =0; j < txtLines[i].length(); j++){
      char c = txtLines[i].charAt(j);
      println(c);
      chars = append (chars, c);
    }
  }
  //println("chars[] tem " + chars.length + " elementos,");
  //println("sendo eles: " + chars);
}

void convertCharToInt(){
  for(int i=0; i < chars.length; i++){
    int num = int(chars[i]);
    ints = append (ints, num);
    println(chars[i] + " = " + num);
  } 
}

void convertIntToColor(){
  for(int i = 0; i < ints.length; i++){
    if(i>=ints.length-2){
      float R = map (ints[i], 0, max(ints), 0, 255);
      float G = map (ints[i-1], 0, max(ints), 0, 255);
      float B = map (ints[i-2], 0, max(ints), 0, 255);
      color clr = color (R, G, B); 
      colors = append (colors, clr);
    }
    else{
      float R = map (ints[i], 0, max(ints), 0, 255);
      float G = map (ints[i+1], 0, max(ints), 0, 255);
      float B = map (ints[i+2], 0, max(ints), 0, 255);
      color clr = color (ints[i], ints[i+1], ints[i+2]); 
      colors = append (colors, clr);
    }
    println("cor " + i + " = " + "R " + red(colors[i]) + ", G " + green(colors[i]) + ", B " + blue(colors[i]));
  } 
}

