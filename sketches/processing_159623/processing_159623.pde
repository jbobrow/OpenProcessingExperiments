
//"A line is a dot that went for a walk." - Paul Klee
//Simple drawing algorithm that draws radial patterns
//Color & Length of lines vary (noise)
//Press 'm' to toggle Mirror, ' ' (SPACE) to export as image
//Press 'r' to restart (Uses mouse X for setting initial hue)
//Created by @rasagy

float rad, r, x1, y1, x2, y2;
float n=0, baseHue=random(50);
boolean mod=true, mirror = false, interact=false;

void setup() {
  size(500, 500);
  colorMode(HSB, 100);
  background(99);
  rad=-PI/2; 
  r=width/4; 
  x1=0; 
  y1=0; 
  x2=0; 
  y2=0; 
  n=random(5);
  strokeWeight(2);
}

void draw() {
  if (rad<6*PI-PI/2) 
  {
    rad+=0.01+noise(n+rad/10)/50;

    stroke((noise(n+rad/10)*80+baseHue)%100, 60, 70+random(5), 20);    

    if (mod) {
      r=r+(noise(n+rad/10)*5)-2;
    } else {
      r=r-(noise(n+rad/10)*5)+2;
    }

//    println(r + " - " + ((mod)?"+":"-"));
    if (r>width*0.4) mod=false;
    if (r<width*0.1) mod=true;

    x1= width/2 + (r*cos(rad));
    y1= height/2 + (r*sin(rad));
    x2= width/2 + (r*cos(rad+PI));
    y2= height/2 + (r*sin(rad+PI));
    line(x1, y1, x2, y2);
    
    if(mirror)
      line(width-x1, y1, width-x2, y2);
  }
}

void mousePressed() {
//  setup();
}

void keyPressed() {
  if (key == 'm' || key == 'M')
    mirror = (mirror)? false:true;
  else if (key == ' ')
    saveFrame("###.png");
  else if(key == 'r' || key == "R")
  {
    baseHue=map(mouseX, 0, width, 0, 100);
    setup();
  }
}



