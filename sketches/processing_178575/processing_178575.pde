
import ddf.minim.*;
//array of melodic notes a to g and octave
boolean [] a = new boolean[7];
boolean [] b = new boolean[7];
boolean [] c = new boolean[7];
boolean [] d = new boolean[7];
boolean [] e = new boolean[7];
boolean [] f = new boolean[7];
boolean [] g = new boolean[7];
boolean [] oct = new boolean[7];
int [] pos = {70, 110, 150, 190, 230, 270, 310, 350};
Minim minim;
AudioSample a3;
AudioSample b3;
AudioSample c3;
AudioSample d3;
AudioSample e3;
AudioSample f3;
AudioSample g3;
AudioSample a4;
AudioSample b4;
AudioSample c4;
AudioSample d4;
AudioSample e4;
AudioSample f4;
AudioSample g4;

float circlePos = 80;//starting position of the round buttons
int circleSpacing = 8;//space and size between the round buttons
float rectX = 70;//starting x position of the running square
float rectY = 70;//starting y position of the running square

void setup () {
  size(500, 500);
  background(0);
  frameRate(30);
  //initialise default rainbow pattern
  for (int i = 6; i < a.length; i++)
    a[i] = true;
  for (int i = 5; i < b.length-1; i++)
    b[i] = true;
  for (int i = 4; i < c.length-2; i++)
    c[i] = true;
  for (int i = 3; i < d.length-3; i++)
    d[i] = true;
  for (int i = 2; i < e.length-4; i++)
    e[i] = true;
  for (int i = 1; i < f.length-5; i++)
    f[i] = true;
  for (int i = 0; i < g.length-6; i++)
    g[i] = true;
  for (int i = 0; i < g.length; i++)
    oct[i] = false;

  minim = new Minim(this);
  a3=minim.loadSample("a3.wav");
  b3=minim.loadSample("b3.wav");
  c3=minim.loadSample("c3.wav");
  d3=minim.loadSample("d3.wav");
  e3=minim.loadSample("e3.wav");
  f3=minim.loadSample("f3.wav");
  g3=minim.loadSample("g3.wav");
  a4=minim.loadSample("a4.wav");
  b4=minim.loadSample("b4.wav");
  c4=minim.loadSample("c4.wav");
  d4=minim.loadSample("d4.wav");
  e4=minim.loadSample("e4.wav");
  f4=minim.loadSample("f4.wav");
  g4=minim.loadSample("g4.wav");
}


void draw() {
  background(0);
  noStroke();
  //draw a column of buttons which indicates the piano key
     for (int y=1; y<300; y=y+circleSpacing*5) { 
      fill (75);
      ellipse(circlePos+330, circlePos+y,30,30);
    }
textSize(24);
fill(255);
text("b", 403, 90); 
text("a", 403,130); 
text("g", 403,170); 
text("f", 403,210); 
text("e", 403,250); 
text("d", 403,290); 
text("c", 403,330); 
triangle(circlePos+325, 370,circlePos+325,350,420,360);//draw play button

  for (int i = 0; i < a.length; i++) {
    if (a[i])
    {
      fill(255, 0, 0);//red
    }
    else
    {
      fill(128);
    }

    rect(70 + (40*i), 70, 30, 30);
  }

  for (int i = 0; i < b.length; i++) {
    if (b[i])
    {
      fill(255, 128, 0);//orange
    }
    else
    {
      fill(128);
    }
    rect(70 + (40*i), 110, 30, 30);
  }
  for (int i = 0; i < c.length; i++) {
    if (c[i])
    {
      fill(255, 255, 0);//yellow
    }
    else
    {
      fill(128);
    }
    rect(70 + (40*i), 150, 30, 30);
  }
  for (int i = 0; i < d.length; i++) {
    if (d[i])
    {
      fill(0, 128, 0);//green
    }
    else
    {
      fill(128);
    }
    rect(70 + (40*i), 190, 30, 30);
  }
  for (int i = 0; i < e.length; i++) {
    if (e[i])
    {
      fill(0, 0, 255);//blue
    }
    else
    {
      fill(128);
    }
    rect(70 + (40*i), 230, 30, 30);
  }
for (int i = 0; i < f.length; i++) {
    if (f[i])
    {
      fill(75, 0, 130);//indigo
    }
    else
    {
      fill(128);
    }
    rect(70 + (40*i), 270, 30, 30);
  }
for (int i = 0; i < g.length; i++) {
    if (g[i])
    {
      fill(143, 0, 255);//violet
    }
    else
    {
      fill(128);
    }
    rect(70 + (40*i), 310, 30, 30);
  }

//octave column
for (int i=0; i<oct.length; i++) { 
       if (oct[i])
       {
      fill (255);
       }
    else
    {
      fill(75);
    }
    rect(350, 70+(40*i), 30, 30);
  }
  
  //draw an animated column of 8 running notes
     for (int i = 0; i < 8; i++){ 
      fill (random(128));
      rect(70 + (40*i),350, 30, 30);
  }
  //draw a moving square across the animated column
  fill(255);
  rect(rectX,350,30,30);
    rectX = rectX + 5;
      // If x is greater than 310
  if (rectX >= 350) {
    // Set it back to 70
    rectX = rectX-280;
}
  //draw an invisible moving square across the octave column
  fill(255,255,255,0);
  rect(350,rectY,30,30);
    rectY = rectY + 5;
      // If x is greater than 350
  if (rectY >= 350) {
    // Set it back to 70
    rectY = rectY-280;
}

//trigger the sound samples with rectX and rectY    
  for (int i = 0; i < pos.length; i++) {

    if (rectX == pos[i] && a [i]) {
      b3.trigger();
    }
    if (rectX == pos[i] && b [i]) {
      a3.trigger();
    }
    if (rectX == pos[i] && c [i]) {
      g3.trigger();
    }
    if (rectX == pos[i] && d [i]) {
      f3.trigger();
    }
    if (rectX == pos[i] && e [i]) {
      e3.trigger();
    }
    if (rectX == pos[i] && f [i]) {
      d3.trigger();
    }
    if (rectX == pos[i] && g [i]) {
      c3.trigger();
    }
            if (rectX== pos[i] && rectY == 70 && oct [i]) {
      b4.trigger();
    }
        if (rectX== pos[i] && rectY == 110 && oct [i]) {
      a4.trigger();
    }
        if (rectX== pos[i] && rectY == 150 & oct [i]) {
      g4.trigger();
    }
        if (rectX== pos[i] && rectY == 190 & oct [i]) {
      f4.trigger();
    }
        if (rectX== pos[i] && rectY == 230 & oct [i]){
      e4.trigger();
    }    
         if (rectX== pos[i] && rectY == 270 & oct [i]) {
      d4.trigger();
    } 
        if (rectX== pos[i] && rectY == 310 & oct [i]) {
      c4.trigger();
    }
  }
}

//controls the state of the buttons
void mousePressed() {
  for (int i = 0; i < a.length; i++) {
    if (mouseX >= 70 + 40*i && mouseX <= 100 + 40*i && mouseY >= 70 && mouseY <= 110) 
    {
      a[i] = !a[i];
    }
  }
  for (int i = 0; i < b.length; i++) {
    if (mouseX >= 70 + 40*i && mouseX <= 100 + 40*i && mouseY >= 110 && mouseY <= 150) 
    {
      b[i] = !b[i];
    }
  }
  for (int i = 0; i < c.length; i++) {
    if (mouseX >= 70 + 40*i && mouseX <= 100 + 40*i && mouseY >= 150 && mouseY <= 190) 
    {
      c[i] = !c[i];
    }
  }
  for (int i = 0; i < d.length; i++) {
    if (mouseX >= 70 + 40*i && mouseX <= 100 + 40*i && mouseY >= 190 && mouseY <= 230) 
    {
      d[i] = !d[i];
    }
  }
  for (int i = 0; i < e.length; i++) {
    if (mouseX >= 70 + 40*i && mouseX <= 100 + 40*i && mouseY >= 230 && mouseY <= 270) 
    {
      e[i] = !e[i];
    }
  }
for (int i = 0; i < f.length; i++) {
    if (mouseX >= 70 + 40*i && mouseX <= 100 + 40*i && mouseY >= 270 && mouseY <= 310) 
    {
      f[i] = !f[i];
    }
  }

for (int i = 0; i < g.length; i++) {
    if (mouseX >= 70 + 40*i && mouseX <= 100 + 40*i && mouseY >= 310 && mouseY <= 350) 
    {
      g[i] = !g[i];
    }
  }
//octave column
for (int i = 0; i < oct.length; i++) {
    if (mouseX >= 350 && mouseX <= 380 && mouseY >= 70+(40*i) && mouseY <= 100+(40*i)) 
    {
      oct[i] = !oct[i];
    }
  }
  }

void keyPressed() {
  saveFrame("sequencer.png");
}


