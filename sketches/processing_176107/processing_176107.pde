
// A lot of the codes are from the website.
//"party" is term used in instructions (which is the one with all random colours, mad is for the party circles, orange is for the party background
//If I changed something or type in a code, I will mention, if not, it means it is copied exactly.

ArrayList<Particle> pts;
boolean onPressed, showInstruction, orange, winter, autumn, spring, summer, mad, winterx, autumnx, springx, summerx; //this is like a varialbe, true or false
PFont f;                            //I added the orange boolean to the summerx
PFont fo;
PImage photo;
float x;
float z = 0;

//This is just the set up
void setup() {
  size(1280, 710);
  smooth();
  frameRate(50);
  rectMode(CENTER);
  pts = new ArrayList<Particle>();

//This made-up command is a boolean and will be given as a setup (only in the beginning), and when "showInstruction" is activated, the letters will be like this
  showInstruction = true;
//f is a made-up shortcut for the format and the look of the font
  f = createFont("Phosphate", 90, true);
  fo = createFont("Phosphate", 30, true); // I added this font myself.
}

//This is saying "This command is forever: if 'showInstruction' is activated, the image I named season appears, and letter 'click drag blablabla' will be shown as such a colour,
// and is centred blablabla and is the width* height* is for where the text will be put
void draw() {
  //First, you should use preview and open a photo, then, just copy-paste an image from the internet and change the size so it's like four photos, then go to sketch and add sketch and add your image, and use the code to make it display. This is also from funprogramming
  if (showInstruction) {
  photo = loadImage("season.jpeg");
  image(photo,x,0);
    fill(255,255,180);
    textAlign(CENTER, CENTER);
    textFont(f);
    textLeading(90);
    text("Season Blub Bowls" +"\n"+
      "Click & Drag "
      ,width*0.39, height*0.33);
    textFont(fo);
    textLeading(30);
    text("Then press 'a', 's', 'd', 'f', 'p' to change season" + "\n" +
      "a=Spring / s=Summer / d=Autumn / f=winter / p=party x 3"
      , width*0.39, height*0.61); //I changed the position and text.
  }

//Below this, a code says that is mouse is clicked, "onPressed" will be activated (true), here it says if it is true, this will happen: drawing circle, the background covers. This one is copied exactly.
  if (onPressed) {
    for (int i=0; i<10; i++) {
      Particle newP = new Particle(mouseX,mouseY, i+pts.size(), i+pts.size());
      pts.add(newP);
    }
    
        
  }
  
  //The is a boolean, when these booleans are true, they are activated and the background will change colour, and for the mad part, it will change strokes and stuff. 
//This is the code I took from funprogramming for the background of random colours with the shapes.
        if (orange){
            float x = 0;
  while (x < width) {

    float y = 0;
    while(y < height) {
      fill(random(0,130), 255, 255); // I only changed this part for this "if" sentence.
      ellipse(20 + x, 20 + y, 60, 60);
      y = y + 40;
    }    
    
    x = x + 40;
  }
  
  z = z + 0.02;
}
       
        if (spring){
        background(0,125,75); //I did this and the following 3 if sentences by myself. Some backgrounds are not used but it is an option for someone else to use a different colour, to take as reference.
        }
        
        if (winter){
         // background(115,95,255);
         background(150,215,255);
        }
        
        if (summer){
          //background(220,40,40);
         //background(255,115,0);
        background(255,105,30);
        }
        
        if (autumn){
          background(120,60,0); 
        }

//This is how the particles (which in this case are the circles), will be displayed and then when the size is small as zero, it gets removed.
  for (int i=0; i<pts.size (); i++) {
    Particle p = pts.get(i);
    p.update();
    p.display();
  }

  for (int i=pts.size ()-1; i>-1; i--) {
    Particle p = pts.get(i);
    if (p.dead) {
      pts.remove(i);
    }
  }
  
  
}





//Here is what I mentioned when mouse is clicked, mousePressed is true.
void mousePressed(){
  onPressed = true;
  if (showInstruction) {
  showInstruction = false;
  orange = true; // Added by me. It will start as the background with shapes of random colours, for "party"
mad = true; // Added by me. And it will start as the circles with all random colours.
}
}

// When the mouse goes from clicked to nothing, the onPress will not work, and will shut down
void mouseReleased() {
  onPressed = false;
}

//This part is if you press a key, then one specific boolean assigned to the key will be true, and the other ones will not be true. Further instructions in the bottoms states what happens when the booleans are true.
void keyPressed() {
  if (key == 'p') { //I made all of this...
    orange = true;
    spring = false;
    winter = false;
    summer = false;
    autumn = false;
    mad = true;
    springx = false;
    winterx = false;
    summerx = false;
    autumnx = false;
  }
  
  if (key == 'a') {
    spring = true;
    orange = false;
    winter = false;
    summer = false;
    autumn = false;
    springx = true;
    mad = false;
    winterx = false;
    summerx = false;
    autumnx = false;
  }
  
  if (key == 'f') {
    winter = true;
    spring = false;
    orange = false;
    summer = false;
    autumn = false;
    winterx = true;
    springx = false;
    mad = false;
    summerx = false;
    autumnx = false;
  }
  
  if (key == 's') {
    summer = true;
    spring = false;
    winter = false;
    autumn = false;
    orange = false;
    summerx = true;
    springx = false;
    winterx = false;
    autumnx = false;
    mad = false;
  }
  
  if (key == 'd') {
    autumn = true;
    spring = false;
    orange = false;
    winter = false;
    summer = false;
    autumnx = true;
    springx = false;
    mad = false;
    winterx = false;
    summerx = false;
  } //... until here
}





//This is the particles part. the particle(...) is how much they will move vertically and horrizontally, and how much they get smaller everytime.
class Particle {
  PVector loc, vel, acc;
  int lifeSpan, passedLife;
  boolean dead;
  float alpha, weight, weightRange, decay, xOffset, yOffset;
  color c; //here it mentiones that the particle will the fill as "c"

  Particle(float x, float y, float xOffset, float yOffset) {
    loc = new PVector(x, y);

    float randDegrees = random(360);
    vel = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
    vel.mult(random(5));

    acc = new PVector(0, 0);
    lifeSpan = int(random(30, 90));
    decay = random(0.75, 0.9);
    //Here I say what the value of c will be using booleans. (booleans - as I understand - is mainly used when you put a keypressed in the void keyPressed, but the result you want to see belong to somewhere else (e.g. void draw / particle)  
    if (mad) { //I added from here
      c = color(random(0,255), random(0,255), random(0,255));
    }      
    if (springx) {
      //c = color(random(10,95),random(90,255),random(0,75));
      c = color(random(45,130),random(120,255),random(0,75));

    }
    if (winterx) {
      //c = color(95,random(115,255),255);
      //c = color (random(0,106),random(170,230),random(220,255));
      c = color(random(95,225),random(150,255),255);
    }
    if (summerx) {
     //c = color(random(150,255), random(0,185), random(0,20));
     //c = color(random(200,255), random(,200), random(0,20));
     c = color(random(225,255),random(0,240),0);
    }
    if (autumnx) {
     c = color(random(120,255),random(60,128),0); 
    } //to here
    
    weightRange = random(3, 50);

    this.xOffset = xOffset;
    this.yOffset = yOffset;
  }


  void update() {
    if (passedLife>=lifeSpan) {
      dead = true;
    } else {
      passedLife++;
    }

    alpha = float(lifeSpan-passedLife)/lifeSpan * 70+50;
    weight = float(lifeSpan-passedLife)/lifeSpan * weightRange;

    acc.set(0, 0);

    float rn = (noise((loc.x+frameCount+xOffset)*0.01, (loc.y+frameCount+yOffset)*0.01)-0.5)*4*PI;
    float mag = noise((loc.y+frameCount)*0.01, (loc.x+frameCount)*0.01);
    PVector dir = new PVector(cos(rn), sin(rn));
    acc.add(dir);
    acc.mult(mag);

    float randDegrees = random(360);
    PVector randV = new PVector(cos(radians(randDegrees)), sin(radians(randDegrees)));
    randV.mult(0.5);
    acc.add(randV);

    vel.add(acc);
    vel.mult(decay);
    vel.limit(3);
    loc.add(vel);
  }

//This is to tell how a new circle comes out smaller each time.
  void display() {
    strokeWeight(weight+0.1);
    stroke(c);
    point(loc.x, loc.y);
  }
}

//The changes usually have little difference from the original design. The image starts too big, so it doesn't show the whole image. I decided I would let it the way it is as I do not know how to fix it and I thought I could let it look like a powerpoint. I also made spring the biggest because green is the best for our eyes.
//I also changed the colour of the background for summer. I changed it from red to orange. It was because I found that red would be too bright and would sting people's eye, and is not pleasant. If the red was darker and less stinging, it doesn't feel like a red for summer.
//In my original plan, I had a dark blue included for winter, but I took it away as I thought the colours for winter should look more lighter like white snow.
//I also took away the purple from autumn because I did not think it fits autumn or contrasts with the background very well.
//I also changed the keys to change the season colour. Instead of using the first letter of seasons, I made it asdf for spring -> summer -> autumn -> winter relatively. I did it like that as I thought that is the order of seasons most people follow.
//I made p for party instead of m for mad or r for random or c for crazy. It is because I thought that I should give it an occasion or time like the seasons, so I thought party party party would be good.
//And I changed the name / title of this programme with some different pronunciation just to make it sound more interesting.

//I think the changes are small and it is about what I planned it to be. I have instructions with a season-pictures background that show at the beginning and will be gone when you start clicking or pressing.
//Also, the colours are pretty similar (red, yellow, and orange for summer / the mad or party one is pretty crazy, but that colour is laggy. However that cannot be fixed / green for spring, purple and light blue for winter, and orange and brown for autumn) as mentioned in the planning drawings.
//The circles do move in random directions like floating, while getting smaller and smaller. They also have a random-with-limits colours, and the same circle stay the same colour the whole time. 


