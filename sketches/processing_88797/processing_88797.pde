
//conditions
color[]cstick={#D4823C,#73431F,#5E3213,#402512,#4C0E00};
color[]hd    ={#736c48,#f2e3b3,#f2a950,#d98032,#d95d30};
color []palette= cstick;
int choice;

int b= 0;
int f= 1;

float x;
float y;
float w=200;
float h=200;

void setup(){
size(600,600);
smooth();
rectMode(CENTER);
x = width/2;
y=height/2;
}

void draw(){
background(palette[b]);
fill(palette[f]);
noStroke();
rect(x,y,w,h);

if(mouseX > width/2){
w+=.5;
} else{w-=.5;}
if(mouseY > width/2){
h+=.5;
} else{h-=.5;}
w=constrain(w,0,600);
h=constrain(h,0,600);


}

void keyPressed(){
  b = int(random(1,5));
  f = int(random(1,5));
  int choice = key;
  switch(choice){
    case 49:
    palette = cstick;
    break;
    case 50:
    palette = hd;
    break;
  
  }

}

