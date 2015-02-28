
/*

Recreation of Frank Stella's Empress of India
By Sharon Shin 2010
  Press 'q' because neon lights in the nights are fun
  Press 'w' because it's safer to stay in the daylight
  Press 'e' because fluffy.
  Press 'r' because bold.

 */

int Sat,Alpha,Bright,Void;
color Brown, Red, Green, Yellow, bgColor, testColor;
int[]Start=new int[4];
int[]End=new int[4];


void setup(){
  size(1000,370);
  colorMode(HSB,360);
  
  background(bgColor);
  bgColor = color(0,0,360);
  testColor = color(180,360,360);
  frameRate(10);
  
  Alpha = 300;
  Sat = 360;
  Bright = 360;
  
  Red = color(0,Sat,Bright-Bright/3,Alpha);
  Brown = color(30,Sat,Bright/2,Alpha);
  Green = color(120,Sat-Sat/3,Bright/2,Alpha);
  Yellow = color(50,Sat,Bright-Bright/4,Alpha);
  
 for(int k=0; k<4; k++){
  Start[k] = color(360,Sat,Bright);
  End[k] = color(180,Sat,Bright);
 }

  smooth();
}

/*
notes: 
for loop int: j,k,i
float: percentage 
*/

void draw () {
//  background(bgColor);

 //color animation
 for(int k=0; k<4; k++){
    Start[k] = color((hue(Start[k])+36)%360,
                   (saturation(Start[k])),
                   (brightness(Start[k])));

    End[k] = color((hue(End[k])+36)%360,
                   (saturation(End[k])),
                   (brightness(End[k])));
                   
 }
 
 
//lerp colors

/*println("---");
println("---");*/

for(int i=0;  i < 11; i++)
{
//println("i is " + i + ", Start is " + Start[0] + " and  End is " + End [0]);

float percentage=i*.1;
fill(lerpColor(Start[0],End[0],percentage));
triangle(-i*12, i*12, (width/5)-(i*20), height+(12*i), 2*(width/5)-(i*20), i*12);

fill(lerpColor(Start[1],End[1],percentage));
triangle(width/5, height+(25*i), 2*(width/5), 25*i, 3*(width/5), height+(25*i));

fill(lerpColor(Start[2],End[2],percentage)); 
triangle(2*(width/5),-25*i, 3*(width/5), height-(25*i), 4*(width/5),-25*i);

fill(lerpColor(Start[3],End[3],percentage));
triangle(3*(width/5)+(i*20), height-(12*i), 4*(width/5)+(i*20), -12*i, width+(i*20), height-12*i);
}

//base triangle color; carefully placed here to be btwn lerp and strokes
fill(Brown);
triangle(0, 0, width/5, height, 2*(width/5), 0);
fill(Green);
triangle(width/5, height, 2*(width/5), 0, 3*(width/5), height);
fill(Red);
triangle(2*(width/5), 0, 3*(width/5), height, 4*(width/5), 0);
fill(Yellow);
triangle(3*(width/5), height, 4*(width/5), 0, width, height);

//triangle strokes
for(int j=0;  j < 10; j++){
stroke(bgColor);
noFill();
triangle(-j*12, j*12, (width/5)-(j*20), height+(12*j), 2*(width/5)-(j*20), j*12);
triangle(width/5, height+(25*j), 2*(width/5), 25*j, 3*(width/5), height+(25*j));
triangle(2*(width/5),-25*j, 3*(width/5), height-(25*j), 4*(width/5),-25*j);
triangle(3*(width/5)+(j*20), height-(12*j), 4*(width/5)+(j*20), -12*j, width+(j*20), height-12*j);
line(0,0,width,0);
}

//bgColor triangles (hides extra mess)
noStroke();
fill(bgColor);
triangle(-10*12, 10*12, (width/5)-(10*20), height+(12*10), 2*(width/5)-(10*20), 10*12);
triangle(width/5, height+(25*10), 2*(width/5), 25*10, 3*(width/5), height+(25*10));
triangle(2*(width/5),-25*10, 3*(width/5), height-(25*10), 4*(width/5),-25*10);
triangle(3*(width/5)+(10*20), height-(12*10), 4*(width/5)+(10*20), -12*10, width+(10*20), height-12*10);
triangle(0,0,width/5, height,0,height);
triangle(width,0,4*width/5, 0,width,height);

}

void keyPressed(){
  if (key == 'q' || key == 'Q')
    bgColor=color(0,0,0);
      else if(key=='w'|| key == 'W')
      bgColor=color(360);  
      else if (key=='e'|| key == 'E')
       bgColor=color((randomInt(0,360)+72)%360,Sat-Sat/3,Sat);
      else if (key=='r'|| key == 'R')
       bgColor=color((randomInt(0,360)+72)%360,Sat,Bright/2);
    
}
int randomInt (int MIN, int MAX) {
  return floor(random(MIN, MAX+1));
}


