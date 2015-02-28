

float x = 0;
float y = 0;
float r = 0;
float w= 5;
float frames = 15;
color c = color(255,0,0);
int   counter = 0;
boolean leaf = true;
boolean apple = false;
boolean pumpkin = false;

void setup(){
  size(800,600);
  smooth();
  background(255);
  frameRate(frames);
}


void draw(){
  
  if(mousePressed){
  //background(0);
   //ellipse(x,y,r,r);
  noStroke();
  x = (mouseX);
  y= (mouseY);
  w= dist(mouseX,mouseY,pmouseX,pmouseY)/10;
stroke(c);
fill(c);
//strokeWeight(w);
  r=random(10,50);
  //ellipse(x,y,r,r);
  //line(mouseX,mouseY,pmouseX,pmouseY);
  noStroke();
  //ellipse(mouseX+random(10),mouseY+random(10),random(5),random(5));
  
  //pumpkin
  if(pumpkin==true){
    float xPumpkin = mouseX+random(-50,50);
    float yPumpkin = mouseY+random(-50,50);
  color rndmPumpkin = color(random(179,255),random(85,98),1);
  stroke(0);
  strokeWeight(0.9);
  fill(rndmPumpkin);
  beginShape();
  curveVertex(xPumpkin+36,yPumpkin+28);
  curveVertex(xPumpkin+36,yPumpkin+28);
      curveVertex(xPumpkin+33,yPumpkin+26);
  curveVertex(xPumpkin+29,yPumpkin+25);
      curveVertex(xPumpkin+12,yPumpkin+31);
  curveVertex(xPumpkin+2,yPumpkin+52);
      curveVertex(xPumpkin+7,yPumpkin+72);
  curveVertex(xPumpkin+20,yPumpkin+81);
      curveVertex(xPumpkin+26,yPumpkin+85);
  curveVertex(xPumpkin+31,yPumpkin+87);
      curveVertex(xPumpkin+35,yPumpkin+85);
  curveVertex(xPumpkin+37,yPumpkin+84);
      curveVertex(xPumpkin+41,yPumpkin+86);
  curveVertex(xPumpkin+46,yPumpkin+88);
      curveVertex(xPumpkin+52,yPumpkin+86);
  curveVertex(xPumpkin+57,yPumpkin+83);
      curveVertex(xPumpkin+64,yPumpkin+84);
  curveVertex(xPumpkin+68,yPumpkin+81);
      curveVertex(xPumpkin+71,yPumpkin+83);
  curveVertex(xPumpkin+73,yPumpkin+84);
      curveVertex(xPumpkin+82,yPumpkin+76);
  curveVertex(xPumpkin+86,yPumpkin+57);
      curveVertex(xPumpkin+80,yPumpkin+34);
  curveVertex(xPumpkin+63,yPumpkin+28);
  curveVertex(xPumpkin+51,yPumpkin+27);
  curveVertex(xPumpkin+36,yPumpkin+28);
  curveVertex(xPumpkin+36,yPumpkin+28);
  endShape();
  
  //lienienKürbis
  strokeWeight(0.2);
  noFill();
  beginShape();
  curveVertex(xPumpkin+36,yPumpkin+28);
  curveVertex(xPumpkin+36,yPumpkin+28);
  curveVertex(xPumpkin+16,yPumpkin+51);
  curveVertex(xPumpkin+20,yPumpkin+81);
  curveVertex(xPumpkin+20,yPumpkin+81);
  endShape(); 
  
  beginShape();
  curveVertex(xPumpkin+42,yPumpkin+27);
  curveVertex(xPumpkin+42,yPumpkin+27);
  curveVertex(xPumpkin+31,yPumpkin+55);
  curveVertex(xPumpkin+37,yPumpkin+84);
  curveVertex(xPumpkin+37,yPumpkin+84);
  endShape(); 
  
   beginShape();
  curveVertex(xPumpkin+46,yPumpkin+27);
  curveVertex(xPumpkin+46,yPumpkin+27);
  curveVertex(xPumpkin+61,yPumpkin+57);
  curveVertex(xPumpkin+57,yPumpkin+83);
  curveVertex(xPumpkin+57,yPumpkin+83);
  endShape(); 
  
  beginShape();
  curveVertex(xPumpkin+46,yPumpkin+27);
  curveVertex(xPumpkin+46,yPumpkin+27);
  curveVertex(xPumpkin+70,yPumpkin+43);
  curveVertex(xPumpkin+68,yPumpkin+81);
  curveVertex(xPumpkin+68,yPumpkin+81);
  endShape(); 
  
  //Glanzlicht
  noStroke();
   fill(255,255,255,125);
   ellipse(xPumpkin+21,yPumpkin+33,9,7);
  
  noStroke();
   fill(255,255,255,125);
   ellipse(xPumpkin+31,yPumpkin+37,5,7);
    noStroke();
   fill(255,255,255,125);
   ellipse(xPumpkin+41,yPumpkin+38,5,9);
   
   //Kürbisstiel
   stroke(0);
  strokeWeight(0.9);
  color rndmPumpkinBlatt = color(0,random(124,207),0);
    fill(rndmPumpkinBlatt);
  fill(rndmPumpkinBlatt);
  beginShape();
  curveVertex(xPumpkin+36,yPumpkin+28);
  curveVertex(xPumpkin+36,yPumpkin+28);
   curveVertex(xPumpkin+44,yPumpkin+31);
  curveVertex(xPumpkin+53,yPumpkin+28); 
      curveVertex(xPumpkin+52,yPumpkin+22);
  curveVertex(xPumpkin+51,yPumpkin+19);
      curveVertex(xPumpkin+50,yPumpkin+11);
  curveVertex(xPumpkin+45,yPumpkin+6);
      curveVertex(xPumpkin+42,yPumpkin+7);
  curveVertex(xPumpkin+40,yPumpkin+9);
      curveVertex(xPumpkin+45,yPumpkin+13);
  curveVertex(xPumpkin+43,yPumpkin+20);
      curveVertex(xPumpkin+41,yPumpkin+21);
  curveVertex(xPumpkin+37,yPumpkin+23);
  curveVertex(xPumpkin+36,yPumpkin+28);
  curveVertex(xPumpkin+36,yPumpkin+28);
  endShape();
   
   //fratzen
   float fratze = frameCount%8;
   if (fratze == 7){
   
   fill(0);
   stroke(0);
   strokeWeight(0.9);
   quad(xPumpkin+18,yPumpkin+38,xPumpkin+30,yPumpkin+46,xPumpkin+14,yPumpkin+44,xPumpkin+14,yPumpkin+44);
   quad(xPumpkin+48,yPumpkin+48,xPumpkin+48,yPumpkin+48,xPumpkin+65,yPumpkin+46,xPumpkin+61,yPumpkin+39);  
   beginShape();
   vertex(xPumpkin+11,yPumpkin+67);
   vertex(xPumpkin+23,yPumpkin+56);
   vertex(xPumpkin+30,yPumpkin+62);
   vertex(xPumpkin+41,yPumpkin+57);
   vertex(xPumpkin+47,yPumpkin+63);
   vertex(xPumpkin+53,yPumpkin+58);
   vertex(xPumpkin+62,yPumpkin+68);
   
   vertex(xPumpkin+53,yPumpkin+65);
   vertex(xPumpkin+43,yPumpkin+73);
   vertex(xPumpkin+37,yPumpkin+66);
   vertex(xPumpkin+26,yPumpkin+72);
   vertex(xPumpkin+21,yPumpkin+65);
   endShape(CLOSE);  
   
   }
   
   
  }
  
  
  
  //apple
  if(apple==true){
    float xApfel = mouseX+random(-50,50);
    float yApfel = mouseY+random(-50,50);
  color rndmApfel = color(random(255),98,25);
  stroke(0);
  strokeWeight(0.9);
  fill(rndmApfel);
  beginShape();
  curveVertex(xApfel+30,yApfel+19);
  curveVertex(xApfel+30,yApfel+19);
  curveVertex(xApfel+36,yApfel+15);
  curveVertex(xApfel+42,yApfel+15);
  curveVertex(xApfel+53,yApfel+19);
  curveVertex(xApfel+56,yApfel+31);
  curveVertex(xApfel+49,yApfel+55);
  curveVertex(xApfel+37,yApfel+64);
  curveVertex(xApfel+32,yApfel+63);
  curveVertex(xApfel+28,yApfel+63);
  curveVertex(xApfel+22,yApfel+64);
  curveVertex(xApfel+18,yApfel+65);
  curveVertex(xApfel+7,yApfel+55);
  curveVertex(xApfel+1,yApfel+32);
  curveVertex(xApfel+6,yApfel+19);
  curveVertex(xApfel+15,yApfel+14);
  curveVertex(xApfel+24,yApfel+15);
  curveVertex(xApfel+30,yApfel+19);
  curveVertex(xApfel+30,yApfel+19);
  endShape();
  //Stiel
  fill(79,52,28);
  beginShape();
  vertex(xApfel+30,yApfel+19);
  vertex(xApfel+28,yApfel+10);
  vertex(xApfel+25,yApfel+6);
  vertex(xApfel+27,yApfel+3);
  vertex(xApfel+30,yApfel+10);
  vertex(xApfel+31,yApfel+14);
  vertex(xApfel+29,yApfel+18);
  vertex(xApfel+30,yApfel+19);
  endShape();
  //Blatt
   color rndmApfelBlatt = color(0,random(124,207),0);
    fill(rndmApfelBlatt);
   
    beginShape();
  curveVertex(xApfel+29,yApfel+15);
  curveVertex(xApfel+29,yApfel+15);
  curveVertex(xApfel+43,yApfel+14);
   curveVertex(xApfel+53,yApfel+2);
   curveVertex(xApfel+45,yApfel+5);
   curveVertex(xApfel+38,yApfel+3);
   curveVertex(xApfel+32,yApfel+7);
   curveVertex(xApfel+29,yApfel+15);
  curveVertex(xApfel+29,yApfel+15);
  endShape(); 
  strokeWeight(0.2);
  
  beginShape();
  curveVertex(xApfel+53,yApfel+3);
  curveVertex(xApfel+53,yApfel+3);
  curveVertex(xApfel+46,yApfel+6);
  curveVertex(xApfel+38,yApfel+6);
    curveVertex(xApfel+29,yApfel+15);
    curveVertex(xApfel+29,yApfel+15);
  endShape(); 
  
  
  noStroke();
   fill(255,255,255,125);
   ellipse(xApfel+15,yApfel+25,13,9);
  }
  
  
  
  
  //Leaf
  if (leaf == true){
  float blattSize= random(0.1,5);
  float xBlatt = mouseX+random(-50,50);
  float yBlatt = mouseY+random(-50,50)+blattSize;
  color rndmBlatt = color(random(255),random(255),0);
  //Ahornblatt
   strokeWeight(0.9);
  stroke(0);
  fill(rndmBlatt);
  beginShape ();
  vertex (xBlatt+44,yBlatt+ 61);
  vertex(xBlatt+46,yBlatt+89);
  vertex (xBlatt+42, yBlatt+89);
  vertex (xBlatt+43, yBlatt+61);
  vertex (xBlatt+33, yBlatt+72);
  curveVertex (xBlatt+33,yBlatt+72);
  curveVertex (xBlatt+33, yBlatt+57);
  curveVertex (xBlatt+17, yBlatt+66);
  curveVertex(xBlatt+23,yBlatt+53);
  curveVertex(xBlatt+6,yBlatt+49);
  curveVertex(xBlatt+11,yBlatt+39);
  curveVertex(xBlatt+3,yBlatt+31);
  curveVertex(xBlatt+25,yBlatt+30);
  curveVertex(xBlatt+21,yBlatt+17);
  curveVertex(xBlatt+32,yBlatt+17);
  curveVertex(xBlatt+33,yBlatt+1);
   
  curveVertex(xBlatt+40,yBlatt+14);
  curveVertex(xBlatt+52,yBlatt+16);
  curveVertex(xBlatt+51,yBlatt+32);
  curveVertex(xBlatt+71,yBlatt+22);
  curveVertex(xBlatt+65,yBlatt+33);
  curveVertex(xBlatt+68,yBlatt+40);
  curveVertex(xBlatt+59,yBlatt+47);
  curveVertex(xBlatt+67,yBlatt+53);
  curveVertex(xBlatt+55,yBlatt+58);
  curveVertex(xBlatt+57,yBlatt+68);
  curveVertex (xBlatt+44, yBlatt+61);
  curveVertex (xBlatt+44, yBlatt+61);
  endShape ();
  //BlattAdern
  strokeWeight(0.1);
  beginShape();
  vertex (xBlatt+44,yBlatt+60);
   vertex (xBlatt+33,yBlatt+1);
   endShape();
   beginShape();
  vertex (xBlatt+43,yBlatt+54);
   vertex (xBlatt+17,yBlatt+66);
   endShape();
   beginShape();
  vertex (xBlatt+43,yBlatt+54);
   vertex (xBlatt+3,yBlatt+30);
   endShape();
   beginShape();
  vertex (xBlatt+43,yBlatt+54);
   vertex (xBlatt+71,yBlatt+22);
   endShape();
   beginShape();
  vertex (xBlatt+43,yBlatt+54);
   vertex (xBlatt+67,yBlatt+53);
   endShape();
  }
  }
}

void keyPressed(){
  if(key== 's'){
background(0);}
 if(key== 'w'){
background(255);}

if(key== '1'){
leaf=true;
apple=false;
pumpkin=false;
}

if(key== '2'){
leaf=false;
apple=true;
pumpkin=false;}

if(key== '3'){
leaf=false;
apple=false;
pumpkin=true;}

if(key== 'j'){
saveFrame(counter+".jpg");
counter++;}
}







