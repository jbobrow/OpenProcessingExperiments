
float x;
float y;
float k;
float d;
float r;
float g;
float b;
boolean lapiz=false;
boolean colo=false;
boolean circ=false;
boolean back=false;
boolean bol=false;
boolean goma=false;
void setup()
{size(400,400);}

void draw()
{fill(0);
rect(0,0,40,40);
fill(#EA05D4);
rect(0,40,40,40);
fill(#DFB0E5);
rect(0,80,40,40);
r=random(255);
g=random(255);
b=random(255);
fill(r,g,b);
rect(0,120,40,40);
fill(#FA7B19);
rect(0,160,40,40);
fill(255);
stroke(0);
rect(0,200,40,40);
if(lapiz==true){
  if (mousePressed){
    stroke(0);
    line(pmouseX,pmouseY,mouseX,mouseY);}}
    
    if(colo==true){
      if(mousePressed){
        stroke(#EA05D4);
        line(pmouseX,pmouseY,mouseX,mouseY);}}
        
        if(circ==true){
          if(mousePressed){
            stroke(0);
            fill(r,g,b);
            x=random(0,400);
            y=random(0,400);
            rect(x,y,10,10);
            }}
            
            if(back==true){
              if(mousePressed){
                background(r,g,b);}}
                
                if(bol==true){
                  if(mousePressed){
                    stroke(0);
                    fill(r,g,b);
                   k=random(0,400);
                   d=random(0,400);
                    ellipse(k,d,20,20);
                   }}
                   
                   if(goma==true){
                     if(mousePressed){
                       background(255);}}}
                  

void mousePressed(){
    if (mouseX>0 && mouseX<40 && mouseY>0 && mouseY<40){
      lapiz=!lapiz;}
      if(mouseX>0 && mouseX<40 && mouseY>40 && mouseY<80){
        colo=!colo;}
        if(mouseX>0 && mouseX<40 && mouseY>80 && mouseY<120){
          circ=!circ;}
          if(mouseX>0 && mouseX<40 && mouseY>120 && mouseY<160){
            back=!back;}
            if(mouseX>0 && mouseX<40 && mouseY>160 && mouseY<200){
              bol=!bol;}
              if(mouseX>0 && mouseX<40 && mouseY>200 && mouseY<240){
                goma=!goma;}}

