
PImage bild;
int mode = 1;

void setup(){
  size(800,533);
  smooth();
  
  bild = loadImage("Schneider_Ivan_Finnland_Processing.jpg");
  
  frameRate(100000);
  background(0);
}


void draw(){

  
  int x = int(random(width));
  int y = int(random(height));
  fill(bild.get(x,y), 100);
  int r = int(random(20));
  strokeWeight(1);
  stroke(bild.get(x,y), 100);
  beginShape();
  
  for(int i= 0; i <10; i++)
  
  
   if (mode ==1){
    //linien, sternförmig
  line(x+sin(random(30)), y+sin(random(30)),x+sin(random(30))*20, y+sin(random(30))*20);
   }
  
   if (mode ==2){
    //mehrere Linien, Wachsmalähnlicher Effekt
  line(x+random(30), y+random(30),x+random(30)*2, y+random(30)*2);
   }
   
    if (mode ==3){
    //kreise, lustig
  ellipse(x+random(30), y+random(30),r,r);
    }
    
     if (mode ==4){
    //komische Formen, vom Dozenten abgeschaut
  beginShape();
  for (int i= 0; i<10;i++)vertex(x+random(-20, 20), y+random(-20, 20));

  endShape();
     }
  
   if (mode ==5){
  
    //alles zusammen, holerö!!!
     //linien, sternförmig
  line(x+sin(random(30)), y+sin(random(30)),x+sin(random(30))*20, y+sin(random(30))*20);
  
   //mehrere Linien, Wachsmalähnlicher Effekt
  line(x+random(30), y+random(30),x+random(30)*2, y+random(30)*2);
  
  //kreise, lustig
  ellipse(x+random(30), y+random(30),r,r);
  
   //komische Formen, vom Dozenten abgeschaut
  beginShape();
  for (int i= 0; i<10;i++)vertex(x+random(-20, 20), y+random(-20, 20));

  endShape();
     
   }
  
if(mousePressed){
  if (mode ==6){
   
    float a = 1;
    float b = 1;
    float c = 1;
    float d = 1;
  
    float a2 = x+sin(frameCount/cos(frameCount))*50;
    float b2 = y+cos(frameCount/sin(frameCount))*50;
    
    a = mouseX+sin(frameCount/125.0)*60;
    b = mouseY+cos(frameCount/125.0)*60;
    c = random(20);
    d =dist(mouseX,mouseY,pmouseX,pmouseY)/5+2;
     
    fill(bild.get(x,y), 10);
    stroke(bild.get(x,y), 100);
    
    line(a,b,a2,b2);
  
    ellipse(a2,b2,c,c);
    ellipse((a2*1.1),(b2*1.1),(c*1.2),(c*1.2));
    ellipse(a,b,(c*c/2),(c*c/2));
}
    
    
     if (mode ==7){
    
    float a = 1;
    float b = 1;
    float c = 1;
    float d = 1;
  
    float a2 = x+sin(frameCount/cos(frameCount))*50;
    float b2 = y+cos(frameCount/sin(frameCount))*50;
    
    a = mouseX+sin(frameCount/125.0)*60;
    b = mouseY+cos(frameCount/125.0)*60;
    c = random(20);
    d =dist(mouseX,mouseY,pmouseX,pmouseY)/5+2;
     
    fill(bild.get(x,y), 10);
    stroke(bild.get(x,y), 100);
    
     fill(bild.get(x,y), 10);
    stroke(bild.get(x,y), 100);
    line(a,b,a2,b2);
    ellipse(a2,b2,c,c);
    
  }
    
    if (mode ==8){ 
    ellipse(x, y, random(1, mouseX/4.0), random(1, mouseY/4.0));
    

   
  
  }
}
  
}
//  
//   float x2 = x+sin(frameCount/cos(frameCount))*50;
//    float y2 = y+cos(frameCount/cos(frameCount))*50;
//    
//    x = mouseX+sin(frameCount/125.0)*40;
//    y = mouseY+cos(frameCount/125.0)*40;
//    r = random(20);
//    w =dist(mouseX,mouseY,pmouseX,pmouseY)/5+2;
//    
//    stroke(200,60);
//    fill(red,green,blue,30);
//    line(x,y,x2,y2);
//    ellipse(x2,y2,r,r);
//  
  

  
  
  
  
  void keyPressed(){
  
  //Modus Bebehle
  
  if(key=='1'){
    mode = 1;
  }
  
    if(key=='2'){
    mode = 2;
  }
  
   if(key=='3'){
    mode = 3;
  }
  
   if(key=='4'){
    mode = 4;
  }
  
  if(key=='5'){
    mode = 5;
  }
  
  if(key=='6'){
    mode = 6;
  }
  
  if(key=='7'){
    mode = 7;
  }
  
  if(key=='8'){
    mode = 8;
  }
  
  }


