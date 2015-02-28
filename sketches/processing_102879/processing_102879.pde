
Maxim maxim;
AudioPlayer sound1;
AudioPlayer sound2;
AudioPlayer sound3;
AudioPlayer sound4;

void setup()
{
  size(480, 800);
  maxim = new Maxim(this);
  sound1 = maxim.loadFile("A#.wav");
  sound2 = maxim.loadFile("B.wav");
  sound3 = maxim.loadFile("F#.wav");
  sound4 = maxim.loadFile("G#.wav");
  background(0);
}

boolean sound1_on = false;
boolean sound2_on = false;
boolean sound3_on = false;
boolean sound4_on = false;
boolean prog1 = false;
boolean prog2 = false;
boolean prog3 = false;
boolean prog4 = false;
final float modHeight = 800-800/5;  //modified height to process screen without button area 

int currentTime_circle = millis();
int cycleTime_circle = 3000;
int passedTime_circle;
int prog = 0;            //variant of the currently displayed symmetry

void symmetry_prog(float x,float y, float px, float py, float lineWidth, float speedLevel) {

  strokeWeight(lineWidth);
  passedTime_circle = millis() - currentTime_circle;
  
  if (prog1 == false && prog2 == false && prog3 == false && prog4 == false)  
  {
    strokeWeight(lineWidth);
    line(px,py,x,y);
    line(width-px,py,width-x,y);
    line(px,modHeight-py,x,modHeight-y);
    line(width-px,modHeight-py,width-x,modHeight-y);
    line(width/2+((width/2)-py),width/2-((width/2)-px),width/2+((width/2)-y),width/2-((width/2)-x));
    line(modHeight/2-((modHeight/2)-py),width/2-((width/2)-px),modHeight/2-((modHeight/2)-y),width/2-((width/2)-x));
    line(width/2+((width/2)-py),modHeight/2+((modHeight/2)-px),width/2+((width/2)-y),modHeight/2+((modHeight/2)-x));
    line(width/2-((width/2)-py),modHeight/2+((modHeight/2)-px),width/2-((width/2)-y),modHeight/2+((modHeight/2)-x));     
  } 
  if (prog1 == true) 
  {
    line(px,py,x,y);
    line(width-px,py,width-x,y);
  }
  if (prog2 == true) 
  {
    line(px,py,x,y);
    line(width-px,py,width-x,y);
    if (passedTime_circle > ( cycleTime_circle / speedLevel )) 
      {
        ellipse(mouseX,mouseY,pmouseX*speedLevel/30,pmouseX*speedLevel/30);
        ellipse(width - mouseX,mouseY,pmouseX*speedLevel/30,pmouseX*speedLevel/30);
        currentTime_circle = millis(); // Save the current time to restart the timer!
      }       
  }
  if (prog3 == true)
  {
    line(px,py,x,y);
    line(width-px,py,width-x,y);
    line(px,modHeight-py,x,modHeight-y);
    line(width-px,modHeight-py,width-x,modHeight-y);
  }
  if (prog4 == true)
  {
    line(px,py,x,y);
    line(width-px,py,width-x,y);
    line(px,modHeight-py,x,modHeight-y);
    line(width-px,modHeight-py,width-x,modHeight-y);
    if (passedTime_circle > ( cycleTime_circle / speedLevel )) 
      {
        ellipse(mouseX,mouseY,pmouseX*speedLevel/30,pmouseX*speedLevel/30);
        ellipse(width - mouseX,mouseY,pmouseX*speedLevel/30,pmouseX*speedLevel/30);
        ellipse(mouseX,modHeight-mouseY,pmouseX*speedLevel/30,pmouseX*speedLevel/30);
        ellipse(width-mouseX,modHeight-mouseY,pmouseX*speedLevel/30,pmouseX*speedLevel/30);
        currentTime_circle = millis(); // Save the current time to restart the timer!
      }      
  }
  return;
}

void mouseDragged()
{
  
  float c1 = map(mouseX, 0, width, 0, 255);
  float c2 = dist(mouseX,mouseY,width/2,height/2);
  float c3 = map(mouseY, 0, width, 0, 255);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 50, 0, 50); 
  
  //float stroke = map(speed, 0, 10, 2, 4);

//visual section  
  stroke(c1, c2, c3, 255);
  if (prog1 == true)
  {
    fill(0,255,0);
    rect(0,height-height/5,width/4,height/5);
  }
  if (prog2 == true)
  {
    fill(0,255,0);  
    rect(width/4,height-height/5,width/4,height/5);
  }
  if (prog3 == true)
  {
    fill(0,255,0);
    rect(width/2,height-height/5,width/4,height/5);
  }
  if (prog4 == true)
  {
    fill(0,255,0);
    rect(width-width/4,height-height/5,width/4,height/5);
  }
  if (prog1 == false)
  {
    fill(255,0,0);
    rect(0,height-height/5,width/4,height/5);
  }
  if (prog2 == false)
  {
    fill(255,0,0);  
    rect(width/4,height-height/5,width/4,height/5);
  }
  if (prog3 == false)
  {
    fill(255,0,0);
    rect(width/2,height-height/5,width/4,height/5);
  }
  if (prog4 == false)
  {
    fill(255,0,0);
    rect(width-width/4,height-height/5,width/4,height/5);
  }   
  
  fill(0, alpha);
  rect(0, 0, width, height);
  stroke(c1, c2, c3, 255);
  strokeWeight(6);
//line(mouseX, mouseY, pmouseX, pmouseY);
  if (mouseY < modHeight && pmouseY < modHeight)
  {
  symmetry_prog(pmouseX, pmouseY,mouseX, mouseY, 5, speed);
  }

//sound section
  if  (mouseX < width/2 && mouseY < modHeight/2)
  {
    sound1_on = true;
    sound2_on = false;
    sound3_on = false;
    sound4_on = false;
  }
  else if  (mouseX > width/2 && mouseY < modHeight/2)
  {
    sound1_on = false;
    sound2_on = true;
    sound3_on = false;
    sound4_on = false;
  }
  else if  (mouseX < width/2 && mouseY > modHeight/2 && mouseY < modHeight)
  {  
    sound1_on = false;
    sound2_on = false;
    sound3_on = true;
    sound4_on = false;
  }  
  else if  (mouseX > width/2 && mouseY > modHeight/2 && mouseY < modHeight)
  {  
    sound1_on = false;
    sound2_on = false;
    sound3_on = false;
    sound4_on = true;
  }
  
  if (sound1_on == true)
  {
    sound1.play();
  }
  else
  {
    sound1.stop();
  }
  
  if (sound2_on == true)
  {
    sound2.play();
  }
  else
  {
    sound2.stop();
  }
      
  if (sound3_on == true)
  {
    sound3.play();
  }
  else
  {
    sound3.stop();
  }
  
  if (sound4_on == true)
  {
    sound4.play();
  }
  else
  {
    sound4.stop();
  }  
}

void mousePressed()
{
  if (mouseY > modHeight)
  {
    if (mouseX < width/4)
    {
      prog1 = !prog1;
      prog2 = false;
      prog3 = false;
      prog4 = false;
    }  
    else if (mouseX < width/2 && mouseX > width/4)
    {
      prog2 = !prog2;
      prog1 = false;
      prog3 = false;
      prog4 = false;
    }      
    else if (mouseX < width-width/4 && mouseX > width/2)
    {
      prog3 = !prog3;
      prog1 = false;
      prog2 = false;
      prog4 = false;
    }      
    else if (mouseX > width-width/4)
    {
      prog4 = !prog4;
      prog1 = false;
      prog2 = false;
      prog3 = false;
    }  
  }    
}



