
/**
type letters
*/
//Kovo 25, 2009
//myspace.com/gluklab
String k="qwertyuiopasdfghjklzxcvbnm"; // 10, 9 ,7
String K="QWERTYUIOPASDFGHJKLZXCVBNM";
PFont font;
int keyP;
void setup(){
 size(500,300,P3D); 
 noStroke(); 
 smooth();
font = loadFont("S20.vlw"); 
}

void draw(){
  lights();
  background(0); 
  camera(mouseX, -150, width/2,width/2, 50, 0, 
  0.0, 1.0, 0.0);
  rotateX(-0.61);
  axis();
  stroke(255);
  int x=0;
  int z=0;  
  int y=0;
  for (int i=0;i<k.length();i++){
    if (i==10||i==19){
      x=i*2;
      z+=45;
      //println("blac");
    }
    x+=45;
    pushMatrix();
    if (keyP==i){
      y=20;
    } 
    else y=0;
    translate(x,y,z);
    fill(150);
    box(40);
    fill(255,255,255);
    textFont(font); 
    rotateX(radians(90));
    text(K.charAt(i), -7, 7,25);
    popMatrix();
  }
  whatIf();
}

void axis(){
  //x
  beginShape();
  stroke(255,0,0);
  vertex(0,0,0);
  vertex(40,0,0);
  endShape();

  //y
  beginShape();
  stroke(0,255,0);
  vertex(0,0,0);
  vertex(0,40,0);
  endShape();

  //z
  beginShape();
  stroke(0,0,255);
  vertex(0,0,0);
  vertex(0,0,40);
  endShape();

}

void whatIf(){
  if (keyPressed==true){
    for (int i=0;i<k.length();i++){
      if (key==k.charAt(i))
        keyP=i;
    } 
   } else keyP=-1; 
}




