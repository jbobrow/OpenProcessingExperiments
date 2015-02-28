
String [] answers = {  
 "outlook not so good", "don't count on it", "my sources say no", "without a doubt", "reply hazy, try again", "it is certain", "my reply is no", "as I see it yes", "most likely", "you may rely on it", "cannot predict now", "better not tell you now", "very doubtful", "outlook good", "yes definitely", "concentrate and ask again" 
};   
boolean mode = false;  
void setup()  
{    
size(500, 525);  
noLoop();  
}  
void draw()  
{  
fill(255,255,255);  
rect(0,450,500,200);  
fill(0);  
int i = int(random(16));  
if ( mode == true)  
{  
fill(0);  
ellipse(250, 250, 325, 325);  
fill(255);  
ellipse(250, 185, 175, 175);    
fill(0);  
textSize(25);  
text(answers[i], 250, 500);  
}  
else 
{  
ellipse(250, 250, 325, 325);  
fill(255);  
ellipse(250, 185, 175, 175);  
noFill();  
ellipse(250,141,60,60);
ellipse(250,210,80,80);
textSize(100);  
textAlign(CENTER);  
fill(0,0,0);  
rect(425, 425, 50, 50);  
}  
}  
void mousePressed()  
{  
if (mouseX > 425 && mouseX< 475 && mouseY > 425 && mouseY < 475)  
{  
mode = !mode;  
redraw();  
}
}


