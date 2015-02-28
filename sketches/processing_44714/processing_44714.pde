
void setup(){
size(600,600);
background(230);
frameRate(50);
}
int trigger = 0;
int flowtrigger = 0;
float x = 0;
float y = 0;
float counter = 0;
float farbex=0;
float farbey=0;

void draw(){
  
 fill(random(50,200),farbex,random(30,100),10000/(dist(mouseX,mouseY,pmouseX,pmouseY)*3));
 
 
if(keyPressed){if(key=='d') farbex=farbex+2;
if (key=='f') farbex=farbex-2;
}

if(farbex>240){farbex=240;}
if(farbex<0){farbex=0;}


if(keyPressed){if(key=='a') farbey=farbey+2;
if (key=='s') farbey=farbey-2;
}

if(farbey>240){farbey=240;}
if(farbey<0){farbey=0;}
 
  
if(keyPressed){
  if(key==' ') background(230);
}
  

if(keyPressed){
if(key=='e') trigger = 1;
}
if(keyPressed){
if(key=='w') trigger = 0;
}
if(keyPressed){
if(key=='r') trigger = 2;
}
if(keyPressed){
if(key=='t') trigger = 3;
}
if(keyPressed){
if(key=='z') trigger = 4;
}
if(keyPressed){
if(key=='u') trigger = 5;
}



if(mousePressed){
  if(trigger == 0){stroke(dist(mouseX,mouseY,pmouseX,pmouseY));
  strokeWeight(dist(mouseX,mouseY,pmouseX,pmouseY));
line(mouseX,mouseY,pmouseX,pmouseY);
strokeWeight(1);
}
if(trigger == 1){noStroke();
  ellipse(mouseX-random(80)+40,mouseY-random(80)+40,dist(mouseX,mouseY,pmouseX,pmouseY),dist(mouseX,mouseY,pmouseX,pmouseY));
}
if(trigger == 2){stroke(1);
  quad(mouseX,mouseY, 300, 300, 280, 280, 315, 315);
  ellipse(mouseX,mouseY,20,20);
}
if(trigger == 3){noStroke();
  rect(mouseX, mouseY, counter, 40);
 
counter = counter+2;

    if(counter > 50){ counter= 0;
         y = 0;
       }
    
}
if(trigger == 4){noStroke();
  flowtrigger=1;
}
if(trigger == 5){stroke(1);

counter = counter+2;
    if(counter <600){triangle(mouseX, mouseY, 0, counter, 0, counter+30);
    }

    if(counter > 600){if(counter < 1200){ triangle(mouseX, mouseY, counter-600,600 ,counter+30-600, 600);
    }}

    if(counter > 1200){if(counter<1800){triangle(mouseX, mouseY,600,1770-counter+30,600, 1770-counter);
    }}
    if(counter > 1800){triangle(mouseX, mouseY,2370-counter+30,0, 2370-counter,0);
    }
    if(counter > 2400){ counter = 0;}
}

}

if(flowtrigger == 1){


 ellipse(mouseX+x,mouseY+y,30,30);
 ellipse(mouseX-x,mouseY-y,30,30);
 ellipse(mouseX+x,mouseY-y,30,30);
 ellipse(mouseX-x,mouseY+y,30,30);
 y= y+2;
  x= x+2;
  if(x == 100){y=0;
  x=0;
  flowtrigger = 0;
  }

}

}

