
//Anleitung
//Modi werden mit den Zifferntasten 1 bis -- ausgeführt

//die Farben können häufig geändert werden mit den Tasten
//für Rot   q (+10) w (-10)
//für Grün  e (+10) r (-10)
//für Blau  r (+10) t (-10) 
// auch ja mit j kann man speichern :)




int mode = 1;
int zaehler = 0;

float red = 255;
float green = 255;
float blue = 255;
float x = 0;
float y = 0;
float r = 0;
float w = 1;

void setup(){
  size(800,800);
  smooth();
  background(0);
  frameRate(1300);
 
}


void draw(){
  //background(0)
  
  //alles nur bei gedrückter Maustaste, erleichtert präzises arbeiten :)
  if(mousePressed){
  
  //Modus 1_____________________________________
  
  if (mode == 1) {
  
    x = mouseX;
    y = mouseY;
    r = random(60,10);
    w =dist(mouseX,mouseY,pmouseX,pmouseY)/4;
  
    println(w);
    strokeWeight(w/2);
    stroke(255,100);
    fill(red, green, blue, random(200,160));
    ellipse(mouseX,mouseY,w,w);
  }
  
  //Modus 2_______________________________________
  if (mode == 2){
    
    float x2 = x+sin(frameCount/20.0)*40;
    float y2 = y+cos(frameCount/20.0)*40;
    
    x = mouseX+sin(frameCount/125.0)*40;
    y = mouseY+cos(frameCount/125.0)*40;
    r = random(20);
    w =dist(mouseX,mouseY,pmouseX,pmouseY)/5+2;
    
    stroke(200,60);
    fill(red,green,blue,30);
    ellipse(x2,y2,r,r);
    
  }
  //Mode 3 ________________________________________
  if (mode ==3){
    float x2 = x+sin(frameCount/cos(frameCount))*50;
    float y2 = y+cos(frameCount/cos(frameCount))*50;
    
    x = mouseX+sin(frameCount/125.0)*40;
    y = mouseY+cos(frameCount/125.0)*40;
    r = random(20);
    w =dist(mouseX,mouseY,pmouseX,pmouseY)/5+2;
    
    stroke(200,60);
    fill(red,green,blue,30);
    line(x,y,x2,y2);
    ellipse(x2,y2,r,r);
    
  }

 //Mode 4 ________________________________________

     if (mode ==4){
    float x2 = x+sin(frameCount/cos(frameCount))*50;
    float y2 = y+cos(frameCount/sin(frameCount))*50;
    
    x = mouseX+sin(frameCount/125.0)*60;
    y = mouseY+cos(frameCount/125.0)*60;
    r = random(20);
    w =dist(mouseX,mouseY,pmouseX,pmouseY)/5+2;
    
    stroke(200,60);
    fill(red,green,blue,2);
    line(x,y,x2,y2);
  
    ellipse(x2,y2,r,r);
    ellipse((x2*1.1),(y2*1.1),(r*1.2),(r*1.2));
    ellipse(x,y,(r*r/2),(r*r/2));
    
     }

    //Mode 5___________________________________________nicht ganz ausgereift

      if (mode == 5) {
   
    //hier gehört irgendwie ein Zufallswert von 1 bis 50 rein!!!
        int c = 1;
        int v = c+1;
    String s = "abcdefghijklmnopqrstuvxyzABCDEFGHIJKLMNOPQRSTUVXYZ";
    
    
    
    x = mouseX;
    y = mouseY;
    r = random(60,10);
    w =dist(mouseX,mouseY,pmouseX,pmouseY);
    float x2 = x+sin(frameCount/cos(frameCount)*sin(y))*80;
    float y2 = y+cos(frameCount/sin(frameCount)*cos(x))*80;    
       
        
  
    println(w);
    strokeWeight(w/2);
    stroke(255,100);
    fill(red, green, blue, random(200,160));
    //ellipse(mouseX,mouseY,w,w);
     rotate(w);
     text(s.substring (c, v),x2,y2);
    
    
    
    }

  }




}





//Tastenbebehle

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
  
  
  //Farberhöhung oder -sekung
     if(key=='q'){
      red = red+10;
     }
     
    
     if(key=='w'){
      red = red-10;
     }
  
    if(key=='e'){
      green = green+10;
     }
     
    
     if(key=='r'){
      green = blue-10;
     }
     
     
       if(key=='t'){
      blue = blue+10;
     }
     
    
     if(key=='z'){
      blue = -10;
     }
  
  
  
  //weißer oder schwarzer Hintergrund
  if(key =='a'){
    background(255);
  }
  
   if(key =='s'){
    background(0);
  }
  
  if(key == 'w'){
    w= w+1;
  }
  
  if(key == 'q'){
    w= w-1;
  }

  if(key == 'j'){  
    saveFrame(zaehler+".jpg");
    zaehler++;
    println(zaehler);
}

}

