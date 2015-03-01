
PImage cat, wolf, flurrie, colors;
color brushColors;
int brush=3;

void setup(){
  size(900,900);
  background(255);
  smooth();
  cat=requestImage("wingcat.jpg");
  wolf=requestImage("wingwolf.png");
  flurrie=requestImage("Petuni.png");
  colors=requestImage("fullwheel.png");
}

void draw(){
  //colorMode(HSB, 360,100,100);
  //Draws ellipses
  if(mousePressed==true&&mouseButton==LEFT){
          noStroke();
          fill(brushColors);
          ellipse(mouseX,mouseY,brush,brush);
      }
   //stamp
   if(/*mousePressed==true){
       if(mouseButton==LEFT&&*/keyPressed==true){
         if(key=='f'||key=='F'){
           image(flurrie,mouseX,mouseY);
         }
       }
   
   //draws squares
   if(keyPressed==true){
         if(key=='t'||key=='T'){
           noStroke();
           fill(random(255),random(255),random(255));
           rect(mouseX,mouseY,brush,brush);
         }
       }
   
   //inverts image
   if(keyPressed==true){
         if(key=='i'||key=='I'){
           filter(INVERT);
         }
       }
   
   //causes effects to picture
   if(/*mousePressed==true){
       if(mouseButton==LEFT&&*/keyPressed==true){
         if(key=='r'||key=='R'){
           filter(BLUR,1);
           filter(ERODE,1);
           filter(POSTERIZE,3);
           
         }
       }
   
   //blurs image
   if(/*mousePressed==true){
       if(mouseButton==LEFT&&*/keyPressed==true){
         if(key=='u'||key=='U'){
           filter(BLUR,1);
         }
       }
   
   //erodes image
   if(/*mousePressed==true){
       if(mouseButton==LEFT&&*/keyPressed==true){
         if(key=='e'||key=='E'){
           filter(ERODE,1);
         }
       }
   
  //color select on the color wheel    
  if(mousePressed==true&&mouseButton==RIGHT){
      brushColors=get(mouseX,mouseY);
    }
    //makes brush size bigger
  if(keyPressed ==true &&key=='b'||key=='B'){
    brush+=1;
  }
  //makes brush size smaller
    else if(keyPressed==true && key=='s'||key=='S'){
      brush-=1;
    }
  //displays winged cat image
  else if(keyPressed==true && key=='c'||key=='C'){
    background(255);
    cat.resize(750,750);
    image(cat,135,125);
     }
   if(keyPressed==true&&key=='z'||key=='Z'){
     background(255);
   }
   
   if(keyPressed==true&&key=='w'||key=='W'){
     background(255);
     wolf.resize(800,800);
     image(wolf,25,50);
   }
    //positions color wheel in the upper left corner
  if(colors.width>0){
    image(colors,0,0,200,200);
  }
  
}

  
PImage cat, wolf, flurrie, colors;
color brushColors;
int brush=3;

void setup(){
  size(900,900);
  background(255);
  smooth();
  cat=requestImage("wingcat.jpg");
  wolf=requestImage("wingwolf.png");
  flurrie=requestImage("Petuni.png");
  colors=requestImage("fullwheel.png");
}

void draw(){
  //colorMode(HSB, 360,100,100);
  //Draws ellipses
  if(mousePressed==true&&mouseButton==LEFT){
          noStroke();
          fill(brushColors);
          ellipse(mouseX,mouseY,brush,brush);
      }
   //stamp
   if(/*mousePressed==true){
       if(mouseButton==LEFT&&*/keyPressed==true){
         if(key=='f'||key=='F'){
           image(flurrie,mouseX,mouseY);
         }
       }
   
   //draws squares
   if(keyPressed==true){
         if(key=='t'||key=='T'){
           noStroke();
           fill(random(255),random(255),random(255));
           rect(mouseX,mouseY,brush,brush);
         }
       }
   
   //inverts image
   if(keyPressed==true){
         if(key=='i'||key=='I'){
           filter(INVERT);
         }
       }
   
   //causes effects to picture
   if(/*mousePressed==true){
       if(mouseButton==LEFT&&*/keyPressed==true){
         if(key=='r'||key=='R'){
           filter(BLUR,1);
           filter(ERODE,1);
           filter(POSTERIZE,3);
           
         }
       }
   
   //blurs image
   if(/*mousePressed==true){
       if(mouseButton==LEFT&&*/keyPressed==true){
         if(key=='u'||key=='U'){
           filter(BLUR,1);
         }
       }
   
   //erodes image
   if(/*mousePressed==true){
       if(mouseButton==LEFT&&*/keyPressed==true){
         if(key=='e'||key=='E'){
           filter(ERODE,1);
         }
       }
   
  //color select on the color wheel    
  if(mousePressed==true&&mouseButton==RIGHT){
      brushColors=get(mouseX,mouseY);
    }
    //makes brush size bigger
  if(keyPressed ==true &&key=='b'||key=='B'){
    brush+=1;
  }
  //makes brush size smaller
    else if(keyPressed==true && key=='s'||key=='S'){
      brush-=1;
    }
  //displays winged cat image
  else if(keyPressed==true && key=='c'||key=='C'){
    background(255);
    cat.resize(750,750);
    image(cat,135,125);
     }
   if(keyPressed==true&&key=='z'||key=='Z'){
     background(255);
   }
   
   if(keyPressed==true&&key=='w'||key=='W'){
     background(255);
     wolf.resize(800,800);
     image(wolf,25,50);
   }
    //positions color wheel in the upper left corner
  if(colors.width>0){
    image(colors,0,0,200,200);
  }
  
}

  


