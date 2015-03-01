
// Dynamic MONKEYTYPoWRITER
// If monkey would have unlimited time with typewriter it would most probably write all Shakespeares novels!
// This code makes only future elecktronic business cards but they are all quite unique.
// Sorry about the mess in the code. Apes are probably more hygienic than I am.
// Ok code cleaned and satisfied. Hope you enjoy. PRESS ESC=ESCAPE

//Define Color Palette and global variables
color[] ligro = {#673F82, #52276F, #431463, #7A5B8F, #8E759E,#367871,
#20675F,#0E5C54,#51857F,#6A938F,#C28658,#A66533,#944D17,#D6A783,#ECC7AB};
color[] pal = ligro;
float counter= 0;
float t=random(5, 30);

//Create setup code block
  void setup(){
   size(1280, 720);
   background(pal[int(random(0, 15))]);
}

//Create the draw code block
    void draw(){
  
  //settin if to infinite 1!
     if(counter < 1){
       
  //setting frame rate random
    frameRate(random(2,25));
    
    //Set stroke color to random palette color
     stroke(pal[int(random(0, 15))]);
    //Set stroke weight randomly
     strokeWeight(int(random(37, 77)));
    //Set fill color randomly from palette
     fill(pal[int(random(0, 15))]);
    
//random places for text and objects

    //set location x to random of screen width-200
     float x = random(width-200);
    //set location x to random of screen height-200    
     float y = random(height-200);
    //d=  SIZE of "String message = "MON KEY TYPE WRIT ER";"
     float d = random(10, 100);
{   
//Rectangles leaving bacground intact
  //upper epilepsy rectangle
    stroke(pal[int(random(0, 15))]);
    fill(pal[int(random(0, 15))]);
    rect(0,0,1280,280);
  //lower epilepsy rectangle with different fill and stroke  
    stroke(pal[int(random(0, 15))]);
    fill(pal[int(random(0, 15))]);
    rect(0,440,1280,260);

//O TYPO ellipse x2
  strokeWeight(int(random(2, 6)));
  ellipse(x,y,d-20,d-7);
  ellipse(x,y,d-20,d-7);

//monkey typewriter

//text lines with different fills, sizes and placings
textAlign (CENTER);
//upper rect typings - more abstrackt
{fill(pal[int(random(1, 14))]);
textSize (t+10);
text("m  O   _   N   k    _    E   y    _    t   Y    _    p   e    _    w   R    _    i  t    _    e  r", random(540,660), random(60,170));
{fill(pal[int(random(1, 14))]);
textSize (t+10);
text("m    o     n      k      e     y     t     y     p      e      w      r      i      t      e      r", random(300,900), random(550,620));
//lower rect typings - getting better
{fill(pal[int(random(1, 14))]);
textSize (d-40);
text("M   o   n   k   e   y        T  y  p   e   w   r  i   t   e   r", random(300,900), random(500,700));
{fill(pal[int(random(1, 14))]);
textSize (t+10);
text("M  o  n   _   K   e   y   _   T    y   p   e   _   W   r   i   t   e   r", random(400,800), random(0,100));
}
}
}
}

//typewriter center screen FOR ANY Statements!
  textSize(d);
String message = "MON KEY TYPE WRIT ER";
int z = 30; 
for (int i = 0; i < message.length(); i++) {
// Each character is displayed one at a time with the charAt() function.
  text(message.charAt(i),z,random(height/3,width/3));
  textSize (d++);
  z += 62; 
}for (int i = 0; i < 62; i++)

//semi keyboard controll
//ecape plan from loops and information for epilectic people 
  textAlign(LEFT);
  textSize(33);
  fill(#FF0000);
  text("esc", 25,45);
    
  textAlign(CENTER);
  textSize(170);
  fill(#FF0000);
  //text("esc if epilectic", 1280/2, 720/2+50);

//change limiter count for if loop to infinite 1
   counter += 0;
}
}
}


