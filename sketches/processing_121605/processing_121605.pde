
String n = "i love you";
String buffer = "";

void setup() {
  size(600, 600);
  smooth();
  rederTree();
}

void draw() {

}

void rederTree(){
    colorMode(RGB, 255);
  fill(255, 255, 255);
  rect(0, 0, width, height);

  n = removeSpaces(n);
  background(255);

  colorMode(HSB, 100);  
  translate(width/2, height-50);

  rotate(radians(-90));

  
  l(n.length(), 0, 30, 40, n);
}
void l(float d, int upto, int a, float lim, String st) {
  if (upto<d) {
  
     int[] bits = int( st.toCharArray() );
     int asciiCode = bits[upto];
     
     fill(0);
    //text("bits[upto] = "+bits[upto],100,0);
    
    float lineColor = map(asciiCode, 97, 122, 0, 100);

    stroke(lineColor, 70, 90);

    float rotation = map(asciiCode, 97, 122, 0, 25);

    float lengthOfLine = map(asciiCode, 97, 122, 2, 30);

    stroke(lineColor, 80, 80, 10);  

    strokeWeight(map(upto, 0, d, d, 0));
    line(0, 0, lim, 0);


    pushMatrix();
    translate(lim, 0);
    rotate(radians(rotation));
   
    l(d, upto+1, a, lim, st);
    popMatrix();

    pushMatrix();
    translate(lim, 0);
    rotate(radians(rotation*(-1)));
    
    l(d, upto+1, a, lim, st);
    popMatrix();
  }
  else {
    return;
  }
}

String removeSpaces(String s){
    String[] bits = s.split(" ");
    String noSpaces = "";
    for(int i = 0;i< bits.length;i++){
      noSpaces+=bits[i];
    }
    return noSpaces;
}

void keyPressed() 
{
 if (keyCode == RETURN) {

   n= removeSpaces(buffer);
   colorMode(RGB, 100);
   background(100);
   colorMode(HSB, 100);
   buffer="";
    rederTree();
 }else {
   buffer+= str (key);
 }
}
 
