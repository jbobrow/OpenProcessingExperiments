
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer track;
BeatDetect beat;
AudioMetaData meta;

void setup()
{
   size(800, 400);
   smooth(); 
   minim = new Minim(this);
   track = minim.loadFile("CARBON KEVLAR - Coco Shaker.mp3", 2048); 
   track.play();
   meta = track.getMetaData();   
   beat = new BeatDetect(track.bufferSize(), track.sampleRate());
   beat.setSensitivity(1);  
}

void draw()
{
    beat.detect(track.mix);
    background(0);     
    fill(255);
    text("Track: " + meta.fileName(), width/2 - 125, 30);    
    text("Author: " + meta.author(), width/2 - 80, 60);
    float durata = meta.length() / 60000;
    text("Length: " + durata + " mins", width/2 - 55, 90);     
    //CUBO 2     
    if((beat.isKick()) && (!beat.isSnare()) && (!beat.isHat()))
    {  
      if(mouseX >= width/4 - 40 && mouseX <= width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20) 
      fill(255,28,174);
      else
      if(mouseX >= width/2 - 40 && mouseX <= width/2 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20) 
      fill(238,238,0);
      else
      if(mouseX >= 3*width/4 - 40 && mouseX <= 3*width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20)
      fill(124,252,0);   
      else 
      fill (0,255,255);
      beginShape();
      vertex(width/4 + 100, 150);
      vertex(width/4 + 200, 200);
      vertex(width/4 + 200, 300);
      vertex(width/4 + 100, 250);    
      endShape(CLOSE); 
    }   
   if((beat.isSnare()))
   {
     if(mouseX >= width/4 - 40 && mouseX <= width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20)
     fill(139,34,82);
     else
     if(mouseX >= width/2 - 40 && mouseX <= width/2 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20) 
     fill(205,173,0);
     else
     if(mouseX >= 3*width/4 - 40 && mouseX <= 3*width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20)
     fill(0,139,0);
     else 
     fill(30,144,255);     
     beginShape();
     vertex(width/4 + 200, 200);
     vertex(width/4 + 300, 150);
     vertex(width/4 + 300, 250);
     vertex(width/4 + 200, 300);   
     endShape(CLOSE); 
   };   
   if((beat.isHat()) && (!beat.isKick()) && (!beat.isSnare()))
   {
     if(mouseX >= width/4 - 40 && mouseX <= width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20)    
     fill(205,105,180);
     else
     if(mouseX >= width/2 - 40 && mouseX <= width/2 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20) 
     fill(238,201,0);
     else
     if(mouseX >= 3*width/4 - 40 && mouseX <= 3*width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20)
     fill(84,255,159);     
     else
     fill(0,191,255); 
     beginShape();
     vertex(width/4 + 100, 150);
     vertex(width/4 + 200, 100);
     vertex(width/4 + 300, 150);
     vertex(width/4 + 200, 200);    
    endShape(CLOSE); 
   } 
  //CUBO 1
  if((beat.isKick()) && (!beat.isSnare()) && (!beat.isHat()))
    {    
      if(mouseX >= width/4 - 40 && mouseX <= width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20) 
      fill(255,28,174);
      else
      if(mouseX >= width/2 - 40 && mouseX <= width/2 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20) 
      fill(238,238,0);
      else
      if(mouseX >= 3*width/4 - 40 && mouseX <= 3*width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20)
      fill(124,252,0);    
      else 
      fill (0,255,255); 
       beginShape();
       vertex(width/4 - 100, 150);
       vertex(width/4, 200);
       vertex(width/4, 300);
       vertex(width/4 - 100, 250);    
       endShape(CLOSE); 
    }  
   if((beat.isSnare()))
   {
     if(mouseX >= width/4 - 40 && mouseX <= width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20)
     fill(139,34,82);
     else
     if(mouseX >= width/2 - 40 && mouseX <= width/2 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20) 
     fill(205,173,0);
     else
     if(mouseX >= 3*width/4 - 40 && mouseX <= 3*width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20)
     fill(0,139,0);
     else 
     fill(30,144,255); 
     beginShape();
     vertex(width/4, 200);
     vertex(width/4 + 100, 150);
     vertex(width/4 + 100, 250);
     vertex(width/4, 300);   
     endShape(CLOSE); 
   };  
   if((beat.isHat()) && (!beat.isKick()) && (!beat.isSnare()))
   {
     if(mouseX >= width/4 - 40 && mouseX <= width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20)    
     fill(205,105,180);
     else
     if(mouseX >= width/2 - 40 && mouseX <= width/2 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20) 
     fill(238,201,0);
     else
     if(mouseX >= 3*width/4 - 40 && mouseX <= 3*width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20)
     fill(84,255,159); 
     else
     fill(0,191,255); 
     beginShape();
     vertex(width/4 - 100, 150);
     vertex(width/4, 100);
     vertex(width/4 + 100, 150);
     vertex(width/4, 200);    
    endShape(CLOSE); 
   }      
   //CUBO 3
   if((beat.isKick()) && (!beat.isSnare()) && (!beat.isHat()))
    {  
       if(mouseX >= width/4 - 40 && mouseX <= width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20) 
       fill(255,28,174);  
       else
       if(mouseX >= width/2 - 40 && mouseX <= width/2 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20) 
       fill(238,238,0);  
       else
       if(mouseX >= 3*width/4 - 40 && mouseX <= 3*width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20)
       fill(124,252,0);  
       else 
       fill (0,255,255);
       beginShape();
       vertex(width/4 + 300, 150);
       vertex(width/4 + 400, 200);
       vertex(width/4 + 400, 300);
       vertex(width/4 + 300, 250);    
       endShape(CLOSE); 
    }   
   if((beat.isSnare()))
   {
     if(mouseX >= width/4 - 40 && mouseX <= width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20)
     fill(139,34,82);
     else
     if(mouseX >= width/2 - 40 && mouseX <= width/2 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20) 
     fill(205,173,0);
     else
     if(mouseX >= 3*width/4 - 40 && mouseX <= 3*width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20)
     fill(0,139,0);
     else 
     fill(30,144,255);  
     beginShape();
     vertex(width/4 + 400, 200);
     vertex(width/4 + 500, 150);
     vertex(width/4 + 500, 250);
     vertex(width/4 + 400, 300);   
     endShape(CLOSE); 
   };   
  if((beat.isHat()) && (!beat.isKick()) && (!beat.isSnare()))
   {
     if(mouseX >= width/4 - 40 && mouseX <= width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20)    
     fill(205,105,180);
     else
     if(mouseX >= width/2 - 40 && mouseX <= width/2 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20) 
     fill(238,201,0);
     else
     if(mouseX >= 3*width/4 - 40 && mouseX <= 3*width/4 + 40 && mouseY >= 7*height/8 - 20 && mouseY <=7*height/8 + 20)
     fill(84,255,159); 
     else
     fill(0,191,255); 
     beginShape();
     vertex(width/4 + 300, 150);
     vertex(width/4 + 400, 100);
     vertex(width/4 + 500, 150);
     vertex(width/4 + 400, 200);    
    endShape(CLOSE); 
   }      
     //CUBO 2     
     fill(205,173,0);  
     beginShape();
     vertex(width/2 - 40, 7*height/8 + 0);
     vertex(width/2 + 0, 7*height/8 - 20);
     vertex(width/2 + 40, 7*height/8 + 0);
     vertex(width/2 + 0, 7*height/8 + 20);    
     endShape(CLOSE); 
     //CUBO 1
     fill(205,105,180);
     beginShape();
     vertex(width/4 - 40, 7*height/8 + 0);
     vertex(width/4 + 0, 7*height/8 - 20);
     vertex(width/4 + 40, 7*height/8 + 0);
     vertex(width/4 + 0, 7*height/8 + 20);    
     endShape(CLOSE);     
     //CUBO 3
     fill(84,255,159);
     beginShape();
     vertex(3*width/4 - 40, 7*height/8 + 0);
     vertex(3*width/4 + 0, 7*height/8 - 20);
     vertex(3*width/4 + 40, 7*height/8 + 0);
     vertex(3*width/4 + 0, 7*height/8 + 20);    
     endShape(CLOSE);   
}

void stop()
{
   track.close();
   minim.stop();
   super.stop();
}

