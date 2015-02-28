
String [] answers = {    
  "outlook not so good", "don't count on it", "my sources say no", "without a doubt", "reply hazy, try again", "it is certain", "my reply is no", "as I see it yes", "most likely", "you may rely on it", "cannot predict now", "better not tell you now", "very doubtful", "outlook good", "yes definitely", "concentrate and ask again"
};     
boolean mode = false;    
void setup()    
{      
  size(500, 525);  
  background(125,16,12);  
  noLoop();
}    
void draw()    
{    
  fill(255, 255, 255);    
  rect(0, 450, 500, 200);    
  fill(0);    
  int i = int(random(16));    
  if ( mode == true)    
  {    
    fill(0);    
    ellipse(250, 250, 280, 280);   
    fill(255);    
    ellipse(250, 210, 180, 180);      
    fill(0);    
    textSize(25);    
    text(answers[i], 250, 500);
  }    
  else  
  {    
    ellipse(250, 250, 280, 280);   
    fill(255);    
    ellipse(250, 210, 180, 180);    
    noFill();    
    ellipse(250, 160, 70, 70);  
    ellipse(250, 238, 85, 85); 
    textSize(100);    
    textAlign(CENTER);    
    fill(0, 0, 0);    
      textSize(18);
  text("ask a question and click on the screen",250,425);

  }
}    

void mousePressed()    
{    
  if (mouseX > 0 && mouseX< 525 && mouseY > 0 && mouseY < 500)    
  {    
    mode = !mode;    
    redraw();
  }
} 



