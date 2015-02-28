
PImage [] items = new PImage[23];
PShape bg1;
PImage background1;
PImage background2;

float rx, ry, tn;

int MODE = 0;


void setup(){
  size(640, 480);
  bg1 = loadShape("bg1.svg");
  background1 = loadImage("background1.png");
  background2 = loadImage("background2.png");
  
  for (int i = 0; i < items.length; i++){
    String imageName = "item-" + nf(i+1, 3) + ".png";
    items[i] = loadImage(imageName);
  }
  noLoop();
}

void draw(){
  if(random(0, 1) > 0.5){
    MODE=0;
  }else{
    MODE=1;
  }
  
  if(MODE==0){
    shape(bg1, 0, 0, width, height);
    background(background1);
    
    //tn = random(230, 255);
    
    //onigri
    rx = random(545, 570);
    ry = random(120, 320);
    for (int i = 0; i < 2; i++){
        if(random(0, 1) < 0.5){
          rx += 15;
          ry += 20;
          image(items[i], rx, ry);
          image(items[i], rx+30, ry+20);
        }
       }
    
    //ice cream
    rx = random(320, 260);
    ry = random(215, 325);
    for (int j = 3; (j < 8)&&(j > 2); j++){
        if(random(0, 1) < 0.75){
          rx += 15;
          ry += 20;
          image(items[j], rx, ry);
          image(items[j], rx+60, ry-30);
          
          /*if(random(0, 1) > 0.5){
            image(items[j], rx + 30, ry + 70);
          }*/
      }
    }
    
    //batteries 
    rx = random(180, 250);
    ry = random(220, 330);
    for (int k = 9; (k < 14)&&(k > 8); k++){
        if(random(0, 1) < 0.75){
          rx += -15;
          ry += 20;
          image(items[k], rx, ry);
          image(items[k], rx+45, ry);
      }
    }
    
    //sushi
    rx = random(-70, 200);
    ry = random(115, 140);
    for (int l = 15; (l < 18)&&(l > 14); l++){
      if(random(0, 1) < 0.7){
        rx += 70;
        //ry += 20;
        image(items[l], rx, ry);
        image(items[l], rx, ry+50);
      }
    }
    
    //duckies!
    for (int m = 22; (m < items.length)&&(m > 21); m++){
      if(random(0, 1) < 0.5){
        rx = random(7, 300);
        ry = random(30, 47);
        image(items[m], rx, ry);
        image(items[m], rx, ry-40);
    }
   }
   
   //strawberries
   rx = random(30, 75);
   ry = random(200, 390);
   for (int n = 18; (n < 22)&&(n > 17); n++){
     rx += -15;
     ry += 20;
     image(items[n], rx, ry);
     image(items[n], rx+20, ry+20);
     //image(items[n], rx-30, ry+20);
   }
 }
 
 if (MODE == 1){
   background(background2);
   
   //onigri
    rx = random(545, 570);
    ry = random(160, 310);
    for (int i = 0; i < 2; i++){
        if(random(0, 1) < 0.65){
          rx += 15;
          ry += 20;
          image(items[i], rx, ry);
          image(items[i], rx+30, ry+20);
      }
    }
    
    //ice cream
    rx = random(320, 260);
    ry = random(225, 310);
    for (int j = 3; (j < 8)&&(j > 2); j++){
        if(random(0, 1) < 0.75){
          rx += 15;
          ry += 20;
          image(items[j], rx, ry);
          image(items[j], rx+60, ry-30);
      }
    }
    
    //batteries 
    rx = random(180, 250);
    ry = random(220, 310);
    for (int k = 9; (k < 14)&&(k > 8); k++){
        if(random(0, 1) < 0.75){
          rx += -15;
          ry += 20;
          image(items[k], rx, ry);
          image(items[k], rx+45, ry);
      }
    }
    
    //sushi
    rx = random(10, 450);
    ry = random(115, 130);
    for (int l = 15; (l < 18)&&(l > 14); l++){
      if(random(0, 1) < 0.8){
        rx += 70;
        //ry += 20;
        image(items[l], rx, ry);
        image(items[l], rx, ry+50);
      }
    }
    
    //duckies!
    for (int m = 22; (m < items.length)&&(m > 21); m++){
      if(random(0, 1) < 0.7){
        rx = random(200, 580);
        ry = random(30, 47);
        image(items[m], rx, ry);
        image(items[m], rx, ry-40);
      }
    }
    
    //strawberries
    rx = random(30, 100);
    ry = random(30, 40);
    for (int n = 18; (n < 22)&&(n > 17); n++){
      if(random(0, 1) < 0.8){
         rx += 30;
         //ry += 20;
         image(items[n], rx, ry);
         image(items[n], rx, ry+35);
      }
    }
   }
   //saveFrame("thumbnail.jpg");
}void mousePressed(){
     redraw();
   }








